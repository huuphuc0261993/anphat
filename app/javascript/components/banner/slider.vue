<template>
  <div>
    <section class="pt-0 padding-bottom-cls">
      <div class="slide-1 home-slider">
        <div class="swiper-wrapper">
          <div class="swiper-slide" v-for="(item, index) in items" :key="index" >
            <div v-if="item.banner_type==1"
              class="home text-center"
              :class="item.alignclass"
              v-bind:style="{
                'background-image': 'url(' + item.pictures_attributes[0].url + ')'
              }"
            >
            </div>
          </div>
        </div>
      </div>
    </section>
  </div>
</template>
<script type="text/javascript">
import axios from "axios";
import { URLS } from "../../utils/url";
export default {
  mounted() {
    this.initialize();
  },
  methods: {
    initialize() {
      axios
        .get(URLS.BANNERS(), {})
        .then(response => {
         this.items = response.data
       
        })
        .catch(error => {
          console.log(error);
        });
    }
  },
  data() {
    return {
      swiperOption: {
        navigation: {
          nextEl: ".swiper-button-next",
          prevEl: ".swiper-button-prev"
        }
      },
      items: []
    };
  }
};
</script>
