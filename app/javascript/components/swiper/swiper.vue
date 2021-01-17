<template>
  <section class="testimonial small-section">
    <div class="container">
      <div class="row">
        <div class="col-sm-12">
          <div v-swiper:mySwiper="swiperOption">
            <div class="swiper-wrapper testimonial-slider ">
            
                <div class="media swiper-slide" :key="banner.id"
                v-for="banner in datanews">
                  <div class="text-center">
                    <img :src="banner.pictures[0].url" />
                    <h5>{{ banner.fullname }}</h5>
                    <h6>{{ banner.position }}</h6>
                  </div>
                  <div class="media-body">
                    <p class="paragraph">{{ banner.description }}</p>
                  </div>
              </div>
            </div>
            <div class="swiper-pagination"></div>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>

<script>
import axios from "axios";
import { URLS } from "../../utils/url";
export default {
  data() {
    return {
      items: [
      ],
      datanews:[],
      swiperOption: {
        pagination: {
          el: ".swiper-pagination"
        }
        // ...
      }
    };
  },
  mounted() {
    this.mySwiper.slideTo(0, 1000, false);
    this.initializes()
  },
  components: {},
  methods:{
    initializes() {
      axios
        .get(URLS.BANNERS(), {})
        .then(response => {
          this.items = response.data
          this.items.forEach((e,index) => {
           if(e.banner_type==4){
              this.datanews.push(e)
           }
         });
        })
        .catch(error => {});
    },
  }
};
</script>
<style scoped>
.media {
  width: 675px!important;
  margin-right: 20px!important;
}

</style>