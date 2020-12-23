<template>
  <div class="container-fluid layout-8">
    <Header />
    <section class="section-b-space">
      <div class="collection-wrapper">
        <div class="container">
          <div class="row">
            <div class="col-lg-9 col-sm-12 col-xs-12 productdetail">
              <div class="container-fluid">
                <div class="row">
                  <div class="col-lg-6">
                    <div
                      class="swiper-wrapper"
                      v-for="e in datalist.pictures_attributes"
                      :key="e.id"
                    >
                      <div>
                        <img :src="e.url" class="img-fluid bg-img" />
                      </div>
                    </div>
                  </div>
                  <div class="col-lg-6 rtl-text">
                    <div class="product-right">
                      <h2>
                        <b>{{ datalist.name }}</b>
                      </h2>

                      <h4 v-if="datalist.discount">
                        <del>{{ formatPrice(datalist.price) }}đ</del>
                        <span>{{ datalist.discount }}% off</span>
                        <h3>{{ formatPrice(datalist.price_sale) }}đ</h3>
                      </h4>

                      <div class="product-description border-product">
                        <h6 class="product-title">Số lượng</h6>
                        <div class="qty-box">
                          <div class="input-group">
                            <span class="input-group-prepend">
                              <button
                                type="button"
                                class="btn quantity-left-minus"
                                data-type="minus"
                                data-field
                                @click="decrement()"
                              >
                                <i class="ti-angle-left"></i>
                              </button>
                            </span>
                            <input
                              type="text"
                              name="quantity"
                              class="form-control input-number"
                              v-model="counter"
                            />
                            <span class="input-group-prepend">
                              <button
                                type="button"
                                class="btn quantity-right-plus"
                                data-type="plus"
                                data-field
                                @click="increment()"
                              >
                                <i class="ti-angle-right"></i>
                              </button>
                            </span>
                          </div>
                        </div>
                      </div>

                      <div class="product-buttons">
                        <button class="btn btn-solid" title="buy now">
                          Để lại thông tin để được tư vấn
                        </button>
                      </div>
                      <div class="border-product">
                        <!-- <h6 class="product-title">Thông tin sản phẩm</h6>
                        <p>
                          {{ datalist.description.substring(0, 200) + "...." }}
                        </p> -->
                        <input
                          type="text"
                          class="form-control"
                          name="EMAIL"
                          id="mce-EMAIL"
                          placeholder="Họ và tên"
                          required="required"
                        />
                        <input
                          style="margin-top: 1%"
                          type="text"
                          class="form-control"
                          name="EMAIL"
                          id="mce-EMAIL"
                          placeholder="Email"
                          required="required"
                        />
                        <input
                          style="margin-top: 1%"
                          type="text"
                          class="form-control"
                          name="EMAIL"
                          id="mce-EMAIL"
                          placeholder="Số điện thoại"
                          required="required"
                        />
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <section class="tab-product m-0">
                <div class="row">
                  <div class="col-sm-12 col-lg-12">
                    <b-tabs card>
                      <b-tab title="Mô tả">
                        <b-card-text>{{ datalist.description }}</b-card-text>
                      </b-tab>

                       <b-tab title="Video">
                        <b-card-text>
                          <div class="mt-3 text-center">
                            <iframe
                              width="560"
                              height="315"
                              src="https://www.youtube.com/embed/BUWzX78Ye_8"
                              allow="autoplay; encrypted-media"
                              allowfullscreen
                            ></iframe>
                          </div>
                        </b-card-text>
                      </b-tab>
                    </b-tabs>
                  </div>
                </div>
              </section>
            </div>
            <div class="col-lg-3">
              <productSidebar />
            </div>
          </div>
        </div>
      </div>
      <!-- <relatedProduct :productTYpe="productTYpe" :productId="productId" /> -->
      <!-- <b-modal id="modal-1" size="md" centered hide-footer>
        <template v-slot:modal-title>{{datalist.name}}</template>
        <img src="/uploads/assets/images/4.jpg" alt="size-chart" class="img-fluid" />
        </b-modal> -->
    </section>
    <Footer />
  </div>
</template>

<script>
import Header from "../../components/header/header";
import Footer from "../../components/footer/footer1";
import productSidebar from "../../components/widgets/product-sidebar";
import axios from "axios";
import { URLS } from "../../utils/url";
export default {
  data() {
    return {
      datalist: "",
      counter: 1
    };
  },
  // watch: {
  //   datalist: {
  //     handler: function() {
  //       this.initializes();
  //     }
  //   }
  // },
  mounted() {
    this.initializes();
  },
  methods: {
    increment() {
      this.counter++;
    },
    decrement() {
      if (this.counter > 1) this.counter--;
    },
    formatPrice(value) {
      let val = (value / 1).toFixed(0).replace(".", ",");
      return val.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".");
    },
    initializes() {
      let id = this.$route.params.id;
      axios
        .get(URLS.PRODUCT(id), {})
        .then(response => {
          this.datalist = response.data;
        })
        .catch(error => {});
    }
  },
  components: {
    Header,
    Footer,
    productSidebar
  }
};
</script>

<style>
</style>