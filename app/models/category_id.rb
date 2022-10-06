class CategoryId < ActiveHash::Base
  self.data = [
    {id: 0, name: '---'}, {id: 1, name: '帽子'}, {id: 2, name: 'バック・カバン'},
    {id: 3, name: 'アクセサリー'}, {id: 4, name: '小物'}, {id: 5, name: 'インテリア雑貨'},
    {id: 6, name: 'ベビー・キッズ'}, {id: 7, name: 'その他'}
  ]
  
  include ActiveHash::Associations
  has_many :items
end