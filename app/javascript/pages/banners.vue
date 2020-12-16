<template>
  <div>
    <bannersModals ref="child" @saveDtb="save" />
    <a-row>
        <div class="col-4">
          <a-row class="table-buttons">
            <a-col :span="24" class="text-left">
              <a-button type="primary" @click="show" :method="save">{{
                "Thêm mới banner"
              }}</a-button>
            </a-col>
          </a-row>
        </div>
    </a-row>
  </div>
</template>

<script>
import bannersModals from "../components/modals/banners_modals";
import axios from "axios";
import { URLS } from "../utils/url";
export default {
  data() {
    return {
      dataNews: [],
      search: "",
      picture_attributes: [
        {
          id: "",
          url: ""
        }
      ],
      editedItem: {},
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
      console.log(banner)
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
    editProduct(item) {
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
      var id = item.id;
      axios
        .delete(URLS.BANNER(id))
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
  }
};
</script>
<style scoped>
.highlight {
  background-color: rgb(255, 192, 105);
  padding: 0px;
}
</style>
