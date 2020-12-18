<template>
  <a-form-model layout="inline" :model="formInline" @submit="handleSubmit" @submit.native.prevent>
    <a-form-model-item>
      <a-input v-model="formInline.email" placeholder="Username">
        <a-icon slot="prefix" type="user" style="color:rgba(0,0,0,.25)" />
      </a-input>
    </a-form-model-item>
    <a-form-model-item>
      <a-input v-model="formInline.password" type="password" placeholder="Password">
        <a-icon slot="prefix" type="lock" style="color:rgba(0,0,0,.25)" />
      </a-input>
    </a-form-model-item>
    <a-form-model-item>
      <a-button
        type="primary"
        html-type="submit"
        :disabled="formInline.email === '' || formInline.password === ''"
      >
        Log in
      </a-button>
    </a-form-model-item>
  </a-form-model>
</template>
<script>
import axios from "axios";
import { URLS } from "../../utils/url";
export default {
  data() {
    return {
      formInline: {
        email: '',
        password: '',
      },
    };
  },
  methods: {
    handleSubmit(e) {
      console.log(this.formInline);
       axios
          .post(URLS.LOGIN(), {
            customer: this.formInline
          })
          .then(response => {

       console.log(response)
            this.$message.success("Tạo banner thành công");
          })
          .catch(error => {
            console.log(error);
          });
    },
  },
};
</script>
