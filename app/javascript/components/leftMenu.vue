<template>
  <a-layout-sider v-model="collapsed" :trigger="null" collapsible>
    <div class="logo" />
    <a-menu theme="dark" mode="inline" :default-selected-keys="['1']">
      <a-menu-item key="1">
        <router-link :to="{ name: 'News' }">
          <a-icon type="user" />
          <span>Tin tức</span>
        </router-link>
      </a-menu-item>

      <a-menu-item key="2">
        <router-link :to="{ name: 'Products' }">
          <a-icon type="video-camera" />
          <span>Sản phẩm</span>
        </router-link>
      </a-menu-item>

      <a-menu-item key="3">
        <router-link :to="{ name: 'Categories' }">
          <a-icon type="upload" />
          <span>Loại sản phẩm</span>
        </router-link>
      </a-menu-item>

      <a-menu-item key="4">
        <router-link :to="{ name: 'Banners' }">
          <a-icon type="upload" />
          <span>Banners</span>
        </router-link>
      </a-menu-item>

      <a-menu-item key="5">
        <router-link :to="{ name: 'List_Orders' }">
          <a-icon type="upload" />
          <span>List Orders</span>
        </router-link>
      </a-menu-item>
    </a-menu>
  </a-layout-sider>
</template>

<script>
import Vue from "vue";
export default {
  data() {
    return {
      collapsed: false
    };
  }
};
</script>

<style>
</style>