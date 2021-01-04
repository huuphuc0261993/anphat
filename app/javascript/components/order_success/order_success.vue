<template>
  <div>
    <Header />
     <!-- thank-you section start -->
    <section class="section-b-space light-layout" v-if="this.$route.params.status=='success'">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <div class="success-text">
              <i class="fa fa-check-circle" aria-hidden="true"></i>
              <h2>thank you</h2>
              {{order_id}}
              <p>
                Chúng tôi đã nhận được thông tin của bạn, chúng tôi sẽ liên hệ
                với bạn trong vòng 15 phút
              </p>
              <router-link :to="{ path: '/' }" :class="'btn btn-solid'">
                back to home</router-link
              >
            </div>
          </div>
        </div>
      </div>
    </section>
    <section class="p-0" v-else>
      <div class="container">
        <div class="row">
          <div class="col-sm-12">
            <div class="error-section">
              <h1>404</h1>
              <h2>Trang không tồn tại</h2>
            </div>
          </div>
        </div>
      </div>
    </section>
    <Footer />
  </div>
</template>
<script>
import Header from "../header/header";
import Footer from "../footer/footer1";
export default {
  data(){
    return{
      order:"",
      order_id: ""
    }
  },
  components: {
    Header,
    Footer
  },
  computed: {
  },
  mounted(){
  },
  methods: {
  }
};
</script>
