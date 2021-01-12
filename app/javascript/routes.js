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
import Order_Success from './components/order_success/order_success'
// import Editor from './components/editor/editor'
import Blog from './pages/blog/blog_nosidebar'
import Blog_Detail from './pages/blog/blog_detail'
import About from './pages/about/about'
import Introduce from './pages/introduce/introduce'

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
        path: '/about',
        name: 'About',
        component: About,
        meta: {
            guest: true
        }
    },
    {
        path: '/introduce',
        name: 'Introduce',
        component: Introduce,
        meta: {
            guest: true
        }
    },
    {
        path: '/blog',
        name: 'Blog',
        component: Blog,
        meta: {
            guest: true
        }
    },
    {
        path: '/blog_detail/:id',
        name: 'Blog_Detail',
        component: Blog_Detail,
        meta: {
            guest: true
        }
    },
    {
        path: '/order_success',
        name: 'Order_Success',
        component: Order_Success,
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
