export const getBaseUrl = () => {
  return "/api/";
};
export const URLS = {
  IMAGES: () => `${getBaseUrl()}/pictures`,

  PRODUCTS: () => `${getBaseUrl()}/products`,
  PRODUCT: (id) => `${getBaseUrl()}/products/${id}`,
};
