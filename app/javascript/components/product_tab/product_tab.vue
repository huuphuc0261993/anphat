<template>
  <div>
    <section class="section-b-space ratio_square">
      <div class="container-fluid">
        <div class="title2" style="padding-top:70px">
          <h4>{{ subtitle }}</h4>
          <h2 class="title-inner2">{{ title }}</h2>
        </div>
        <div class="row">
          <div class="col">
            <div class="theme-tab layout7-product">
              <b-tabs content-class="mt-3">
                <b-tab
                  :title="collection.name"
                  v-for="(collection, index) in categories"
                  :key="index"
                >
                  <div class="no-slider row">
                    <div
                      class="product-box"
                      v-for="(product, index) in collection.products"
                      :key="index"
                    >
                      <productBox1 :product="product" :index="index" />
                    </div>
                  </div>
                </b-tab>
              </b-tabs>
            </div>
          </div>
        </div>
      </div>
    </section>
  </div>
</template>
<script type="text/javascript">
import productBox1 from "../product-box/product-box1";
import axios from "axios";
import { URLS } from "../../utils/url";
export default {
  mounted() {
    this.initialize();
  },
  components: {
    productBox1
  },
  data() {
    return {
      title: "SẢN PHẨM CỦA CHÚNG TÔI",
      subtitle: "LỰA CHỌN ",
      categories: [],
      showCart: false,
      showquickviewmodel: false,
      showcomapreModal: false,
      quickviewproduct: {},
      comapreproduct: {},
      cartproduct: {},
      dismissSecs: 5,
      dismissCountDown: 0
    };
  },
  methods: {
    initialize() {
      axios
        .get(URLS.CATEGORIES(), {})
        .then(response => {
          this.categories = response.data;
          console.log(this.categories);
        })
        .catch(error => {
          console.log(error);
        });
    }
  }
};
</script>
