<template>
  <div>
    <Header />
    <Breadcrumbs title="LOẠI SẢN PHẨM" />
    <section class="collection section-b-space pt-0 ratio_square">
      <div class="container">
        <div class="title2" style="padding-top: 70px">
          <h4>{{ subtitle }}</h4>
          <h2>{{ category }}</h2>
          <div>
            <a-input-search
              placeholder="Nhập tên để tìm kiếm"
              size="large"
              v-model="search"
              class="search_list_order w-50"
            />
          </div>
        </div>
        <div class="row partition-collection">
          <div class="col-lg-3 col-md-6" v-for="e in onsearch" :key="e.id">
            <div class="collection-block">
              <div>
                <img
                  :src="e.pictures[0].url"
                  alt="item.title"
                  class="img-fluid border border-gray rounded"
                />
              </div>
              <div class="collection-content">
                <div class="product-detail">
                  <div class="rating">
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                  </div>
                  <router-link :to="'/product_details/' + e.id">
                    <h6><b>{{ e.name }}</b></h6>
                  </router-link>
                  <h4 v-if="e.price_sale >= 0">
                    Giá: {{ formatPrice(e.price_sale) }}đ<del class="ml-1">{{
                      e.price
                    }}</del>
                  </h4>
                  <h4 v-else>Giá: {{ e.price_sale }}</h4>
                </div>

                <a :href="'/product_details/' + e.id" class="btn btn-outline"
                  >Liên hệ ngay</a
                >
              </div>
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
import axios from "axios";
import { URLS } from "../../utils/url";
export default {
  data() {
    return {
      title: "SẢN PHẨM CỦA CHÚNG TÔI",
      subtitle: "LOẠI SẢN PHẨM",
      category: "",
      product: [],
      search: "",
    };
  },
  mounted() {
    this.initialize();
  },
  computed: {
    onsearch() {
      if (this.search) {
        return this.product.filter((item) => {
          return this.search
            .toLowerCase()
            .split(" ")
            .every((v) => item.name.toLowerCase().includes(v));
        });
      } else {
        return this.product;
      }
    },
  },
  methods: {
    formatPrice(value) {
      let val = (value / 1).toFixed(0).replace(".", ",");
      return val.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".");
    },

    initialize() {
      let id = this.$route.params.id;
      axios
        .get(URLS.CATEGORY_PRODUCTS(id), {})
        .then((response) => {
          if (response.data != "") {
            this.product = response.data;
            this.category = this.product[0].category.name;
          } else{
            this.$router.push({name: "Order_Success"})
          }
        })
        .catch((error) => {
          console.log(error);
        });
    },
    formatPrice(value) {
      let val = (value / 1).toFixed(0).replace(".", ",");
      return val.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".");
    },
  },
  components: {
    Header,
    Breadcrumbs,
    Footer,
  },
};
window.onpopstate = function () {
  location.reload();
};
</script>
<style scoped>
</style>

