import News from './pages/news'
import Products from './pages/products'
import Banners from './pages/banners'
import Categories from './pages/categories'
import List_Orders from './pages/list_orders'
import Home from './pages/home'
import Login from './pages/guest/Login'
import ForgetPassword from './pages/guest/ForgetPassword'
import SignUp from './pages/guest/SignUp'
import Product_Details from './pages/product_detail/product_detail'

const routes = [
    {
        path: '/',
        name: 'Home',
        component: Home,
        meta: {
            guest: true
        }
    },
    {
        path: '/product_details/:id',
        name: 'Product_Details',
        component: Product_Details,
        meta: {
            guest: true
        }
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

export default routes
