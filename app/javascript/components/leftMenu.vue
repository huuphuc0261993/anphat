<template>
  <a-layout-sider v-model="collapsed" :trigger="null" collapsible>
    <div class="logo" />
    <a-menu theme="dark" mode="inline" :default-selected-keys="['1']">
      <a-menu-item key="1">
        <router-link :to="{ name: 'News' }">
          <a-icon type="sound" />
          <span>Tin tức</span>
        </router-link>
      </a-menu-item>

      <a-menu-item key="2">
        <router-link :to="{ name: 'Products' }">
          <a-icon type="gift" />
          <span>Sản phẩm</span>
        </router-link>
      </a-menu-item>

      <a-menu-item key="3">
        <router-link :to="{ name: 'Categories' }">
          <a-icon type="apartment" />
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
        <router-link :to="{ name: 'Info' }">
          <a-icon type="form" />
          <span>Giới thiệu</span>
        </router-link>
      </a-menu-item>

      <a-menu-item key="6">
        <router-link :to="{ name: 'List_Orders' }">
          <a-icon type="unordered-list" />
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