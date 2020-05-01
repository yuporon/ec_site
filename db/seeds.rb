Admin.create!(
    email: 'test@test.com',
    password: 'testtest',
)
Genre.create!(
[   
    {name: "ケーキ", is_validity: true}, 
    {name: "プリン", is_validity: true}, 
    {name: "焼き菓子", is_validity: true}, 
    {name: "キャンディ", is_validity: true}
]
)
Item.create!(
[
    {genre_id: 1, name: "ショートケーキ", description: "ｗｗｗ", price_nontax: 1000, sale_status: 1},
    {genre_id: 2, name: "神戸プリン", description: "あ", price_nontax: 1001, sale_status: 1}, 
    {genre_id: 3, name: "クッキー", description: "kkk", price_nontax: 1010, sale_status: 2}, 
    {genre_id: 4, name: "りんごあめ", description: "あｗ", price_nontax: 1100, sale_status: 1}
]
)

EndUser.create!(
[   
    {email: "a@a", password: "aaaaaa", last_name: "山田", first_name: "太郎", 
    kana_last_name: "ヤマダ", kana_first_name: "タロウ", postal_code: "1234567", 
    address: "東京都新宿区高田馬場", phone_number: "09011112222", is_unsubscribed: false}
]
)