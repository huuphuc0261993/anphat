<template>
  <div>
    <newsModals ref="child" @saveDtb="save" />

    <a-button type="primary" @click="show" :method="save">
      Thêm mới
    </a-button>

    <a-table
      bordered
      :data-source="dataNews"
      :columns="columns"
      :row-key="record => record.id"
    >
      <template slot="image" slot-scope="image">
        <span>
          <a-avatar shape="square" :size="60" :src="image.url" />
        </span>
      </template>

      <template slot="action" slot-scope="text, record">
        <a-button
          @click="editNews(record)"
          class="editButton"
          :type="'primary'"
          style="width:50px"
          ><a-icon type="edit"
        /></a-button>

        <a-popconfirm
          title="Bạn muốn xoá News này?"
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
import newsModals from "../components/modals/news_modals";
import axios from "axios";

export default {
  data() {
    return {
      file: "",
      dataNews: [],
      searchText: "",
      searchInput: null,
      searchedColumn: "",
      editedItem: {
        title: "",
        image: "",
        description: "",
        content: ""
      },
      columns: [
        {
          title: "Tiêu đề ",
          dataIndex: "title",
          className: "title",
          width: "25%"
        },
        {
          title: "Hình ảnh",
          dataIndex: "image",
          scopedSlots: { customRender: "image" },
          width: "10%",
          align: "center"
        },
        {
          title: "Mô tả",
          dataIndex: "description",
          width: "40%"
        },
        {
          title: "Ngày tạo",
          dataIndex: "created_at",
          width: "15%"
        },
        {
          title: "Action",
          dataIndex: "",
          key: "x",
          scopedSlots: { customRender: "action" },
          width: "10%",
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
      if (index == -1) {
        let formData = new FormData();
        formData.append("news[title]", item.title);
        formData.append("news[description]", item.description);
        formData.append("news[content]", item.content);
        formData.append("news[image]", item.image.originFileObj);
        axios
          .post(`http://localhost:3000/api/news`, formData, {
            headers: {
              "Content-Type": "application/json"
            }
          })
          .then(response => {
            console.log("Created!");
            this.initialize();
            this.$refs.child.close();
            this.$message.success("Tạo bài viết thành công");
          })
          .catch(error => {
            console.log(error);
          });
      } else {
        let formData = new FormData();
        formData.append("news[title]", item.title);
        formData.append("news[description]", item.description);
        formData.append("news[content]", item.content);
        formData.append("news[image]", item.image.originFileObj);
        axios
          .put(`http://localhost:3000/api/news/${item.id}`, formData, {
            headers: {
              "Content-Type": "application/json"
            }
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
    editNews(item) {
      this.$refs.child.edit(item);
    },

    initialize() {
      return axios
        .get("http://localhost:3000/api/news")
        .then(response => {
          this.dataNews = response.data;
          this.dataNews = JSON.parse(JSON.stringify(this.dataNews));
        })
        .catch(e => {
          console.log(e);
        });
    },
    softdelted(item) {
      var id = item.id;
      axios
        .delete(`http://localhost:3000/api/news/` + id)
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
    newsModals
  },
  computed: {}
};
</script>
<style scoped>
.highlight {
  background-color: rgb(255, 192, 105);
  padding: 0px;
}
</style>
