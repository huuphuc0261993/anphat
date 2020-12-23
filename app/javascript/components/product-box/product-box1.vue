<template>
  <div>
    <div class="img-wrapper">
      <div class="front">
        <router-link :to="'/product_details/'+product.id">
          <img
            :src="product.pictures_attributes[0].url"
            class="img-fluid bg-img"
          />
        </router-link>
      </div>
    </div>
    <div class="product-detail">
      <div class="rating">
        <i class="fa fa-star"></i>
        <i class="fa fa-star"></i>
        <i class="fa fa-star"></i>
        <i class="fa fa-star"></i>
        <i class="fa fa-star"></i>
      </div>
      <a>
        <h6>{{ product.name }}</h6>
      </a>
      <h4>
        {{ formatPrice(product.price_sale) }}đ<del>{{ product.price }}</del>
      </h4>
    </div>
  </div>
</template>
<script>
export default {
  props: ["product", "index"],
  data() {
    return {
      imageSrc: ""
    };
  },
  computed: {},
  methods: {
    formatPrice(value) {
      let val = (value / 1).toFixed(0).replace(".",",");
      return val.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".");
    }
  }
};
</script>
