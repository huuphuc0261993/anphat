<template>
  <div>
    <Header />
    <Breadcrumbs title="TIN TỨC" />
    <section class="section-b-space blog-page ratio2_3">
      <div class="container">
        <div class="row">
          <!--Blog List start-->
          <div class="col-12">
          <BlogList />
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
import BlogList from './widgets/blog_list'

export default {
  components: {
    Header,
    Breadcrumbs,
    BlogList,
    Footer
  }
}
</script>
