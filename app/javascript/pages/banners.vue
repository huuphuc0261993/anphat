<template>
  <div>
    <bannersModals ref="child" @saveDtb="save" />
    <a-row>
      <a-col :xs="12">
        <div >
          <a-row class="table-buttons">
            <a-col :span="24" class="text-left">
              <a-button type="primary" @click="show" :method="save">{{
                "Thêm mới banner"
              }}</a-button>
            </a-col>
          </a-row>
        </div>
      </a-col>
      <a-col :xs="12">
        <div>
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
      <template slot="image" slot-scope="image">
        <span>
          <a-avatar shape="square" :size="60" :src="image.url" />
        </span>
      </template>

      <template slot="action" slot-scope="text, record">
        <a-button
          @click="editBanner(record)"
          class="editButton"
          :type="'primary'"
          style="width:60px"
          ><a-icon type="edit"
        /></a-button>

        <a-popconfirm
          title="Bạn muốn xoá News này?"
          ok-text="Xác nhận"
          cancel-text="Huỷ"
          @confirm="softdelted(record)"
        >
          <a-button size="small" type="danger" style="width:60px"
            ><a-icon type="delete"
          /></a-button>
        </a-popconfirm>
      </template>
    </a-table>
  </div>
</template>

<script>
import bannersModals from "../components/modals/banners_modals";
import axios from "axios";
import { URLS } from "../utils/url";
export default {
  data() {
    return {
      search: "",
      dataNews: [],
      search: "",
      picture_attributes: [
        {
          id: "",
          url: ""
        }
      ],
      editedItem: {},
      columns: [
        {
          title: "Tên hình ảnh",
          dataIndex: "name",
          className: "name",
          width: "20%",
          align: "center"
        },
        {
          title: "Hình ảnh",
          dataIndex: "pictures_attributes[0]",
          scopedSlots: { customRender: "image" },
          width: "10%",
          align: "center"
        },
        {
          title: "link",
          dataIndex: "pictures_attributes[0].url",
          width: "40%"
        },
        ,
        {
          title: "Ngày tạo",
          dataIndex: "created_at",
          width: "10%"
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
    save(banner, index) {
      if (index == -1) {
        axios
          .post(URLS.BANNERS(), {
            banner: banner
          })
          .then(response => {
            console.log("Created!");
            this.initialize();
            this.$refs.child.close();
            this.$message.success("Tạo banner thành công");
          })
          .catch(error => {
            console.log(error);
          });
      } else {
        axios
          .put(URLS.BANNER(banner.id), {
            banner: banner
          })
          .then(response => {
            this.initialize();
            this.$refs.child.close();
            this.$message.success("Cập nhật banner thành công");
          })
          .catch(error => {
            console.log(error);
          });
      }
    },
    editBanner(item) {
      this.dataNews.forEach(element => {
        if (element.id == item) {
          item = element;
        }
      });
      this.$refs.child.edit(item);
    },
    initialize() {
      return axios
        .get(URLS.BANNERS())
        .then(response => {
          this.dataNews = response.data;
        })
        .catch(e => {
          console.log(e);
        });
    },
    softdelted(item) {
      axios
        .delete(URLS.BANNER(item.id))
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
    bannersModals
  },
  computed: {
    onsearch() {
      if (this.search) {
        return this.dataNews.filter(item => {
          return (
            this.search
              .toLowerCase()
              .split(" ")
              .every(v => item.created_at.toLowerCase().includes(v)) ||
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
.banner_two {
  display: flex;
}
.col-8 {
  padding-right: 2%;
}

</style>
