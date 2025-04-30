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
    last_name: "大谷",
    first_name: "英美里",
    last_name_kana: "オオタニ",
    first_name_kana: "エミリ",
  
    post_number: "000-0001",
    address: "A",
    phone_number: "090-000-0001"
  },
  {
    email: "b@example.com",
    password: "aiueoa",
    last_name: "大場",
    first_name: "花菜",
    last_name_kana: "オオバ",
    first_name_kana: "ハナ",
  
    post_number: "000-0002",
    address: "B",
    phone_number: "090-000-0002"
  },
  {
    email: "c@example.com",
    password: "aiueoa",
    last_name: "音嶋",
    first_name: "莉沙",
    last_name_kana: "オトシマ",
    first_name_kana: "リサ",
  
    post_number: "000-0003",
    address: "C",
    phone_number: "090-000-0003"
  },
  {
    email: "d@example.com",
    password: "aiueoa",
    last_name: "齋藤",
    first_name: "樹愛羅",
    last_name_kana: "サイトウ",
    first_name_kana: "キアラ",
  
    post_number: "000-0004",
    address: "D",
    phone_number: "090-000-0004"
  },
  {
    email: "e@example.com",
    password: "aiueoa",
    last_name: "佐々木",
    first_name: "舞香",
    last_name_kana: "ササキ",
    first_name_kana: "マイカ",
  
    post_number: "000-0005",
    address: "E",
    phone_number: "090-000-0005"
  },
  {
    email: "f@example.com",
    password: "aiueoa",
    last_name: "高松",
    first_name: "瞳",
    last_name_kana: "タカマツ",
    first_name_kana: "ヒトミ",
  
    post_number: "000-0006",
    address: "F",
    phone_number: "090-000-0006"
  },
  {
    email: "g@example.com",
    password: "aiueoa",
    last_name: "瀧脇",
    first_name: "笙古",
    last_name_kana: "タキワキ",
    first_name_kana: "ショウコ",
  
    post_number: "000-0007",
    address: "G",
    phone_number: "090-000-0007"
  },
  {
    email: "h@example.com",
    password: "aiueoa",
    last_name: "野口",
    first_name: "衣織",
    last_name_kana: "ノグチ",
    first_name_kana: "イオリ",
  
    post_number: "000-0008",
    address: "H",
    phone_number: "090-000-0008"
  },
  {
    email: "i@example.com",
    password: "aiueoa",
    last_name: "諸橋",
    first_name: "沙夏",
    last_name_kana: "モロハシ",
    first_name_kana: "サナ",
  
    post_number: "000-0009",
    address: "I",
    phone_number: "090-000-0009"
  },
  {
    email: "j@example.com",
    password: "aiueoa",
    last_name: "山本",
    first_name: "杏奈",
    last_name_kana: "ヤマモト",
    first_name_kana: "アンナ",
  
    post_number: "000-0010",
    address: "J",
    phone_number: "090-000-0010"
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
    price: 600,
    genre_id: 1,
    introduction: "サクサクのパイ生地に甘酸っぱい苺とクリーミーなホワイトカスタードを重ねた一品。"
  },
  {
    name: "フルーツタルト",
    price: 700,
    genre_id: 2,
    introduction: "色とりどりのフルーツを贅沢に盛り付けた、爽やかで華やかなタルト。"
  },
  {
    name: "カスタードシュー",
    price: 300,
    genre_id: 3,
    introduction: "香ばしいシュー生地に、とろけるカスタードがたっぷり。"
  },
  {
    name: "レアチーズ",
    price: 500,
    genre_id: 4,
    introduction: "ふんわりとろける口当たりのレアチーズケーキ。"
  },
  {
    name: "カスタードプリン",
    price: 300,
    genre_id: 5,
    introduction: "昔ながらのなめらかプリンに、濃厚なカスタードの風味。"
  },
  {
    name: "焦がしバターのフィナンシェ",
    price: 200,
    genre_id: 6,
    introduction: "バターの香ばしさが広がる、しっとり濃厚なフィナンシェ。"
  },
  {
    name: "ガトーショコラ",
    price: 500,
    genre_id: 7,
    introduction: "濃厚でしっとり、大人の味わいのチョコレートケーキ。"
  },
  {
    name: "白桃のムースグラス",
    price: 600,
    genre_id: 8,
    introduction: "白桃の甘みとムースのなめらかさがとけあう上品な一品。"
  },
  {
    name: "ビターショコラ",
    price: 500,
    genre_id: 9,
    introduction: "ビターなチョコレートが香る、甘さ控えめなスイーツ。"
  },
  {
    name: "春摘み苺のプレミアムロール",
    price: 700,
    genre_id: 10,
    introduction: "春摘み苺の甘酸っぱさと、ふわふわ生地の贅沢ロールケーキ。"
  }  
])