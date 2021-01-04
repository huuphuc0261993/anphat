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
import { URLS } from "../utils/url";

function dataURLtoFile(dataurl, filename) {
  var arr = dataurl.split(","),
    mime = arr[0].match(/:(.*?);/)[1],
    bstr = atob(arr[1]),
    n = bstr.length,
    u8arr = new Uint8Array(n);
  while (n--) {
    u8arr[n] = bstr.charCodeAt(n);
  }
  return new File([u8arr], filename, { type: mime });
}
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
          .post(URLS.NEWS(), formData, {
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
        if (item.image.url) {
          let url = item.image.url;
          const toDataURL = url =>
            fetch(url)
              .then(response => response.blob())
              .then(
                blob =>
                  new Promise((resolve, reject) => {
                    const reader = new FileReader();
                    reader.onloadend = () => resolve(reader.result);
                    reader.onerror = reject;
                    reader.readAsDataURL(blob);
                  })
              );

          toDataURL(url).then(dataUrl => {
            let fileData = dataURLtoFile(dataUrl, item.title);

            let formData = new FormData();
            formData.append("news[title]", item.title);
            formData.append("news[description]", item.description);
            formData.append("news[content]", item.content);
            formData.append("news[image]", fileData);
            axios
              .put(URLS.NEW(item.id), formData, {
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
          });
        } else {
          let formData = new FormData();
          formData.append("news[title]", item.title);
          formData.append("news[description]", item.description);
          formData.append("news[content]", item.content);
          formData.append("news[image]", item.image.originFileObj);
          axios
            .put(URLS.NEW(item.id), formData, {
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
      }
    },
    editNews(item) {
      this.$refs.child.edit(item);
    },
    initialize() {
      return axios
        .get(URLS.NEWS())
        .then(response => {
          this.dataNews = response.data;
          console.log(this.dataNews);
          this.dataNews = JSON.parse(JSON.stringify(this.dataNews));
        })
        .catch(e => {
          console.log(e);
        });
    },
    softdelted(item) {
      var id = item.id;
      axios
        .delete(URLS.NEW(id))
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
