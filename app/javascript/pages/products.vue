<template>
  <div>
    <productsModals ref="child" @saveDtb="save" />
    <a-row>
      <a-col :xs="12">
        <div class="col-8">
          <a-input-search
            placeholder="input search text"
            size="large"
            v-model="search"
          />
        </div>
      </a-col>
      <a-col :xs="12">
        <div class="col-4">
          <a-row class="table-buttons">
            <a-col :span="24" class="text-right">
              <a-button type="primary" @click="show" :method="save">{{
                "Thêm mới sản phẩm"
              }}</a-button>
            </a-col>
          </a-row>
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

      <template slot="action" slot-scope="text, record">
        <a-button
          @click="editProduct(record)"
          class="editButton"
          :type="'primary'"
          style="width:100px"
          ><a-icon type="edit"
        /></a-button>

        <a-popconfirm
          title="Bạn muốn xoá category này?"
          ok-text="Xác nhận"
          cancel-text="Huỷ"
          @confirm="softdelted(record)"
        >
          <a-button size="small" type="danger" style="width:100px"
            ><a-icon type="delete"
          /></a-button>
        </a-popconfirm>
      </template>
    </a-table>
  </div>
</template>

<script>
import productsModals from "../components/modals/products_modals";
import axios from "axios";
import { ProductColumns } from "../utils/columns/product";
import { URLS } from "../utils/url";
export default {
  data() {
    return {
      dataNews: [],
      categories: [],
      search: "",
      picture_attributes: [
        {
          id: "",
          url: ""
        }
      ],
      editedItem: {},
      columns: ProductColumns.cols
    };
  },
  mounted() {
    this.initialize();
  },
  methods: {
    // kich hoat su kien tu child
    show() {
      this.$refs.child.showModal();
    },
    save(product, index) {
      if (index == -1) {
        axios
          .post(URLS.PRODUCTS(), {
            product: product
          })
          .then(response => {
            console.log("Created!");
            this.initialize();
            this.$refs.child.close();
            this.$message.success("Tạo sản phẩm thành công");
          })
          .catch(error => {
            console.log(error);
          });
      } else {
        axios 
          .put(URLS.PRODUCT(product.id), {
            product: product
          })
          .then(response => {
            this.initialize();
            this.$refs.child.close();
            this.$message.success("Cập nhật bài viết thành công");
          })
          .catch(error => {
            console.log(error);
          });
      }
    },
    editProduct(item) {
      this.$refs.child.edit(item);
    },
    initialize() {
      return axios
        .get(URLS.PRODUCTS())
        .then(response => {
          this.dataNews = response.data;
        })
        .catch(e => {
          console.log(e);
        });
    },
    softdelted(item) {
      var id = item.id;
      axios
        .delete(URLS.PRODUCT(id))
        .then(response => {
          this.initialize();
        })
        .catch(error => {
          console.log(error);
        });
      this.dataNews.splice(item, 1);
    }
  },
  components: {
    productsModals
  },
  computed: {
    onsearch() {
      if (this.search) {
        return this.dataNews.filter(item => {
          return (
            this.search
              .toLowerCase()
              .split(" ")
              .every(v => item.category.name.toLowerCase().includes(v)) ||
            this.search
              .toLowerCase()
              .split(" ")
              .every(v => item.name.toLowerCase().includes(v))
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
</style>
