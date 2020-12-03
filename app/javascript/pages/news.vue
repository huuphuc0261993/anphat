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
      <template slot="name" slot-scope="text, record">
        <editable-cell
          :text="text"
          @change="onCellChange(record.key, 'name', $event)"
        />
      </template>

      <template slot="action" slot-scope="text, record">
        <a-button @click="editNews(record)" :size="'small'" :type="'primary'"
          ><a-icon type="edit"
        /></a-button>

        <a-popconfirm
          title="Bạn muốn xoá cửa hàng này?"
          ok-text="Xác nhận"
          cancel-text="Huỷ"
          @confirm="softdelted(record)"
        >
          <a-button size="small" type="danger"
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
          title: "Name",
          dataIndex: "title"
        },
        {
          title: "Image",
          dataIndex: "image"
          // render: theImageURL => <img alt={theImageURL} src={theImageURL} />
        },
        {
          title: "Description",
          dataIndex: "description"
        },
        {
          title: "Action",
          dataIndex: "",
          key: "x",
          scopedSlots: { customRender: "action" }
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
        formData.append("news[image]", item.image);
        console.log(formData);
        axios
          .post(`http://localhost:3000/api/news`, formData, {
            // news: item,
            headers: {
              "Content-Type": "application/json"
            }
          })
          .then(response => {
            console.log("Created!");
            this.initialize();
            this.$refs.child.close();
            this.$message.success('Tạo bài viết thành công');
          })
          .catch(error => {
            console.log(error);
          });
      } else {
        console.log(item);
        console.log(item.id);
        axios
          .put(`http://localhost:3000/api/news/${item.id}`, {
            id: item.id,
            title: item.title,
            image: item.image,
            description: item.description,
            content: item.content
          })
          .then(response => {
            console.log(response);
            this.initialize();
            this.$refs.child.close();
            this.$message.success('Cập nhật bài viết thành công');
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
  }
};
</script>
<style scoped>
.highlight {
  background-color: rgb(255, 192, 105);
  padding: 0px;
}
.buttonType {
  width: 200px;
  border: hidden;
  margin-bottom: 20px;
}
</style>
