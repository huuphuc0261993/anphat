<template>
  <div>
    <a-row>
      <a-col :xs="12" >
        <div >
          <a-button type="primary" @click="show" :method="save">
            Thêm mới
          </a-button>
        </div>
      </a-col>
      <a-col :xs="12">
        <div >
          <a-input-search
            placeholder="input search text"
            size="large"
            v-model="search"
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
      <template slot="action" slot-scope="text, record">
        <a-button
          @click="editNews(record)"
          class="editButton"
          :type="'primary'"
          style="width:70px"
          ><a-icon type="edit"
        /></a-button>

        <a-popconfirm
          title="Bạn muốn xoá?"
          ok-text="Xác nhận"
          cancel-text="Huỷ"
          @confirm="softdelted(record)"
        >
          <a-button size="small" type="danger" style="width:70px"
            ><a-icon type="delete"
          /></a-button>
        </a-popconfirm>
      </template>
    </a-table>
  </div>
</template>

<script>
import info from "../components/info/info";
import axios from "axios";
import { URLS } from "../utils/url";
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
          dataIndex: "title",
          className: "title",
          width: "30%"
        },
        {
          title: "Mô tả",
          dataIndex: "description",
          className: "description",
          width: "50%"
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
      this.$router.push({ name: "Info_Detail" });
    },
    save(item, index) {
      if (index == -1) {
        let formData = new FormData();
        formData.append("category[name]", item.name);
        axios
          .post(URLS.INFORMATIONS(), formData, {
            headers: {
              "Content-Type": "application/json"
            }
          })
          .then(response => {
            console.log("Created!");
            this.initialize();
            this.$refs.child.close();
            this.$message.success("Tạo thành công");
          })
          .catch(error => {
          });
      } else {
        let formData = new FormData();
        formData.append("category[name]", item.name);
        axios
          .put(URLS.INFORMATION(item.id), formData, {
            headers: {
              "Content-Type": "application/json"
            }
          })
          .then(response => {
            this.initialize();
            this.$refs.child.close();
            this.$message.success("Cập nhật thành công");
          })
          .catch(error => {
            console.log(error);
          });
      }
    },
    editNews(item) {
      let idItem = item.id
      this.$router.push({ name: "Info_Detail", params: {id: idItem}});
    },
    initialize() {
      return axios
        .get(URLS.INFORMATIONS())
        .then(response => {
          this.dataNews = response.data;
        })
        .catch(e => {
        });
    },
    softdelted(item) {
      var id = item.id;
      axios
        .delete(URLS.INFORMATION(id))
        .then(response => {
          this.initialize();
        })
        .catch(error => {
        });
      this.dataNews.splice(item, 1);
    }
  },
  components: {
    info
  },
  computed: {
    onsearch() {
      if (this.search) {
        return this.dataNews.filter(item => {
          return this.search
            .toLowerCase()
            .split(" ")
            .every(v => item.title.toLowerCase().includes(v));
        });
      } else {
        return this.dataNews;
      }
    }
  }
};
window.onpopstate = function () {
    location.reload()
};
</script>
<style scoped>
.highlight {
  background-color: rgb(255, 192, 105);
  padding: 0px;
}
</style>
