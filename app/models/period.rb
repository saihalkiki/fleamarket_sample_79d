class Period < ActiveHash::Base

  self.data = [
    {id: 1, integer: '1〜2日で発送'}, {id: 2, integer: '2〜3日で発送'},{id: 3, integer: '4〜7日で発送'}
  ]
  include ActiveHash::Associations
  has_many :items

end