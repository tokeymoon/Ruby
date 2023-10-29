class VendingMachine
  def initialize(maker)
    @maker = maker
    @money = 0
  end

  def deposit_coin(money)
    if money == 100
      @money += money
      puts "Deposited: #{money} yen"
    else
      puts "Invalid coin: #{money} yen"
    end
  end

  def press_button(item)
    @item = item
    @price = @item.price
    if @money >= @price
      @money -= @price
      puts "Purchased: #{@item.item}, Remaining Balance: #{@money} yen"
      @item
    else
      puts 'Not enough money to purchase the selected item.'
      nil
    end
  end

  private

  def press_manufacturer_name
    @maker
  end
end

class Item
  attr_reader :item, :price

  def initialize(item)
    @item = item
    @price = if item == 'cola'
               150
             elsif item == 'soda'
               100
             end
  end
end

cola = Item.new('cola')
vending_machine = VendingMachine.new('サントリー')
vending_machine.deposit_coin(100)
puts vending_machine.press_button(cola)
vending_machine.deposit_coin(100)
puts vending_machine.press_button(cola)
