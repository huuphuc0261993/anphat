<template>
  <div>
    <a-row>
      <a-col :xs="12">
        <div >
          <a-input-search
            placeholder="input search text"
            size="large"
            v-model="search"
            class="search_list_order"
          />
        </div>
      </a-col>
    </a-row>
    <a-table
      bordered
      :data-source="onsearch"
      :columns="columns"
      :row-key="record => record.id"
    >

      <template slot="picture" slot-scope="picture">
        <a-avatar :src="picture" />
      </template>
    </a-table>
  </div>
</template>

<script>
import axios from "axios";
import { ProductColumns } from "../utils/columns/list_order";
import { URLS } from "../utils/url";
export default {
  data() {
    return {
      dataNews: [],
      categories: [],
      search: "",    
      editedItem: {},
      columns: ProductColumns.cols
    };
  },
  mounted() {
    this.initialize();
  },
  methods: {
    initialize() {
      return axios
        .get(URLS.ORDER_ITEMS())
        .then(response => {
          this.dataNews = response.data;
          this.dataNews.reverse()
          console.log(this.dataNews)
        })
        .catch(e => {
          console.log(e);
        });
    },
  },
  components: {
  },
  computed: {
    onsearch() {
      if (this.search) {
        return this.dataNews.filter(item => {
          return (
            this.search
              .toLowerCase()
              .split(" ")
              .every(v => item.order.customer.name.toLowerCase().includes(v)) ||
              this.search
              .toLowerCase()
              .split(" ")
              .every(v => item.order.customer.created_at.toLowerCase().includes(v)) ||
              this.search
              .toLowerCase()
              .split(" ")
              .every(v => item.product.name.toLowerCase().includes(v)) ||
              this.search
              .toLowerCase()
              .split(" ")
              .every(v => item.order.customer.email.toLowerCase().includes(v))
          );
        });
      } else {
        return this.dataNews;
      }
    }
  }
};
</script>
<style scoped>
.highlight {
  background-color: rgb(255, 192, 105);
  padding: 0px;
}
.search_list_order{
  margin-bottom: 2%
}
</style>
