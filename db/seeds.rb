Category.create!(
  [
    {name: '国宝'},
    {name: '重要文化財'}
  ]
)
Architecture.create!(
  [
    {name: '旧開智学校', imageUrl: 'https://www.city.matsumoto.nagano.jp/uploaded/image/4027.JPG', category: Category.first},
    {name: 'ヨドコウ迎賓館', imageUrl: 'https://www.yodoko-geihinkan.jp/wordpress/wp-content/uploads/2019/02/Approach.jpg', category: Category.second}
  ]
)
Address.create!(
  [
    {prefecture: '長野県', city: '松本市', suite: '開智2-4-12', architecture: Architecture.first},
    {prefecture: '兵庫県', city: '芦屋市', suite: '山手町3-10', architecture: Architecture.second}
  ]
)
