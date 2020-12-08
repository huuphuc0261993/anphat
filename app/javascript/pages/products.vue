<template>
  <div>
    <productsModals ref="child" @saveDtb="save" />
    <div class="col-12">
      <div class="col-4">
        <a-row class="table-buttons">
          <a-col :span="24" class="text-right">
            <a-button type="primary" @click="show" :method="save">{{
              "Thêm mới sản phẩm"
            }}</a-button>
            <a-button type="default" class="yellow-btn">
              <a-icon type="reload"></a-icon>
            </a-button>
          </a-col>
        </a-row>
      </div>
      <div class="col-8">
        <a-input-search
          placeholder="input search text"
          enter-button="Search"
          size="large"
          v-model="search"
        />
      </div>
    </div>

    <a-table
      bordered
      :data-source="onsearch"
      :columns="columns"
      :row-key="record => record.id"
    >
      <template slot="action" slot-scope="text, record">
        <a-button
          @click="editNews(record)"
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
import productsModals from "../components/modals/prodcuts_modals";
import axios from "axios";

export default {
  data() {
    return {
      dataNews: [],
      categories: [],
      search: "",
      editedItem: {
        name: "",
        price: "",
        description: "",
        discount: "",
        price_sale: "",
        category_id: ""
      },
      columns: [
        {
          title: "Tên sản phẩm",
          dataIndex: "name",
          className: "name",
          width: "30%"
        },
        {
          title: "Giá ",
          dataIndex: "price",
          className: "price",
          width: "20%"
        },
        {
          title: "Loại sản phẩm ",
          dataIndex: "category.name",
          className: "category",
          width: "30%"
        },
        {
          title: "Action",
          dataIndex: "",
          key: "x",
          scopedSlots: { customRender: "action" },
          width: "20%",
          align: "center"
        }
      ]
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
    save(item, index) {
      console.log("day la item");
      console.log(item);
      if (index == -1) {
        let formData = new FormData();
        formData.append("product[name]", item.name);
        formData.append("product[price]", item.price);
        formData.append("product[description]", item.description);
        formData.append("product[discount]", item.discount);
        formData.append("product[price_sale]", item.price_sale);
        formData.append("product[category_id]", item.category_id);
        axios
          .post(`http://localhost:3000/api/products`, formData, {
            headers: {
              "Content-Type": "application/json"
            }
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
        let formData = new FormData();
        formData.append("product[name]", item.name);
        formData.append("product[price]", item.price);
        formData.append("product[description]", item.description);
        formData.append("product[discount]", item.discount);
        formData.append("product[price_sale]", item.price_sale);
        formData.append("product[category_id]", item.category_id);
        axios
          .put(`http://localhost:3000/api/products/${item.id}`, formData, {
            headers: {
              "Content-Type": "application/json"
            }
          })
          .then(response => {
            this.initialize();
            this.$refs.child.close();
            this.$message.success("Cập nhật category thành công");
          })
          .catch(error => {
            console.log(error);
          });
      }
    },
    editNews(item) {
      this.$refs.child.edit(item);
    },
    initialize() {
      return axios
        .get("http://localhost:3000/api/products")
        .then(response => {
          console.log("day la data tra ve")
          console.log(response.data)
          this.dataNews = response.data;
        })
        .catch(e => {
          console.log(e);
        });
    },
    softdelted(item) {
      var id = item.id;
      axios
        .delete(`http://localhost:3000/api/products/` + id)
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
          return this.search
            .toLowerCase()
            .split(" ")
            .every(v => item.name.toLowerCase().includes(v));
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
