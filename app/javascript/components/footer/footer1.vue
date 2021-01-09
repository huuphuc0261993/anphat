<template>
  <div>
    <footer class="footer-light">
      <!-- <div class="light-layout">
        <div class="container">
          <section class="small-section border-section border-top-0">
            <div class="row">
              <div class="col-lg-6">
                <div class="subscribe">
                  <div>
                    <h4>NHẬP THÔNG TIN ĐỂ NHẬN BÁO GIÁ</h4>
                    <p>Chúng tôi sẽ gửi báo giá cho bạn trong vòng 30 phút</p>
                  </div>
                </div>
              </div>
              <div class="col-lg-6">
                <div
                  class="form-inline subscribe-form auth-form needs-validation"
                  method="post"
                  id="mc-embedded-subscribe-form"
                  name="mc-embedded-subscribe-form"
                  target="_blank"
                >
                  
                </div>
              </div>
            </div>
          </section>
        </div>
      </div> -->
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
                        <i class="fa fa-map-marker"></i>1/78 Nguyễn Hữu Dật,
                        Phường Hương Long, Thành phố Huế, Tỉnh Thừa Thiên Huế
                      </li>
                      <li>
                        <i class="fa fa-phone"></i>HotLine: +8482 83 84 175
                      </li>
                      <li>
                        <i class="fa fa-envelope-o"></i>Email Us:
                        <a href="#">anpat.apa@gmail.com</a>
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
                <div class="footer-contant">
                  <ul v-for="(e, index) in categories" :key="index">
                    <li>
                      <a href="#">{{ e.name }}</a>
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
                      <a href="#">Chính sách bảo hành</a>
                    </li>
                    <li>
                      <a href="#">Chính sách thanh toán</a>
                    </li>
                    <li>
                      <a href="#">chính sách đổi trả</a>
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
                      name="EMAIL"
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
