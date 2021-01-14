<template>
  <div>
    <Header />
    <Breadcrumbs title="Blog" />
    <section class="blog-detail-page section-b-space ratio2_3">
      <div class="container">
        <div class="row">
          <div class="col-sm-12 blog-detail">
            <br>
            <h3>
              {{datalist.title}}
            </h3>
            <ul class="post-social">
              <li>{{datalist.created_at}}</li>
              <li>Posted By : Admin</li>
            </ul>
            <b class="description">{{datalist.description}}</b>
            <div v-html="datalist.content">
            </div>
          </div>
        </div>
        <div class="row section-b-space blog-advance">
        </div>
      </div>
    </section>
    <Footer />
  </div>
</template>
<script>
import Header from "../../components/header/header";
import Footer from "../../components/footer/footer1";
import Breadcrumbs from "../../components/widgets/breadcrumbs";
import axios from "axios";
import { URLS } from "../../utils/url";
export default {
  data() {
    return {
      datalist:[]
    };
  },
  mounted() {
    this.initializes()
  },
  components: {
    Header,
    Breadcrumbs,
    Footer
  },
  methods: {
    initializes() {
      let id = this.$route.params.id;
      axios
        .get(URLS.BLOG(id), {})
        .then(response => {
          this.datalist = response.data
        })
        .catch(error => {});
    },
  }
};
window.onpopstate = function () {
    location.reload()
};
</script>
<style scoped>
.paragraph{
  font-size: 16px;
  text-align: justify;;
}
.description{
  font-size: 17px;
}
</style>
