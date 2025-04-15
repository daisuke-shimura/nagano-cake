# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
  email: "admin@example.com",
  password: "aiueoa"
)

Customer.create!([
  {
    email: "a@example.com",
    password: "aiueoa",
    sei: "大谷",
    mei: "英美里",
    sei_kana: "オオタニ",
    mei_kana: "エミリ",
  
    post_number: "000-0001",
    place: "A",
    phone_number: "090-000-0001",
  },
  {
    email: "b@example.com",
    password: "aiueoa",
    sei: "大場",
    mei: "花菜",
    sei_kana: "オオバ",
    mei_kana: "ハナ",

    post_number: "000-0002",
    place: "B",
    phone_number: "090-000-0002",
  },
  {
    email: "c@example.com",
    password: "aiueoa",
    sei: "音嶋",
    mei: "莉沙",
    sei_kana: "オトシマ",
    mei_kana: "リサ",
  
    post_number: "000-0003",
    place: "C",
    phone_number: "090-000-0003",
  },
  {
    email: "d@example.com",
    password: "aiueoa",
    sei: "齋藤",
    mei: "樹愛羅",
    sei_kana: "サイトウ",
    mei_kana: "キアラ",
  
    post_number: "000-0004",
    place: "D",
    phone_number: "090-000-0004",
  },
  {
    email: "e@example.com",
    password: "aiueoa",
    sei: "佐々木",
    mei: "舞香",
    sei_kana: "ササキ",
    mei_kana: "マイカ",
  
    post_number: "000-0005",
    place: "E",
    phone_number: "090-000-0005",
  },
  {
    email: "f@example.com",
    password: "aiueoa",
    sei: "高松",
    mei: "瞳",
    sei_kana: "タカマツ",
    mei_kana: "ヒトミ",
  
    post_number: "000-0006",
    place: "F",
    phone_number: "090-000-0006",
  },
  {
    email: "g@example.com",
    password: "aiueoa",
    sei: "瀧脇",
    mei: "笙古",
    sei_kana: "タキワキ",
    mei_kana: "ショウコ",
  
    post_number: "000-0007",
    place: "G",
    phone_number: "090-000-0007",
  },
  {
    email: "h@example.com",
    password: "aiueoa",
    sei: "野口",
    mei: "衣織",
    sei_kana: "ノグチ",
    mei_kana: "イオリ",
  
    post_number: "000-0008",
    place: "H",
    phone_number: "090-000-0008",
  },
  {
    email: "i@example.com",
    password: "aiueoa",
    sei: "諸橋",
    mei: "沙夏",
    sei_kana: "モロハシ",
    mei_kana: "サナ",
  
    post_number: "000-0009",
    place: "I",
    phone_number: "090-000-0009",
  },
  {
    email: "j@example.com",
    password: "aiueoa",
    sei: "山本",
    mei: "杏奈",
    sei_kana: "ヤマモト",
    mei_kana: "アンナ",
  
    post_number: "000-0010",
    place: "J",
    phone_number: "090-000-0010",
  }
])


genres = [
  "ショートケーキ",
  "タルト",
  "シュークリーム",
  "チーズケーキ",
  "プリン・カスタード",
  "焼き菓子",
  "パウンドケーキ",
  "ムース・ゼリー",
  "チョコレートスイーツ",
  "季節限定"
]
genres.map do |genre_name|
  Genre.create!(name: genre_name)
end

Item.create!([
  {
    name: "苺のミルフィーユ・ブランシュ",
    price: 680,
    kind_id: 1
  },
  {
    name: "フルーツタルト",
    price: 720,
    kind_id: 2
  },
  {
    name: "カスタードシュー",
    price: 280,
    kind_id: 3
  },
  {
    name: "レアチーズ",
    price: 540,
    kind_id: 4
  },
  {
    name: "カスタードプリン",
    price: 350,
    kind_id: 5
  },
  {
    name: "焦がしバターのフィナンシェ",
    price: 200,
    kind_id: 6
  },
  {
    name: "ガトーショコラ",
    price: 480,
    kind_id: 7
  },
  {
    name: "白桃のムースグラス",
    price: 600,
    kind_id: 8
  },
  {
    name: "ビターショコラ",
    price: 520,
    kind_id: 9
  },
  {
    name: "春摘み苺のプレミアムロール",
    price: 750,
    kind_id: 10
  }
])