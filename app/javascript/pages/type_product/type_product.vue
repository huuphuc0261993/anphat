<template>
  <div>
    <Header />
    <Breadcrumbs title="LOẠI SẢN PHẨM" />
      <div>
    <div class="img-wrapper">
      <div class="front">
        <router-link :to="'/product_details/'+product.id">
          <img
            :src="product.pictures_attributes[0].url"
            class="img-fluid bg-img"
          />
        </router-link>
      </div>
    </div>
    <div class="product-detail">
      <div class="rating">
        <i class="fa fa-star"></i>
        <i class="fa fa-star"></i>
        <i class="fa fa-star"></i>
        <i class="fa fa-star"></i>
        <i class="fa fa-star"></i>
      </div>
      <router-link :to="'/product_details/'+product.id">
        <h6>{{ product.name }}</h6>
      </router-link>
      <h4 v-if="product.price_sale >=0">
        {{ formatPrice(product.price_sale) }}đ<del>{{ product.price }}</del>
      </h4>
      <h4 v-else>
        {{ product.price_sale }}
      </h4>
    </div>
  </div>
    <Footer />
  </div>
</template>
<script>
import Header from "../../components/header/header";
import Footer from "../../components/footer/footer1";
import Breadcrumbs from "../../components/widgets/breadcrumbs";
import axios from "axios";
import { URLS } from "../../utils/url";
import productBox1 from "../../components/product-box/product-box1";
export default {
  data() {
    return {
     product:[]
   
    };
  },
   mounted() {
   this.initialize();
  },
  methods:{
    initialize() {
      let id = this.$route.params.id
      axios
        .get(URLS.CATEGORY_PRODUCTS(id), {})
        .then(response => {
          this.product = response.data;
          console.log(this.product)
        })
        .catch(error => {
          console.log(error);
        });
    },
     formatPrice(value) {
      let val = (value / 1).toFixed(0).replace(".",",");
      return val.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".");
    }
  },
  components: {
    Header,
    Breadcrumbs,
    Footer,
    productBox1
  }
};
window.onpopstate = function () {
    location.reload()
};
</script>
<style scoped>

</style>

