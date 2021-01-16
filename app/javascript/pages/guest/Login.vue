<template>
  <div class="login-form">
    <h1 class="text-center" style="font-size: 20px"> Đăng nhập</h1>
    <a-alert
      v-show="isShowError"
      type="error"
      message="Sai mật khẩu hoặc tài khoản"
      banner
    />
    <a-form-model
      layout="inline"
      :model="formInline"
      @submit="handleSubmit"
      @submit.native.prevent
    >
      <a-form-model-item>
        <a-input
          v-model="formInline.email"
          placeholder="Username"
          style="width:200%"
        >
          <a-icon slot="prefix" type="user" style="color:rgba(0,0,0,.25)" />
        </a-input>
      </a-form-model-item>
      <a-form-model-item>
        <a-input
          v-model="formInline.password"
          type="password"
          placeholder="Password"
          style="width:200%"
        >
          <a-icon slot="prefix" type="lock" style="color:rgba(0,0,0,.25)" />
        </a-input>
      </a-form-model-item>
      <a-form-model-item>
        <a-button
          class="login-form-button"
          type="primary"
          html-type="submit"
          :disabled="formInline.email === '' || formInline.password === ''"
          style=" border-radius: 8px"
        >
          Log in
        </a-button>
      </a-form-model-item>
    </a-form-model>
  </div>
</template>
<script>
import axios from "axios";
import { URLS } from "../../utils/url";
import { JWT_KEY } from "../../utils/constant";
export default {
  name: "Login",
  data() {
    return {
      isShowError: false,
      formInline: {
        email: "",
        password: ""
      }
    };
  },
  methods: {
    handleSubmit(e) {
      axios
        .post(URLS.LOGIN(), {
          customer: this.formInline
        })
        .then(response => {
          this.submitSuccessful(response);
        })
        .catch(error => {
          this.isShowError = true;
          console.log(error);
        });
    },
    submitSuccessful(response) {
      this.$message.success("Bạn đã đang nhập thành công...", 2);
      setTimeout(() => {
        localStorage.setItem(JWT_KEY, response.headers.authorization);
        this.$router.push({ name: "News" });
      }, 1000);
    }
  }
};
window.onpopstate = function () {
    location.reload()
};
</script>
<style>
button.ant-btn.ant-btn-primary {
  margin-top: 10px;
}
</style>
