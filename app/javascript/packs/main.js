/* eslint no-console: 0 */
// Run this example by adding <%= javascript_pack_tag 'hello_vue' %> (and
// <%= stylesheet_pack_tag 'hello_vue' %> if you have styles in your component)
// to the head of your layout file,
// like app/views/layouts/application.html.erb.
// All it does is render <div>Hello Vue</div> at the bottom of the page.

import Vue from 'vue'
import '../assets/css/tailwind.min.css'
import App from '../app.vue'
import VueRouter from 'vue-router'
import routes from '../routes'
import Antd from 'ant-design-vue'
import 'ant-design-vue/dist/antd.css'

Vue.config.productionTip = false
Vue.use(VueRouter)
Vue.use(Antd);
const router = new VueRouter(
  {
    mode: 'history',
    routes: routes
  }
)

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    router,
    render: h => h(App),
  }).$mount()
  document.body.appendChild(app.$el)

  console.log(app)
})

