<template>
  <div id="main">
    <div v-if="layout == 'Login'">
      <router-view />
    </div>
    <div v-else-if="layout == 'Home'">
      <router-view />
    </div>
    <div v-else-if="layout == 'Product_Details'">
      <router-view />
    </div>
    <div v-else-if="layout == 'Order_Success'">
      <router-view />
    </div>
    <div v-else-if="layout == 'Blog'">
      <router-view />
    </div>
    <div v-else-if="layout == 'Blog_Detail'">
      <router-view />
    </div>
    <div v-else-if="layout == 'Contact'">
      <router-view />
    </div>
    <div v-else-if="layout == 'Introduce'">
      <router-view />
    </div>
    <div v-else-if="layout == 'Protect'">
      <router-view />
    </div>
    <div v-else-if="layout == 'Payment'">
      <router-view />
    </div>
    <div v-else-if="layout == 'Type_Product'">
      <router-view />
    </div>
    <div v-else-if="layout == 'Change'">
      <router-view />
    </div>
    <div v-else-if="layout == 'Hiding'">
      <router-view />
    </div>
    <div v-else-if="layout == 'Hiding_Detail'">
      <router-view />
    </div>
    <div v-else>
      <a-layout id="components-layout-demo-custom-trigger">
        <leftMenu></leftMenu>
        <a-layout>
          <a-layout-header style="background: #fff; padding: 0">
            <a-icon
              class="trigger"
              :type="collapsed ? 'menu-unfold' : 'menu-fold'"
              @click="() => (collapsed = !collapsed)"
            />
            <a-row class="float-right">
              <a-popover placement="bottomRight">
                <template slot="content">
                  <div>
                    <a href="#" @click="logout">
                      <a-icon
                        type="poweroff"
                        style="color: orangered"
                        class="mr-2"
                      />
                      Đăng xuất</a
                    >
                  </div>
                </template>
                <a-avatar style="backgroundcolor: #87d068" icon="user" />
              </a-popover>
            </a-row>
          </a-layout-header>
          <a-layout-content
            :style="{
              margin: '24px 16px',
              padding: '24px',
              background: '#fff',
              minHeight: '280px',
            }"
          >
            <router-view></router-view>
          </a-layout-content>
        </a-layout>
      </a-layout>
    </div>
  </div>
</template>
<script>
import leftMenu from "./components/leftMenu.vue";
import Login from "./pages/guest/Login";
import Home from "./pages/home";
import { URLS } from "./utils/url";
import axios from "axios";
export default {
  data() {
    return {
      collapsed: false,
    };
  },
  components: {
    leftMenu,
    Login,
  },
  methods: {
    logout() {
      localStorage.clear();
      axios
        .delete(URLS.LOGOUT(), {})
        .then((response) => {})
        .catch((error) => {
          console.log(error);
        });
      this.$router.push({ name: "Login" });
    },
  },
  computed: {
    layout() {
      return this.$route.name || "";
    },
  },
};
</script>
<style>
#components-layout-demo-custom-trigger .trigger {
  font-size: 18px;
  line-height: 64px;
  padding: 0 24px;
  cursor: pointer;
  transition: color 0.3s;
}

#components-layout-demo-custom-trigger .trigger:hover {
  color: #1890ff;
}

#components-layout-demo-custom-trigger .logo {
  height: 32px;
  background: rgba(255, 255, 255, 0.2);
  margin: 16px;
}

#components-layout-demo-custom-trigger {
  height: 100vh;
}
.float-right.ant-row {
  margin-right: 1%;
}
</style>
