<template>
  <div class="login-form">
    <h1 class="text-center">Quên mật khẩu</h1>
    <a-alert
      v-if="isError"
      :type="message.type"
      :message="message.text"
      :banner="true"
    />
    <a-form id="form-login" :form="form" @submit="handleSubmit">
      <a-form-item>
        <a-row>
          <a-col :span="16" class="pr-2">
            <a-input
              v-decorator="[
            'email',
            { rules: [{ required: true, message: 'Vui lòng điền email' }] },
          ]"
              type="email"
              placeholder="Email"
            >
              <a-icon
                slot="prefix"
                type="inbox"
                style="color: rgba(0, 0, 0, 0.25)"
              />
            </a-input>
          </a-col>
          <a-col :span="8">
            <a-button type="primary" html-type="submit" class="login-form-button" :disabled="isDisableButton">
              Nhận mật khẩu
            </a-button>
          </a-col>
        </a-row>
      </a-form-item>
      <a-form-item>
        <a-row>
          <a-col :span="12">
            <router-link :to="{name: 'SignUp'}">Đăng ký</router-link>
          </a-col>
          <a-col :span="12">
            <router-link :to="{name: 'Login'}">Đăng nhập</router-link>
          </a-col>
        </a-row>
      </a-form-item>
    </a-form>
  </div>
</template>
<script>
  import { URLS } from "../../utils/url";
  // import { JWT_KEY } from "../../utils/constant";
  import axios from "axios";
  export default {
    name: 'ForgetPassword',
    data() {
      return {
        message: {},
        isDisableButton: false,
        isShowError: false,
        form: this.$form.createForm(this, { name: "forget_password" })
      };
    },
    computed: {
      isError() {
        return this.message && this.message.text
      }
    },
    methods: {
      async handleSubmit(e) {
        e.preventDefault()
        this.isShowError = false;
        this.isDisableButton = true
        this.form.validateFields(async (err, values) => {
          if (!err) {
            try {
              const response = await axios.post(URLS.FORGET_PASSWORD(), {forget_password: values})
              this.submitSuccessful(response);
            } catch (e) {
              this.isDisableButton = false
              this.submitFailed(e.response.data.message);
            }
          }
        })
      },
      submitSuccessful(response) {
        this.message = {text: 'Vui lòng kiểm tra email để lấy lại mật khẩu', type: 'success'}
      },
      submitFailed(error) {
        this.message = {text: error, type: 'error'}
      },
    },
  };
</script>
<style>
  .login-form {
    max-width: 400px;
    margin: 5% auto;
  }
  .login-form .login-form-button {
    width: 100%;
  }
  .login-form .login-form-forgot {
    float: right;
  }
</style>
