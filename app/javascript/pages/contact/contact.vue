<template>
  <div>
    <Header />
    <Breadcrumbs title="LIÊN HỆ" />
  <section class="contact-page section-b-space" style="margin-top:3%">
      <div class="container">
        <div class="row section-b-space">
          <div class="col-lg-7 map">
            <iframe
              src="https://maps.google.com/maps?q=220%20%C4%90i%E1%BB%87n%20Bi%C3%AAn%20Ph%E1%BB%A7,%20Ph%C6%B0%E1%BB%9Dng%20Tr%C6%B0%E1%BB%9Dng%20An,%20TP%20Hu%E1%BA%BF&t=&z=13&ie=UTF8&iwloc=&output=embed"
              allowfullscreen
            ></iframe>
          </div>
          <div class="col-lg-5">
            <div class="contact-right">
              <ul>
                <li>
                  <div class="contact-icon">
                    <i class="fa fa-phone" aria-hidden="true"></i>
                    <h6>Contact Us</h6>
                  </div>
                  <div class="media-body">
                    <p>{{phone1}}</p>
                  </div>
                </li>
                <li>
                  <div class="contact-icon">
                    <i class="fa fa-map-marker" aria-hidden="true"></i>
                    <h6>VP đại diện</h6>
                  </div>
                  <div class="media-body">
                    <p v-html="address"></p>
                  </div>
                </li>
                <li>
                  <div class="contact-icon">
                    <i class="fa fa-envelope-o" aria-hidden="true"></i>
                    <h6>Email</h6>
                  </div>
                  <div class="media-body">
                    <p>{{email1}}</p>
                  </div>
                </li>
                <li>
                  <div class="contact-icon">
                    <i class="fa fa-facebook-official" aria-hidden="true"></i>
                    <h6>Facebook</h6>
                  </div>
                  <div class="media-body">
                    <p>{{face}}</p>
                  </div>
                </li>
              </ul>
            </div>
          </div>
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
import slide from "../../components/swiper/swiper"
import axios from "axios";
import { URLS } from "../../utils/url";
export default {
  data() {
    return {
      datalist:[],
      phone1: '+84 82 83 84 175, +84 91 476 2 552',
      address: '220 Điện Biên Phủ, Phường Trường An, TP Huế',
      email1: 'anphathue.vn@gmail.com',
      face: 'https://www.facebook.com/anphatHue',
      errors: [],
   
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
iframe {width:100%;height:100%;}
.section-b-space {
    padding-bottom: 70px;
}
</style>

