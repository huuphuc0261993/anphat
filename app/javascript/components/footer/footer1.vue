<template>
  <div>
    <footer class="footer-light">
      <section class="section-b-space light-layout" style="padding-top:70px">
        <div class="container">
          <div class="row footer-theme partition-f">
            <div class="col-lg-4 col-md-6">
              <div class="footer-title footer-mobile-title">
                <h4>about</h4>
              </div>
              <div class="footer-contant">
                <div class="footer-logo">
                  <img
                    src="/uploads/assets/images/logos/anphat.png"
                    style="width:20%"
                    class="img-fluid"
                    alt
                  />
                </div>
                <div class="sub-title">
                  <div class="footer-contant">
                    <ul class="contact-list">
                      <b>LIÊN HỆ VỚI CHÚNG TÔI</b>
                      <li>
                        <i class="fa fa-map-marker"></i>VP: 220 Điện Biên Phủ, Phường Trường An, TP Huế                      </li>
                      <li>
                        <i class="fa fa-phone"></i>HotLine: +84 82 83 84 175, +84 91 476 2 552
                      </li>
                      <li>
                        <i class="fa fa-envelope-o"></i>Email: 
                        <a href="#" style="text-transform: none">anphathue.vn@gmail.com</a>
                      </li>
                      <li><i class="fa fa-building"></i>MST: 3301684366</li>
                    </ul>
                  </div>
                </div>
                <div class="footer-social">
                  <ul>
                    <li>
                      <a href="https://www.facebook.com/anphatHue">
                        <i class="fa fa-facebook" aria-hidden="true"></i>
                      </a>
                    </li>
                    <li>
                      <a href="#">
                        <i class="fa fa-twitter" aria-hidden="true"></i>
                      </a>
                    </li>
                    <li>
                      <a href="#">
                        <i class="fa fa-instagram" aria-hidden="true"></i>
                      </a>
                    </li>
                  </ul>
                </div>
              </div>
            </div>
            <div class="col offset-xl-1">
              <div class="sub-title">
                <div class="footer-title">
                  <h4>SẢN PHẨM</h4>
                </div>
                <div class="footer-contant scrollable-menu" >
                  <ul v-for="(e, index) in categories" :key="index" >
                    <li>
                      <a :href="'/type_product/'+e.id">{{ e.name }}</a>
                    </li>
                  </ul>
                </div>
              </div>
            </div>
            <div class="col">
              <div class="sub-title">
                <div class="footer-title">
                  <h4>CHÍNH SÁCH</h4>
                </div>
                <div class="footer-contant">
                  <ul>
                    <li>
                      <router-link :to="{ name: 'Protect' }">Chính sách bảo hành</router-link>
                    </li>
                    <li>
                      <router-link :to="{ name: 'Payment' }">Chính sách thanh toán</router-link>
                    </li>
                    <li>
                      <router-link :to="{ name: 'Change' }">chính sách đổi trả</router-link>
                    </li>
                  </ul>
                </div>
              </div>
            </div>
            <div class="col sub-title">
              <div class="footer-title">
                  <h4 style="line-height: 140% ; margin-bottom: 4%">NHẬN BÁO GIÁ VÀ TƯ VẤN MIỄN PHÍ 24/7</h4>
                </div>
              <div>
                    <input
                      type="text"
                      class="form-control"
                      name="fullname"
                      placeholder="Họ và tên"
                      v-model="order_items.name"
                      style="margin-bottom: 2%"
                    />
                    <input
                      type="text"
                      class="form-control"
                      name="EMAIL"
                      id="mce-EMAIL"
                      placeholder="Email"
                      v-model="order_items.email"
                      style="margin-bottom: 2%"
                    />
                    <input
                      type="text"
                      class="form-control"
                      name="SDT"
                      placeholder="Số điện thoại"
                      v-model="order_items.phone"
                      style="margin-bottom: 2%"
                    />
                    <button
                      class="btn btn-solid"
                      @click="save(order_items)"
                      style="width:100%"
                    >
                      Gửi
                    </button>
                  </div>
            </div>
          </div>
        </div>
      </section>
      <div class="sub-footer">
        <div class="container">
          <div class="row">
            <div class="col-xl-6 col-md-6 col-sm-12">
              <div class="footer-end">
                <p>
                  <i class="fa fa-copyright" aria-hidden="true"></i> Ngày hoạt
                  động: 21-10-2020
                </p>
              </div>
            </div>
            <div class="col-xl-6 col-md-6 col-sm-12">
              <div class="payment-card-bottom">
                <ul>
                  <li>
                    <a href="#">
                      <img src="/uploads/assets/images/icon/visa.png" alt />
                    </a>
                  </li>
                  <li>
                    <a href="#">
                      <img
                        src="/uploads/assets/images/icon/mastercard.png"
                        alt
                      />
                    </a>
                  </li>
                  <li>
                    <a href="#">
                      <img src="/uploads/assets/images/icon/paypal.png" alt />
                    </a>
                  </li>
                  <li>
                    <a href="#">
                      <img
                        src="/uploads/assets/images/icon/american-express.png"
                        alt
                      />
                    </a>
                  </li>
                  <li>
                    <a href="#">
                      <img src="/uploads/assets/images/icon/discover.png" alt />
                    </a>
                  </li>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
    </footer>
  </div>
</template>

<script>
import axios from "axios";
import { URLS } from "../../utils/url";
export default {
  mounted() {
    this.initialize();
  },
  data() {
    return {
      order_items: {
        name: "",
        phone: "",
        email: "",
        total: "",
        customer_id: "",
        price: "",
        product_id: "3",
        order_id: "",
        quantity: "",
        encrypted_password: ""
      },
      categories: []
    };
  },
  methods: {
    initialize() {
      axios
        .get(URLS.CATEGORIES(), {})
        .then(response => {
          this.categories = response.data;
        })
        .catch(error => {
          console.log(error);
        });
    },
    save(customer) {
      if(customer.name != "" & customer.phone != "" & customer.email !="")
      {
        axios
        .post(URLS.CUSTOMERS(), {
          customer: customer
        })
        .then(response => {
          this.order_items.customer_id = response.data.id;
          this.save_order(this.order_items);
        })
        .catch(error => {
          console.log(error);
        });
      }else{
        this.$message.warning('Bạn cần nhập đủ thông tin');
      }
      
    },
    save_order(order) {
      axios
        .post(URLS.ORDERS(), {
          order: order
        })
        .then(response => {
          this.order_items.order_id = response.data.id;
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
          this.$router.push({
            name: "Order_Success",
            params: { status: "success" }
          });
        })
        .catch(error => {
          console.log(error);
        });
    }
  }
};
</script>
<style scoped>
.scrollable-menu {
    height: auto;
    max-height: 300px;
    overflow-x: hidden;
}
</style>
