<template>
  <div>
    <!-- Sample menu definition -->
    <div class="main-navbar">
      <div id="mainnav">
        <div
          class="toggle-nav"
          :class="leftSidebarVal ? 'toggle-button' : ''"
          @click="openmobilenav = true"
        >
          <i class="fa fa-bars sidebar-bar"></i>
        </div>
        <ul class="nav-menu" :class="{ opennav: openmobilenav }">
          <li class="back-btn">
            <div class="mobile-back text-right">
              <span @click="openmobilenav = false">Back</span>
              <i class="fa fa-angle-right pl-2" aria-hidden="true"></i>
            </div>
          </li>
          <li v-for="(menuItem, index) in menulist" :key="index" >
            <router-link v-if="menuItem.title === 'TRANG CHỦ'"
              :to="{ name: 'Home' }"
              class="nav-link"
              @click="setActive(menuItem.title)"
            >
              {{ menuItem.title }}
              <span
                class="sub-arrow"
                v-if="menuItem.children"
              ></span>
            </router-link>
            <router-link v-else-if="menuItem.title === 'GIỚI THIỆU'"
              :to="{ name: 'Introduce' }"
              class="nav-link"
              @click="setActive(menuItem.title)"
            >
              {{ menuItem.title }}
            </router-link>
            <router-link v-else-if="menuItem.title === 'TIN TỨC'"
              :to="{ name: 'Blog' }"
              class="nav-link"
              @click="setActive(menuItem.title)"
            >
              {{ menuItem.title }}
            </router-link>
            <router-link v-else-if="menuItem.title === 'LIÊN HỆ'"
              :to="{ name: 'Contact' }"
              class="nav-link"
              @click="setActive(menuItem.title)"
            >
              {{ menuItem.title }}
            </router-link>
            <router-link v-else
              :to="{ name: 'Home' }"
              class="nav-link"
              @click="setActive(menuItem.title)"
            >
              {{ menuItem.title }}
              <span
                class="sub-arrow"
                v-if="menuItem.children"
              ></span>
            </router-link>
            <ul
              class="nav-submenu"
              :class="{ opensubmenu: isActive(menuItem.name) }"
              v-if="menuItem.children"
            >
              <li
                v-for="(childrenItem, index) in menuItem.children"
                :key="index"
              >
                <a
                  @click="setActiveChild(childrenItem.name)"
                  v-if="childrenItem.products"
                >
                  {{ childrenItem.name }}
                  <span class="sub-arrow" v-if="childrenItem.products"></span>
                </a>
                <ul
                  class="nav-sub-childmenu"
                  :class="{ opensubchild: isActiveChild(childrenItem.name) }"
                  v-if="childrenItem.products"
                >
                  <li
                    v-for="(childrenSubItem, index) in childrenItem.products"
                    :key="index"
                  >
                    <router-link :to="'/product_details/' + childrenSubItem.id">
                      {{ childrenSubItem.name }}
                    </router-link>
                  </li>
                </ul>
              </li>
            </ul>
          </li>
        </ul>
      </div>
    </div>
  </div>
</template>
<script>
import axios from "axios";
import { URLS } from "../../utils/url";
export default {
  props: ["leftSidebarVal"],
  data() {
    return {
      openmobilenav: false,
      subnav: false,
      activeItem: "",
      activeChildItem: "fashion 1",
      activemegaChild: "portfolio",
      menulist: [
        {
          title: "TRANG CHỦ",
          type: "sub",
          path: ""
        },
        {
          title: "GIỚI THIỆU",
          type: "sub",
          path: "/introduce"
        },
        {
          title: "SẢN PHẨM",
          megamenu: true,
          type: "sub",
          active: false,
          children: [
            {
              title: "Sidebar",
              type: "sub",
              active: false,
              children: []
            }
          ]
        },
        {
          title: "TIN TỨC",
          type: "sub",
          active: false,
          path: "/blog"
        },
        {
          title: "LIÊN HỆ",
          type: "sub",
          path: "/contact"
        },
      ]
    };
  },
  mounted() {
    this.initialize();
  },
  methods: {
    initialize() {
      axios
        .get(URLS.CATEGORIES(), {})
        .then(response => {
          this.menulist[2].children = response.data;
        })
        .catch(error => {
          console.log(error);
        });
    },
    mobilenav() {
      this.openmobilenav = !this.openmobilenav;
    },
    isActive(menuItem) {
      return this.activeItem === menuItem;
    },
    setActive(menuItem) {
      if (this.activeItem === menuItem) {
        this.activeItem = "Home";
      }else {
        this.activeItem = menuItem;
      }
    },
    isActiveChild(menuChildItem) {
      return this.activeChildItem === menuChildItem;
    },
    setActiveChild(menuChildItem) {
      if (this.activeChildItem === menuChildItem) {
        this.activeChildItem = "";
      } else {
        this.activeChildItem = menuChildItem;
      }
    },
    isActivesubmega(megaChildItem) {
      return this.activemegaChild === megaChildItem;
    },
    setActivesubmega(megaChildItem) {
      if (this.activemegaChild === megaChildItem) {
        this.activemegaChild = "";
      } else {
        this.activemegaChild = megaChildItem;
      }
    }
  }
};
</script>

<style lang="scss" scoped>
.toggle-nav {
  &.toggle-button {
    z-index: 1;
  }
}
</style>