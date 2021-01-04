<template>
  <div>
    <header>
      <div class="mobile-fix-option"></div>
      <TopBar />
      <div class="container">
        <div class="row">
          <div class="col-sm-12">
            <div class="main-menu">
              <div class="menu-left">
                <div class="navbar">
                  <a @click="left_sidebar">
                    <div class="bar-style">
                      <i class="fa fa-bars sidebar-bar" aria-hidden="true"></i>
                    </div>
                  </a>
                  <LeftSidebar
                    :leftSidebarVal="leftSidebarVal"
                    @closeVal="closeBarValFromChild"
                  />
                </div>
                <div class="brand-logo">
                    <img src='/uploads/assets/images/logos/anphat.png' style="width:20%" class="img-fluid" alt />                  
                </div>
                <div class="brand-logo"></div>
              </div>
              <div class="menu-right pull-right">
                <Nav />
              </div>
            </div>
          </div>
        </div>
      </div>
    </header>
  </div>
</template>
<script>
import TopBar from "../widgets/topbar";
import LeftSidebar from "../widgets/left-sidebar";
import Nav from "../widgets/navbar";
export default {
  data() {
    return {
      leftSidebarVal: false
    };
  },
  components: {
    TopBar,
    LeftSidebar,
    Nav
  },
  methods: {
    left_sidebar() {
      this.leftSidebarVal = true;
    },
    closeBarValFromChild(val) {
      this.leftSidebarVal = val;
    }
  }
};
</script>
