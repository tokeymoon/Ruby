class VendingMachine
  # クラスを完成させてください
  def initialize(maker)
    @maker = maker
    @money = 0
  end

  def deposit_coin(money)
    puts money
    puts @money
    return unless money == 100

    @money += money
    puts @money
  end

  def press_button(item)
    @item = item
    puts @item
    @price = @item.price
    return '' unless @money >= @price

    @money -= @price
    puts @money
    @item.item
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
    if @item == 'cola'
      @price = 150
    elsif @item == 'soda'
      @price = 100
    end
  end
end

cola = Item.new('cola')
vending_machine = VendingMachine.new('サントリー')
vending_machine.deposit_coin(100)
puts vending_machine.press_button(cola)
vending_machine.deposit_coin(100)
puts vending_machine.press_button(cola)
