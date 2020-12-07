<template>
  <div>
    <categoriesModals ref="child" @saveDtb="save" />
    <div class="col-12">
      <div class="col-4">
        <a-button type="primary" @click="show" :method="save">
          Thêm mới
        </a-button>
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
          style="width:50px"
          ><a-icon type="edit"
        /></a-button>

        <a-popconfirm
          title="Bạn muốn xoá category này?"
          ok-text="Xác nhận"
          cancel-text="Huỷ"
          @confirm="softdelted(record)"
        >
          <a-button size="small" type="danger" style="width:50px"
            ><a-icon type="delete"
          /></a-button>
        </a-popconfirm>
      </template>
    </a-table>
  </div>
</template>

<script>
import categoriesModals from "../components/modals/categories_modals";
import axios from "axios";

export default {
  data() {
    return {
      dataNews: [],
      search: "",
      editedItem: {
        name: ""
      },
      columns: [
        {
          title: "Tiêu đề ",
          dataIndex: "name",
          className: "name",
          width: "70%"
        },

        {
          title: "Action",
          dataIndex: "",
          key: "x",
          scopedSlots: { customRender: "action" },
          width: "30%",
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
      console.log("day la item name");
      console.log(item.name);
      if (index == -1) {
        let formData = new FormData();
        formData.append("category[name]", item.name);
        axios
          .post(`http://localhost:3000/api/categories`, formData, {
            headers: {
              "Content-Type": "application/json"
            }
          })
          .then(response => {
            console.log("Created!");
            this.initialize();
            this.$refs.child.close();
            this.$message.success("Tạo category thành công");
          })
          .catch(error => {
            console.log(error);
          });
      } else {
        let formData = new FormData();
        formData.append("category[name]", item.name);
        axios
          .put(`http://localhost:3000/api/categories/${item.id}`, formData, {
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
        .get("http://localhost:3000/api/categories")
        .then(response => {
          console.log("day la restpost data ");
          console.log(response.data);
          this.dataNews = response.data;
        })
        .catch(e => {
          console.log(e);
        });
    },
    softdelted(item) {
      var id = item.id;
      axios
        .delete(`http://localhost:3000/api/categories/` + id)
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
    categoriesModals
  },
  computed: {  
    onsearch(){
      if(this.search){
      return this.dataNews.filter((item)=>{
        return this.search.toLowerCase().split(' ').every(v => item.name.toLowerCase().includes(v))
      })
      }else{
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
