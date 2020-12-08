import News from './pages/news'
import Products from './pages/products'
import Banners from './pages/banners'
import Categories from './pages/categories'
import List_Orders from './pages/list_orders'

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
    }
]

export default routes
