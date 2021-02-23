<template>
  <div>
    <Header />
    <Breadcrumbs title="LIÊN HỆ" />
  <section class="contact-page section-b-space" style="margin-top:3%">
      <div class="container">
        <div class="row section-b-space">
          <div class="col-lg-7 map">
            <iframe
              src="https://maps.google.com/maps?q=1/78%20Nguy%E1%BB%85n%20H%E1%BB%AFu%20D%E1%BA%ADt,%20Ph%C6%B0%E1%BB%9Dng%20H%C6%B0%C6%A1ng%20Long,%20Th%C3%A0nh%20Ph%E1%BB%91%20Hu%E1%BA%BF,%20T%E1%BB%89nh%20Th%E1%BB%ABa%20Thi%C3%AAn%20Hu%E1%BA%BF&t=&z=13&ie=UTF8&iwloc=&output=embed"
              
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
      address: '08 Kim Long, Phường Kim Long, TP Huế',
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

