<template>
  <div class="container-fluid layout-8">
    <Header />
    <Breadcrumbs :title="datalist.name" />
    <section class="section-b-space" style="padding-top: 4%">
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

                      <h4 v-if="datalist.discount != '' & datalist.price >0">
                        <del>{{ formatPrice(datalist.price) }}đ</del>
                        <span>{{ datalist.discount }}% off</span>
                        <h3>{{ formatPrice(datalist.price_sale) }}đ</h3>
                      </h4>
                      <h4 v-else-if="datalist.discount != '' & datalist.price <=0">
                        <span>{{ datalist.discount }}% off</span>
                         <h3>{{ formatPrice(datalist.price_sale) }}đ</h3>
                      </h4>
                      <h4 v-else>
                        <h3><b>Giá</b>: {{ datalist.price_sale}}</h3>
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
                      <div class="border-product"  v-if="datalist.discount != null & datalist.price >0">
                        <h4 class="product-title">
                          Tổng tiền:
                          {{ formatPrice(datalist.price_sale * counter) }}đ
                        </h4>
                      </div>
                      <div class="product-buttons">
                        <button
                          class="btn btn-solid"
                          title="buy now"
                          @click="save(order_items)"
                        >
                          Liên hệ ngay
                        </button>
                      </div>
                      <div class="border-product">
                        <input
                          type="text"
                          class="form-control"
                          name="EMAIL"
                          placeholder="Họ và tên"
                          v-model="order_items.name"
                        />
                        <input
                          style="margin-top: 1%"
                          type="text"
                          class="form-control"
                          name="EMAIL"
                          id="mce-EMAIL"
                          placeholder="Email"
                          v-model="order_items.email"
                        />
                        <input
                          style="margin-top: 1%"
                          type="text"
                          class="form-control"
                          name="SDT"
                          placeholder="Số điện thoại"
                          v-model="order_items.phone"
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
                        <b-card-text v-html="datalist.description"></b-card-text>
                      </b-tab>

                      <b-tab title="Video">
                        <b-card-text>
                          <div class="mt-3 text-center">
                            <iframe
                              width="600"
                              height="400"
                              :src='"https://www.youtube.com/embed/"+datalist.youtube'
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
      <relatedProduct :productslist="productslist" />
    </section>
    <Footer />
  </div>
</template>

<script>
import Header from "../../components/header/header";
import Footer from "../../components/footer/footer1";
import productSidebar from "../../components/widgets/product-sidebar";
import relatedProduct from "../../components/widgets/related-products";
import Breadcrumbs from "../../components/widgets/breadcrumbs";
import axios from "axios";
import { URLS } from "../../utils/url";
export default {
  data() {
    return {
      order_items: {
        name: "",
        phone: "",
        email: "",
        total: "",
        customer_id: "",
        price: "",
        product_id: "",
        order_id: "",
        quantity:"",
        encrypted_password:""
      },
      datalist: "",
      productslist: [],
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
    save(customer) {
      if(customer.name != "" &  customer.email != "" & customer.phone != ""){
      axios
        .post(URLS.CUSTOMERS(), {
          customer: customer
        })
        .then(response => {
          this.order_items.customer_id = response.data.id;
          this.order_items.quantity = this.counter
          this.save_order(this.order_items);
        })
        .catch(error => {
          console.log(error);
        });
    } else{
        this.$message.warning('Bạn cần nhập đủ thông tin bên dưới');
    }
    },
    save_order(order) {
      axios
        .post(URLS.ORDERS(), {
          order: order
        })
        .then(response => {
          this.order_items.order_id = response.data.id;
          this.order_items.product_id = this.datalist.id;
          this.order_items.price = this.datalist.price_sale;
          this.save_order_items(this.order_items);
        })
        .catch(error => {
          console.log(error);
        });
    },
    save_order_items(order_item) {
      axios
        .post(URLS.ORDER_ITEMS(), {
          order_item: order_item
        })
        .then(response => {
          this.$router.push({ name: "Order_Success", params: {status: "success"}});
        })
        .catch(error => {
          console.log(error);
        });
    },
    increment() {
      this.counter++;
    },
    decrement() {
      if (this.counter > 1) this.counter--;
    },
    formatPrice(value) {
      this.order_items.total = value;
      let val = (value / 1).toFixed(0).replace(".", ",");
      return val.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".");
    },
    initializes() {
      let id = this.$route.params.id;
      axios
        .get(URLS.PRODUCT(id), {})
        .then(response => {
          this.datalist = response.data;
          let id = this.datalist.category_id;
          axios.get(URLS.CATEGORY_PRODUCTS(id), {}).then(response => {
            this.productslist = response.data;
          });
        })
        .catch(error => {});
    }
  },
  components: {
    Header,
    Footer,
    productSidebar,
    relatedProduct,
    Breadcrumbs
  }
};
window.onpopstate = function () {
    location.reload()
}; 
</script>

<style>
</style>