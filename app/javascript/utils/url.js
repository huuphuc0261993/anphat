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

  CATEGORIES: () => `${getBaseUrl()}/categories`,

  LOGIN: () => `${getBaseUrl()}/login`,
  
  LOGOUT: () => `${getBaseUrl()}/logout`,
};
