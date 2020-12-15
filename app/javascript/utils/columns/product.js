export const ProductColumns = {
  cols: [
    { title: "Ảnh", dataIndex: "pictures_attributes[0].url" , scopedSlots: { customRender: "picture" }}
    ,{
      title: "Tên sản phẩm",
      dataIndex: "name",
      className: "name",
      width: "30%"
    },
    {
      title: "Giá ",
      dataIndex: "price",
      className: "price",
      width: "20%"
    },
    {
      title: "Loại sản phẩm ",
      dataIndex: "category.name",
      className: "category",
      width: "30%"
    },
    {
      title: "Action",
      dataIndex: "",
      key: "x",
      scopedSlots: { customRender: "action" },
      width: "20%",
      align: "center"
    }
  ]
};
