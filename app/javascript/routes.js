import News from './pages/news'
import Products from './pages/products'
import Banners from './pages/banners'
import Categories from './pages/categories'
import List_Orders from './pages/list_orders'
import Login from './pages/guest/Login'
import ForgetPassword from './pages/guest/ForgetPassword'
import SignUp from './pages/guest/SignUp'

const routes = [
    {
        path: '/news',
        name: 'News',
        component: News
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
        component: Categories
    },
    {
        path: '/list_orders',
        name: 'List_Orders',
        component: List_Orders
    },
    {
        path: '/login',
        name: 'Login',
        component: Login
    },
    {
        path: '/forget_password',
        name: 'ForgetPassword',
        component: ForgetPassword
    },
    {
        path: '/sign_up',
        name: 'SignUp',
        component: SignUp
    }
]

export default routes
