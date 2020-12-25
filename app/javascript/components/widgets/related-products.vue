<template>
  <div>
    <section class="ratio_asos">
      <div class="container">
        <div class="col-12 product-related">
          <h2 style="font-weight:700 ;font-size:30px">{{ title }}</h2>
        </div>
        <div class="row m-0">
          <div
            class="col-xl-2 col-md-4 col-sm-6"
            v-for="(product, index) in productslist"
            :key="index"
          >
            <div class="product-box">
              <productBox1 :product="product" :index="index" />
            </div>
          </div>
        </div>
      </div>
    </section>
  </div>
</template>

<script>
import axios from "axios";
import { URLS } from "../../utils/url";
import productBox1 from "../product-box/product-box1";
export default {
  props: ["productslist"],
  components: {
    productBox1
  },
  data() {
    return {
      title: "Các sản phẩm liên quan",
      showquickviewmodel: false,
      showcomparemodal: false,
      showcartmodal: false,
      quickviewproduct: {},
      comapreproduct: {},
      cartproduct: {},
      dismissSecs: 5,
      dismissCountDown: 0
    };
  },
  computed: {},
  mounted() {},
  methods: {}
};
</script>
