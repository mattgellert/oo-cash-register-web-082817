class CashRegister
  attr_accessor :total, :last_transaction_amount
  attr_reader :discount, :items

  def initialize(discount = nil)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(title, price, quantity = 1)
    self.total+=price*quantity
    quantity.times{@items << title}
    self.last_transaction_amount = quantity * price
  end

  def apply_discount
    if self.discount != nil
      self.total-= self.discount/100.00 * self.total
      "After the discount, the total comes to $#{self.total.to_i}."
    else
      "There is no discount to apply."
    end
  end

  def void_last_transaction
    self.total -= self.last_transaction_amount
  end
end
