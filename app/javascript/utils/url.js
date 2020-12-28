export const getBaseUrl = () => {
  return "/api";
};
export const URLS = {
  IMAGES: () => `${getBaseUrl()}/pictures`,
  IMAGE: (id) => `${getBaseUrl()}/pictures/${id}`,

  PRODUCTS: () => `${getBaseUrl()}/products`,
  PRODUCT: (id) => `${getBaseUrl()}/products/${id}`,

  BANNERS: () => `${getBaseUrl()}/banners`,
  BANNER: (id) => `${getBaseUrl()}/banners/${id}`,

  CUSTOMERS: () => `${getBaseUrl()}/customers`,
  CUSTOMER: (id) => `${getBaseUrl()}/customers/${id}`,

  ORDERS: () => `${getBaseUrl()}/orders`,
  ORDER: (id) => `${getBaseUrl()}/orders/${id}`,

  BLOGS: () => `${getBaseUrl()}/news`,
  BLOG: (id) => `${getBaseUrl()}/news/${id}`,

  ORDER_ITEMS: () => `${getBaseUrl()}/order_items`,
  ORDER_ITEM: (id) => `${getBaseUrl()}/order_items/${id}`,

  CATEGORIES: () => `${getBaseUrl()}/categories`,

  LOGIN: () => `${getBaseUrl()}/login`,
  
  LOGOUT: () => `${getBaseUrl()}/logout`,

  CATEGORY_PRODUCTS: (id) => `${getBaseUrl()}/categories/${id}/products`,
};
