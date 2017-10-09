def sunday_trader(prices)
  prices_and_days = prices.map.with_index { |price, day| [price, day] }
  possibilities = prices_and_days.combination(2)
  best_choice = possibilities.max_by { |(buy_price, _), (sell_price, _)| sell_price - buy_price }
  best_choice.map { |price, day| day }
end

sunday_trader([17,3,6,9,15,8,6,1,10])

def monday_trader(prices)
  formated_prices = prices.flat_map { |prices_for_one_day| prices_for_one_day.to_a }
  formated_prices.group_by { |company, price| company }.map do |company, companies_and_prices|
    prices = companies_and_prices.map { |company, price| price }
    [company, sunday_trader(prices)]
  end
end

monday_trader([
  { :GOO => 8,  :MMM => 20, :ADBE => 3,  :EA=> 10, :BA => 5,  :KO => 19, :XOM => 12, :GPS => 6,  :MCD => 15, :DIS => 9,  :CRM => 10, :JNJ => 17 },
  { :GOO => 3,  :MMM => 8,  :ADBE => 15, :EA=> 5,  :BA => 10, :KO => 5,  :XOM => 15, :GPS => 13, :MCD => 10, :DIS => 18, :CRM => 5,  :JNJ => 14 },
  { :GOO => 17, :MMM => 3,  :ADBE => 6,  :EA=> 9,  :BA => 15, :KO => 6,  :XOM => 8,  :GPS => 1,  :MCD => 10, :DIS => 15, :CRM => 18, :JNJ => 3  },
  { :GOO => 8,  :MMM => 18, :ADBE => 4,  :EA=> 6,  :BA => 15, :KO => 18, :XOM => 3,  :GPS => 12, :MCD => 19, :DIS => 3,  :CRM => 7,  :JNJ => 9  },
  { :GOO => 10, :MMM => 12, :ADBE => 8,  :EA=> 3,  :BA => 18, :KO => 20, :XOM => 5,  :GPS => 11, :MCD => 3,  :DIS => 9,  :CRM => 8,  :JNJ => 15 },
  { :GOO => 17, :MMM => 14, :ADBE => 2,  :EA=> 17, :BA => 7,  :KO => 13, :XOM => 1,  :GPS => 15, :MCD => 15, :DIS => 10, :CRM => 9,  :JNJ => 17 },
])
