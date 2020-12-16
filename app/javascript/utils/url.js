export const getBaseUrl = () => {
  return "/api/";
};
export const URLS = {
  IMAGES: () => `${getBaseUrl()}/pictures`,

  PRODUCTS: () => `${getBaseUrl()}/products`,
  PRODUCT: (id) => `${getBaseUrl()}/products/${id}`,

  BANNERS: () => `${getBaseUrl()}/banners`,
  BANNER: (id) => `${getBaseUrl()}/banners/${id}`,
};
