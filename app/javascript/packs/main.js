/* eslint no-console: 0 */
// Run this example by adding <%= javascript_pack_tag 'hello_vue' %> (and
// <%= stylesheet_pack_tag 'hello_vue' %> if you have styles in your component)
// to the head of your layout file,
// like app/views/layouts/application.html.erb.
// All it does is render <div>Hello Vue</div> at the bottom of the page.

import Vue from 'vue'
import '../assets/css/tailwind.min.css' 
import '../../../node_modules/bootstrap/dist/css/bootstrap.css'
import '../../../node_modules/bootstrap-vue/dist/bootstrap-vue.css'
import '../assets/scss/app.scss'
import '../../../node_modules/swiper/dist/css/swiper.css'
import VueAwesomeSwiper from 'vue-awesome-swiper'
import { BootstrapVue } from 'bootstrap-vue';

import App from '../app.vue'
import VueRouter from 'vue-router'
import routes from '../routes'
import Antd from 'ant-design-vue'
import 'ant-design-vue/dist/antd.css'
import { JWT_KEY } from "../utils/constant"

Vue.config.productionTip = false
Vue.use(VueRouter)
Vue.use(Antd);
Vue.use(BootstrapVue, {});
Vue.use(VueAwesomeSwiper)

const router = new VueRouter(
  {
    mode: 'history',
    routes: routes
  }
)
router.beforeEach((to, from, next) => {
  if (localStorage.getItem(JWT_KEY) == null) {
    if (to.name !== 'Login' && !to.matched.some(record => record.meta.guest)) {
      router.push('/login')
    }
    else if (to.name !== 'Login' && to.matched.some(record => record.meta.guest)) {
      next()
    }
  } else {
    if (to.name == '' && to.matched.some(record => record.meta.guest)) {
      router.push('/')
    }
  }
  next()
})

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    router,
    render: h => h(App),
  }).$mount()
  document.body.appendChild(app.$el)

  console.log(app)
})

