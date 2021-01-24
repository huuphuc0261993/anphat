<template>
  <div>
    <Header />
    <Breadcrumbs title="LOẠI SẢN PHẨM" />
    <section class="collection section-b-space pt-0 ratio_square">
      <div class="container">
        <div class="title2" style="padding-top:70px">
          <h4>{{ subtitle }}</h4>
          <h2 >{{ title }}</h2>
           <div>
          <a-input-search
            placeholder="Nhập tên để tìm kiếm"
            size="large"
            v-model="search"
            class="search_list_order"
          />
        </div>
        </div>
        <div class="row partition-collection" >
          <div class="col-lg-3 col-md-6" v-for="e in onsearch" :key = e.id>
            <div class="collection-block">
              <div>
                <img
                  :src="e.pictures[0].url"
                  alt="item.title"
                  class="img-fluid border border-gray rounded"
                />
              </div>
              <div class="collection-content">
                <h3>{{e.name}}</h3>
               
                <a :href="'/product_details/'+e.id" class="btn btn-outline"
                  >Liên hệ</a
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
      product: [],
      search: "",
    };
  },
  mounted() {
    this.initialize();
  },
  computed:{
    onsearch() {
      if (this.search) {
        return this.product.filter(item => {
          return (
            this.search
              .toLowerCase()
              .split(" ")
              .every(v => item.name.toLowerCase().includes(v))
          );
        });
      } else {
        return this.product;
      }
    }
  },
  methods: {
    initialize() {
      let id = this.$route.params.id;
      axios
        .get(URLS.CATEGORY_PRODUCTS(id), {})
        .then((response) => {
          this.product = response.data;
          console.log(this.product);
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

