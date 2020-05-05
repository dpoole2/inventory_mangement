require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  # Testing by Jea Yong Lee

  test "Order creation" do
    Orders.create(note: "Mayo Sandwhich", total: 2)
    order = Orders.last
    assert order.name == "Mayo Sandwhich" && order.total = 2
  end

  test "Order edit" do
    Orders.create(note: "Salted Ham", total: 15)
    order = Orders.last
    assert order.name == "Salted Ham" && order.total == 15
    edited = Orders.find_by(total: order.total)
    edited.name = "Chicken & Gravy"
    edited.total = 10
    edited.save(:validate => false)
    assert order.name == "Chicken & Gravy" && order.total == 10
  end

  test "Order deletion" do
    Orders.create(name: "Turkey Sandwhich", total: 20)
    order = Orders.last.order_id
    Orders.last.destroy
    assert !Order.find(order_num).present?
  end

end
