<template>
<div class="container-fluid layout-8">
    <Header/>
    <Slider/>
       <div class="layout-8-bg" >
      <CollectionBanner />
      <ProductTab
        :products="products"
        :category="category"
        @openQuickview="showQuickview"
        @openCompare="showCoampre"
        @openCart="showCart"
        />
    </div>
    <Footer/>
</div>
     
</template>
<script>
window.onpopstate = function () {
    location.reload()
};
import Header from "../components/header/header";
import Slider from "../components/banner/slider";
import CollectionBanner from "../components/banner/collection_banner";
import ProductTab from "../components/product_tab/product_tab";
import Footer from "../components/footer/footer1";
export default {
  name: "Home",
  components: {
      Header,
      Slider,
      CollectionBanner,
      ProductTab,
      Footer,
  },
  data() {
    return {
      products: [],
      category: [],
      showquickviewmodel: false,
      showcomparemodal: false,
      showcartmodal: false,
      quickviewproduct: {},
      comapreproduct: {},
      cartproduct: {},
    };
  },
  computed: {},
  mounted() {},
  methods: {
    showQuickview(item, productData) {
      this.showquickviewmodel = item;
      this.quickviewproduct = productData;
    },
    showCoampre(item, productData) {
      this.showcomparemodal = item;
      this.comapreproduct = productData;
    },
    closeCompareModal(item) {
      this.showcomparemodal = item;
    },
    showCart(item, productData) {
      this.showcartmodal = item;
      this.cartproduct = productData;
    },
    closeCartModal(item) {
      this.showcartmodal = item;
    },
  },
};
</script>

<style scoped>
</style>