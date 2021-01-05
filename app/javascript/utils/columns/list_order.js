export const ProductColumns = {
  cols: [
    {
      title: "Tên khách hàng ",
      dataIndex: "order.customer.name",
      className: "name",
      align: "center"
    },
    {
      title: "Email ",
      dataIndex: "order.customer.email",
      className: "email",
      align: "center"
    },
    {
      title: "Phone ",
      dataIndex: "order.customer.phone",
      className: "phone",
      align: "center"
    },
    ,{
      title: "Tên sản phẩm",
      dataIndex: "product.name",
      className: "product_name",  
      align: "center"
    },
    {
      title: "Ngày đặt hàng ",
      dataIndex: "order.customer.created_at",
      className: "total",
      align: "center"
    },
    {
      title: "Giá ",
      dataIndex: "price",
      className: "price",
      align: "center"  
    },
    {
      title: "Số lượng ",
      dataIndex: "quantity",
      className: "quantity",
      align: "center"
    },
    {
      title: "Tổng tiền ",
      dataIndex: "order.total",
      className: "total",
      align: "center"
    },
  ]
};
