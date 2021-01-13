<template>
  <div>
    <Header />
    <Breadcrumbs title="CHÍNH SÁCH ĐỔI TRẢ" />
    <section class="section-b-space blog-page ratio2_3">
      <div class="container">
        <div class="row">
          <!--Blog List start-->
          <div class="col-12">
          </div>
          <!--Blog List start-->
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

export default {
  components: {
    Header,
    Breadcrumbs,
    Footer
  }
}
</script>
