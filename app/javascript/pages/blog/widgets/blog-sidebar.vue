<template>
  <div class="col-xl-3 col-lg-4 col-md-5">
    <div class="blog-sidebar">
      <div class="theme-card">
        <h4>Bài viết gần đây</h4>
        <ul class="recent-blog">
          <li
            v-for="(blog, index) in bloglist.slice(0, 6)"
            :key="index"
            style="margin-top: 5%"
          >
            <div class="media">
              <a :href="'/blog_detail/' + blog.id " >
                <img :src="blog.image.url" class="img-fluid" alt />
              </a>
              <div class="media-body align-self-center">
                <h6>{{ blog.created_at.substring(0, 10) }}</h6>
                <a :href="'/blog_detail/' + blog.id " >
                  <p>{{ blog.title.substring(0, 15) }}...</p>
                </a>
              </div>
            </div>
          </li>
        </ul>
      </div>
    </div>
  </div>
</template>

<script>
import axios from "axios";
import { URLS } from "../../../utils/url";
export default {
  data() {
    return {
      bloglist: [],
    };
  },
  computed: {
  },
  mounted() {
    this.initializes();
  },
  methods: {
    initializes() {
      axios
        .get(URLS.BLOGS(), {})
        .then((response) => {
          this.bloglist = response.data;
          this.bloglist.reverse();
        })
        .catch((error) => {});
    },
  },
};
</script>
<style scoped>
.media img {
  width: 100px;
  margin-right: 10px;
}
.blog-sidebar .theme-card {
  border: 1px solid #ddd;
  padding: 30px;
  background-color: #fff;
}
.blog-sidebar h4 {
  color: #333;
  text-transform: uppercase;
  font-weight: 600;
  margin-bottom: 20px;
  line-height: 20px;
  letter-spacing: 1px;
}
</style>
