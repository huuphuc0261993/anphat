class OrderMailer < ApplicationMailer
  def new_order_email
    
    @order_item = params[:order_item]
    @order = @order_item.order
    @customer = @order_item.order.customer
    @product = @order_item.product

    mail(to:["anphat.apa@gmail.com", @customer.email], subject: "ĐƠN HÀNG MỚI")
    # mail(to:"huuphuc1314@gmail.com", subject: "ĐƠN HÀNG MỚI")
  end

end
