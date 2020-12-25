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
    <a-row style="display:flex">
      <div v-for="banner in dataNews" :key="banner.id" style="padding-right:2%">
        <div v-if="banner.banner_type == 1">
          <div
            class="col-8"
            v-for="element in banner.pictures"
            :key="element.id"
          >
            <a-avatar :size="100" :src="element.url" shape="square" />
            <div>
              <a-icon type="edit" @click="editBanner(banner.id)"/>
              <a-icon type="delete" @click="softdelted(banner.id)" />
            </div>
          </div>
        </div>

        <div v-if="banner.banner_type == 2" class="banner_two">
          <div
            class="col-8"
            v-for="element in banner.pictures"
            :key="element.id"
          >
            <a-avatar :size="100" :src="element.url" shape="square" />
            <div>
              <a-icon type="edit" @click="editBanner(banner.id)"/>
              <a-icon type="delete" @click="softdelted(banner.id)" />
            </div>
          </div>
        </div>
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
      editedItem: {}
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
      console.log(banner);
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
        if(element.id ==item){
          item = element
        }
      });
      this.$refs.child.edit(item);
    },
    initialize() {
      return axios
        .get(URLS.BANNERS())
        .then(response => {
          this.dataNews = response.data;
          console.log(this.dataNews);
        })
        .catch(e => {
          console.log(e);
        });
    },
    softdelted(item) {
      console.log("day la id");
      console.log(item);
      axios
        .delete(URLS.BANNER(item))
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
  computed: {}
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
.col-8{
  padding-right: 2%;
}
</style>
