class CashRegister
    attr_accessor :total, :items, :last_transaction
    attr_reader :discount
    def initialize(discount=0)
        @total = 0
        @discount = discount
        @items = []
        @last_transaction = 0
    end

    def add_item (title, price, quantity=1)
        @total += price*quantity
    end

    def apply_discount
        if @discount == 0
            "There is no discount to apply."
        else
            @total = self.total * (100-discount)/100
            "After the discount, the total comes to $#{total}."
        end
    end

    def add_item(product, price, quantity=1)
        @items.push(*[product]*quantity)
        @last_transaction = [price, quantity]
        @total += price * quantity
    end

    def void_last_transaction
        x = 0
        until x == last_transaction[1] do
            @items.pop
            x += 1
        end
        @total -= last_transaction.reduce { |a,b| a*b}
    end
end
