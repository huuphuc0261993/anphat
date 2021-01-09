<template>
  <div id="mySidenav" class="sidenav" :class="{ openSide: leftSidebarVal }">
    <a class="sidebar-overlay" @click="closeLeftBar(leftSidebarVal)"></a>
    <nav>
      <a @click="closeLeftBar(leftSidebarVal)">
        <div class="sidebar-back text-left">
          <i class="fa fa-angle-left pr-2" aria-hidden="true"></i> Back
        </div>
      </a>
      <!-- Sample menu definition -->
      <ul id="sub-menu" class="sidebar-menu" >
        <li v-for="(menuItem, index) in datalist"
            :key="index">
          <a href="javascript:void(0)" @click="setActive(menuItem.name)"
            >{{menuItem.name}}
            <span class="sub-arrow"></span>
          </a>
          
          <ul v-if="menuItem.products!=''" class="mega-menu clothing-menu" :class="{ opensidesubmenu: isActive(menuItem.name  ) }">
            <li v-for="e in menuItem.products"
            v-bind:key="e.id">
              <router-link :to="'/product_details/'+e.id">{{e.name}}</router-link >
            </li>
          </ul>
        </li>
      </ul>
    </nav>
  </div>
</template>

<script>
import axios from "axios";
import { URLS } from "../../utils/url";
export default {
  props: ["leftSidebarVal"],
  data() {
    return {
      activeItem: "clothing",
      datalist:[]
    };
  },
  mounted() {
    this.initialize()
  },
  methods: {
    initialize(){
        axios
        .get(URLS.CATEGORIES(), {
        })
        .then(response => {
          this.datalist = response.data
        })
        .catch(error => {
          console.log(error);
        });
    },
    closeLeftBar(val) {
      val = false;
      this.$emit("closeVal", val);
    },
    isActive: function(menuItem) {
      return this.activeItem === menuItem;
    },
    setActive: function(menuItem) {
      if (this.activeItem === menuItem) {
        this.activeItem = "";
      } else {
        this.activeItem = menuItem;
      }
    }
  }
};
</script>
