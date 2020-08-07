FactoryBot.define do
  factory :item do
    name              {"カバン"}
    explanation       {"シャネルの高級バックです"}
    quality           {"新品、未使用"}
    delivery_cost     {"送料込み（出品者負担）"}
    prefecture_id     {"1"}
    period            {"1〜2日で発送"}
    price             {"10000"}
    created_at        { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }
    user_id           { "1" }
    after(:build) do |item|
      # 親、子、孫を作成して、孫をitemのcategory_idに紐付ける
      parent_category = create(:category)
      child_category = parent_category.children.create(name: "hello")
      grand_child_category = child_category.children.create(name: "world")

      item.category_id = grand_child_category.id
    end
  end
end