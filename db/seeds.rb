# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


	Admin.create!(
    email: "admin@example.jp",
    encrypted_password:  "11111111"
  )

20.times do |n|
    Customer.create!(
      email: "test#{n + 1}@gmail.com",
      first_name: "田中#{n + 1}",
      last_name: "太郎#{n + 1}",
      first_name_kana: "タナカ",
      last_name_kana: "タロウ",
      password: "123456#{n + 1}",
      encrypted_password: "123456#{n + 1}",
      postal_code: "12345#{n + 10}",
      address: "東京都港区台場1-11-#{n + 1}",
      telephone_number: "090123456#{n + 10}"
    )
end

9.times do |n|
  Address.create!(
    name: "test#{n + 1}",
    postal_code: "123456#{n + 1}",
    address: "東京都港区台場1-11-#{n + 1}",
    customer_id: n + 1
  )
end

  Genre.create!(
    name: "ホールケーキ",
    is_active: [['有効', true], ['無効', false]]
  )
  Genre.create!(
    name: "パンダケーキ",
    is_active: [['有効', true], ['無効', false]]
  )
  Genre.create!(
    name: "チーズケーキ",
    is_active: [['有効', true], ['無効', false]]
  )
  Genre.create!(
    name: "モンブラン",
    is_active: [['有効', true], ['無効', false]]
  )
  Genre.create!(
    name: "ミルフィーユ",
    is_active: [['有効', true], ['無効', false]]
  )

  Item.create!(
    name: "ショートケーキ",
    introduction: "商品の説明商品の説明商品の説明商品の説明商品の説明商品の説明商品の説明商品の説明商品の説明商品の説明",
    price: "400",
    genre_id: 1,
    is_active: [['販売中', true], ['販売停止', false]]
  )
  Item.create!(
    name: "チーズケーキ",
    introduction: "商品の説明商品の説明商品の説明商品の説明商品の説明商品の説明商品の説明商品の説明商品の説明商品の説明",
    price: "450",
    genre_id: 1,
    is_active: [['販売中', true], ['販売停止', false]]
  )
10.times do |n|
    Item.create!(
      name: "チーズケーキ#{n + 1}",
    	introduction: "商品の説明商品の説明商品の説明商品の説明商品の説明商品の説明商品の説明商品の説明商品の説明商品の説明",
      price: "#{1000 + (n * 1000)}",
      genre_id: n + 1,
      is_active: [['販売中', true], ['販売停止', false]],
    )
  end

5.times do |n|
  Order.create!(
    customer_id: n +1,
    address: "東京都港区台場1-11-#{n + 1}",
    postal_code: "123456#{n + 1}",
    name: "test#{n + 1}",
    shipping_cost: "800",
    total_payment: "#{1000 + (n * 1000) +800}",
    payment_method: "クレジットカード"
  )
end

5.times do |n|
  OrderDetail.create!(
    item_id: n + 1,
    order_id: n + 1,
    amount: n + 3,
    price: "#{1000 + (n * 1000)}"
  )
end




