<template>
  <div>
    <Header />
    <Breadcrumbs title="LIÊN HỆ" />
    <section class="blog-detail-page section-b-space ratio2_3">
      <div class="container">
        <div class="row" v-for="(item, index) in datalist" :key="index">
          <div class="col-sm-12 blog-detail" v-if="item.info == 1">
            <img :src="item.url" class="img-fluid" alt /><br />
            <h3>
              {{ item.title }}
            </h3>
            <ul class="post-social">
              <li>{{ item.created_at }}</li>
              <li>Posted By : Admin</li>
            </ul>
            <b class="description">{{ item.description }}</b>
            <div v-html="item.content"></div>
          </div>
        </div>
        <div class="row section-b-space blog-advance"></div>
      </div>
    </section>
    <slide />
    <Footer />
  </div>
</template>
<script>
import Header from "../../components/header/header";
import Footer from "../../components/footer/footer1";
import Breadcrumbs from "../../components/widgets/breadcrumbs";
import slide from "../../components/swiper/swiper";
import axios from "axios";
import { URLS } from "../../utils/url";
export default {
  data() {
    return {
      datalist: [],
      datapost: [],
      aboutbanner:
        "https://cdn.pixabay.com/photo/2014/04/14/20/11/flowers-324175_960_720.jpg",
      aboutTitle:
        "Sed Ut Perspiciatis Unde Omnis Iste Natus Error Sit Voluptatem Accusantium Doloremque Laudantium",
      aboutText:
        "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium On the other hand.We denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour. when our power of choice is untrammelled and when nothing prevents our being able to do what we like best. every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection he rejects pleasures to secure other greater pleasures or else he endures pains to avoid worse pains."
    };
  },
  mounted() {
    this.initializes(), this.introduce();
  },
  components: {
    Header,
    Breadcrumbs,
    Footer,
    slide
  },
  methods: {
    introduce() {
      axios
        .get(URLS.INFORMATIONS(), {})
        .then(response => {
          this.datapost = response.data;
        })
        .catch(error => {});
    },
    initializes() {
      axios
        .get(URLS.INFORMATIONS(), {})
        .then(response => {
          this.datalist = response.data;
        })
        .catch(error => {});
    }
  }
};
window.onpopstate = function() {
  location.reload();
};
</script>
<style scoped>
.paragraph {
  font-size: 16px;
  text-align: justify;
}
.description {
  font-size: 17px;
}
</style>

