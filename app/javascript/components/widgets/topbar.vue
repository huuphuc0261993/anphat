<template>
  <div class="top-header">
    <div class="container">
      <div class="row">
        <div class="col-lg-6">
          <div class="header-contact">
            <ul>
              <li>Chào mừng bạn đến với công ty An Phát </li>
              <li>
                <i class="fa fa-phone" aria-hidden="true"></i>Hotline: +8482 83 84 175 
                - 7890
              </li>
            </ul>
          </div>
        </div>
        <div class="col-lg-6 text-right">
          <ul class="header-dropdown">
            <li class="mobile-wishlist"></li>
            <li class="onhover-dropdown mobile-account">
              <i class="fa fa-user" aria-hidden="true"></i> My Account
              <ul class="onhover-show-div">
                <li>
                  <a href="/login">Login</a>
                </li>
              </ul>
            </li>
          </ul>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import firebase from "firebase";
export default {
  data() {
    return {
      isLogin: false
    };
  },
  created() {
    if (process.client) {
      this.isLogin = localStorage.getItem("userlogin");
    }
  },
  methods: {}
};
</script>
