<template>
  <div>
    <Header />
    <Breadcrumbs title="LIÊN HỆ" />
    <section class="blog-detail-page section-b-space ratio2_3">
      <div class="container">
        <div class="row" v-for="(item, index) in datalist" :key="index">
          <div class="col-sm-12 blog-detail" v-if="item.info==4" >
            <br>
            <h3>
              {{item.title}}
            </h3>
            <ul class="post-social">
              <li>{{item.created_at}}</li>
              <li>Posted By : Admin</li>
            </ul>
            <b class="description">{{item.description}}</b>
            <div v-html="item.content">
            </div>
          </div>
        </div>
        <div class="row section-b-space blog-advance">
        </div>
      </div>
    </section>
    <slide/>
    <Footer />
  </div>
</template>
<script>
import Header from "../../components/header/header";
import Footer from "../../components/footer/footer1";
import Breadcrumbs from "../../components/widgets/breadcrumbs";
import slide from "../../components/swiper/swiper"
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
    Footer,
    slide
  },
  methods: {
    initializes() {
      axios
        .get(URLS.INFORMATIONS(), {})
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

