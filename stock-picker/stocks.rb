def stock_picker(prices)
  best_days = [0, 0]
  best_profit = 0
  prices.each_with_index do |buy_price, buy_day|
    prices.each_with_index do |sell_price, sell_day|
      next if sell_day <= buy_day
      profit = sell_price - buy_price
      if profit > best_profit
        best_profit = profit
        best_days = [buy_day, sell_day]
      end
    end
  end
  best_days
end

puts stock_picker([17,3,6,9,15,8,6,1,10])