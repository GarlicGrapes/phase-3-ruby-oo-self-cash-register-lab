require "pry"

class CashRegister

    attr_accessor :discount, :total, :items, :last_transaction

    def initialize(discount = 0)
        @discount = discount
        @total = 0
        @items = []
        @last_transaction = 0
    end

    def add_item(item, price, quantity = 1)
        quantity.times do 
            self.items << item
        end
        self.last_transaction = price * quantity
        self.total += price * quantity
    end

    def apply_discount
        return "There is no discount to apply." if @discount == 0
        discount_amount = (self.discount.to_f / 100)
        self.total = self.total - (self.total * discount_amount).to_i
        "After the discount, the total comes to $#{self.total}."
    end

    def void_last_transaction
        self.total -= self.last_transaction
    end
end


