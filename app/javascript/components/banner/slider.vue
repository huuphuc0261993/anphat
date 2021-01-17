<template>
  <div>
    <section class="pt-0 padding-bottom-cls" v-for="(item, index) in datanews" :key="index">
      <div v-if="item.banner_type==1">
      <div class="slide-1 home-slider" v-swiper:mySwiper="swiperOption">
        <div class="swiper-wrapper">
          <div class="swiper-slide" >
            <div 
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
         this.items.forEach((e,index) => {
           if(e.banner_type==1){
              this.datanews.push(e)
           }
         });
        })
        .catch(error => {
          console.log(error);
        });
    }
  },
  data() {
    return {
     
      items: [],
      datanews:[],
      swiperOption: {
        pagination: {
          el: ".swiper-pagination"
        }
        // ...
      }
    };
  }
};
</script>
