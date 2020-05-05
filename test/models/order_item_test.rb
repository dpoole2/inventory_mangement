require 'test_helper'

class OrderItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  # Testing by Jea Yong Lee
  test "Order Item creation" do
    OrderItems.create(note: "Mayo Sandwhich", order_id: 1)
    order_item = OrderItems.last
    assert order_item.name == "Mayo Sandwhich" && order_item.order_id == 1
  end

  test "Order Item edit" do
    OrderItems.create(note: "Mayo Sandwhich", order_id: 2)
    order_item = OrderItems.last
    assert order_item.name == "Mayo Sandwhich" && order_item.order_id == 2
    edited = OrderItems.find_by(order_id: order_item.order_id)
    edited.name = "Chicken & Gravy"
    edited.save(:validate => false)
    assert order_item.name == "Chicken & Gravy" && order_item.order_id == 2
  end

  test "Order Item deletion" do
    OrderItems.create(name: "Salted Ham", order_id: 3)
    order_num = OrderItems.last.order_id
    OrderItems.last.destroy
    assert !OrderItems.find(order_num).present?
  end

end
