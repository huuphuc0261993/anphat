<template>
  <div id="app">
    <!-- <HeaderComponents v-bind:titleHeader = "title"/> -->
    <p>{{ title }}</p>
    
  </div>
</template>

<script>
/* props -> truyen data tu Components cha vao Components con 
-> cu phap giong thuoc tinh -> rang buoc thuoc tinh
su dung v-bind
*/
// import HeaderComponents from './components/HeaderComponents'

export default {
  data: function () {
    return {
      title: "Hello word!"
    }
  },
  components: {
    // HeaderComponents
  }
}
</script>

<style scoped>
#app {
  font-size: 2em;
  text-align: center;
}
</style>
