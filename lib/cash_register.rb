class CashRegister
    attr_accessor :total, :discount
    def initialize(employee_discount=0)
        @total=0
        @discount=employee_discount
        @cart = []
    end
    def add_item(title, price, quantity=1)
        @last_ring = price*quantity
        @total = @last_ring + @total
        quantity.times {|i| @cart.push(title)}
    end
    def apply_discount
        if @discount>0  
            savings = @total*@discount*0.01
            @total -= savings.round
            return "After the discount, the total comes to $#{@total}."
        else
            return "There is no discount to apply."
        end
    end
    def items
        @cart
    end
    def void_last_transaction
        @cart.pop
        @total -= @last_ring
    end
end