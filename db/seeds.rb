# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


	Admin.create!(
    email: "admin@example.jp",
    password:  "11111111"
  )

9.times do |n|
    Customer.create!(
      email: "tanakataro#{n + 1}@gmail.com",
      last_name: "田中#{n + 1}",
      first_name: "太郎#{n + 1}",
      last_name_kana: "タナカ",
      first_name_kana: "タロウ",
      password: "123456#{n + 1}",
      postal_code: "123456#{n + 1}",
      address: "東京都港区台場1-11-#{n + 1}",
      telephone_number: "0901234567#{n + 1}"
    )
end

9.times do |n|
  Address.create!(
    name: "田中　太郎#{n + 1}",
    postal_code: "123456#{n + 1}",
    address: "東京都港区台場1-11-#{n + 1}",
    customer_id: n + 1
  )
end

  Genre.create!(
    id: 1,
    name: "ケーキ",
    is_active: [['有効', true], ['無効', false]]
  )
  Genre.create!(
    id: 2,
    name: "プリン",
    is_active: [['有効', true], ['無効', false]]
  )
  Genre.create!(
    id: 3,
    name: "焼き菓子",
    is_active: [['有効', true], ['無効', false]]
  )
  Genre.create!(
    id: 4,
    name: "キャンディ",
    is_active: [['有効', true], ['無効', false]]
  )

  Item.create!(
    id: 1,
    name: "いちごのショートケーキ",
    introduction: "商品の説明商品の説明商品の説明商品の説明商品の説明商品の説明商品の説明商品の説明商品の説明商品の説明",
    price: "400",
    genre_id: 1,
    is_active: [['販売中', true], ['販売停止', false]],
    image: open("./app/assets/images/450-2011012520260348413.jpg")
  )
  Item.create!(
    id: 2,
    name: "ベイクドチーズケーキ",
    introduction: "商品の説明商品の説明商品の説明商品の説明商品の説明商品の説明商品の説明商品の説明商品の説明商品の説明",
    price: "600",
    genre_id: 1,
    is_active: [['販売中', true], ['販売停止', false]],
    image: open("./app/assets/images/IMG_6141.jpg")
  )
   Item.create!(
    id: 3,
    name: "カスタードプリン",
    introduction: "商品の説明商品の説明商品の説明商品の説明商品の説明商品の説明商品の説明商品の説明商品の説明商品の説明",
    price: "360",
    genre_id: 2,
    is_active: [['販売中', true], ['販売停止', false]],
    image: open("./app/assets/images/20180622122559.jpg")
  ) 
   Item.create!(
    id: 4,
    name: "プリンアラモード",
    introduction: "商品の説明商品の説明商品の説明商品の説明商品の説明商品の説明商品の説明商品の説明商品の説明商品の説明",
    price: "580",
    genre_id: 2,
    is_active: [['販売中', true], ['販売停止', false]],
    image: open("./app/assets/images/DSC_0610.jpg")
  ) 
   Item.create!(
    id: 5,
    name: "チョコレートクッキーサンド",
    introduction: "商品の説明商品の説明商品の説明商品の説明商品の説明商品の説明商品の説明商品の説明商品の説明商品の説明",
    price: "450",
    genre_id: 3,
    is_active: [['販売中', true], ['販売停止', false]],
    image: open("./app/assets/images/myhoney-cookie2-1top-1000x714.png")
  ) 
   Item.create!(
    id: 6,
    name: "オリジナルプレーンクッキー",
    introduction: "商品の説明商品の説明商品の説明商品の説明商品の説明商品の説明商品の説明商品の説明商品の説明商品の説明",
    price: "320",
    genre_id: 3,
    is_active: [['販売中', true], ['販売停止', false]],
    image: open("./app/assets/images/12201115_5c1afb59e4f76.jpg")
  )
   Item.create!(
    id: 7,
    name: "ハート型のぺろぺろキャンディ",
    introduction: "商品の説明商品の説明商品の説明商品の説明商品の説明商品の説明商品の説明商品の説明商品の説明商品の説明",
    price: "280",
    genre_id: 4,
    is_active: [['販売中', true], ['販売停止', false]],
    image: open("./app/assets/images/2019-11-25-13-13-24-1200x800.jpg")
  )
   Item.create!(
    id: 8,
    name: "アイスキャンディ",
    introduction: "商品の説明商品の説明商品の説明商品の説明商品の説明商品の説明商品の説明商品の説明商品の説明商品の説明",
    price: "320",
    genre_id: 4,
    is_active: [['販売中', true], ['販売停止', false]],
    image: open("./app/assets/images/e87ab2f39933e29f0a38_l.jpg")
  )

10.times do |n|
    Item.create!(
      name: "チーズケーキ#{n + 1}",
    	introduction: "商品の説明商品の説明商品の説明商品の説明商品の説明商品の説明商品の説明商品の説明商品の説明商品の説明",
      price: "#{1000 + (n * 1000)}",
      genre_id: 1,
      is_active: [['販売中', true], ['販売停止', false]],
      image: open("./app/assets/images/sweets_cheesecake.png")
    )
  end
10.times do |n|
    Item.create!(
      name: "オリジナルプリン#{n + 1}",
      introduction: "商品の説明商品の説明商品の説明商品の説明商品の説明商品の説明商品の説明商品の説明商品の説明商品の説明",
      price: "#{1000 + (n * 1000)}",
      genre_id: 2,
      is_active: [['販売中', true], ['販売停止', false]],
      image: open("./app/assets/images/pudding_illust_3655.png")
    )
  end
10.times do |n|
    Item.create!(
      name: "オリジナルクッキー#{n + 1}",
      introduction: "商品の説明商品の説明商品の説明商品の説明商品の説明商品の説明商品の説明商品の説明商品の説明商品の説明",
      price: "#{1000 + (n * 1000)}",
      genre_id: 3,
      is_active: [['販売中', true], ['販売停止', false]],
      image: open("./app/assets/images/illustrain04-okashi09.png")
    )
  end
10.times do |n|
    Item.create!(
      name: "オリジナルキャンディ#{n + 1}",
      introduction: "商品の説明商品の説明商品の説明商品の説明商品の説明商品の説明商品の説明商品の説明商品の説明商品の説明",
      price: "#{1000 + (n * 1000)}",
      genre_id: 4,
      is_active: [['販売中', true], ['販売停止', false]],
      image: open("./app/assets/images/sweets-candy-001.png")
    )
  end




