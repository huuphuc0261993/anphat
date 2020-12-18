import News from './pages/news'
import Products from './pages/products'
import Banners from './pages/banners'
import Categories from './pages/categories'
import List_Orders from './pages/list_orders'
import Home from './pages/home'
import Login from './pages/guest/Login'
import ForgetPassword from './pages/guest/ForgetPassword'
import SignUp from './pages/guest/SignUp'


const routes = [
    {
        path: '/',
        name: 'Home',
        component: Home
    },
    {
        path: '/news',
        name: 'News',
        component: News,
    },
    {
        path: '/products',
        name: 'Products',
        component: Products
    },
    {
        path: '/banners',
        name: 'Banners',
        component: Banners
    },
    {
        path: '/categories',
        name: 'Categories',
        component: Categories,
    },
    {
        path: '/list_orders',
        name: 'List_Orders',
        component: List_Orders
    },
    {
        path: '/login',
        name: 'Login',
        component: Login,
        meta: {
            guest: true
        }
    },
    {
        path: '/forget_password',
        name: 'ForgetPassword',
        component: ForgetPassword,
        meta: {
            guest: true
        }
    },
    {
        path: '/sign_up',
        name: 'SignUp',
        component: SignUp,
        meta: {
            guest: true
        }
    }
]


//   routes.afterEach((to, from) => {
//     // set active menu
//     store.commit('menu/SET_SELECTED_KEYS', to.name)
//     if (to.meta.openKey) {
//       store.commit('menu/SET_OPEN_KEYS', to.meta.openKey)
//     } else {
//       store.commit('menu/SET_OPEN_KEYS', '')
//     }
//   })

export default routes
