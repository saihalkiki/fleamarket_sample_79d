FactoryBot.define do
  factory :item do
    name            {"カバン"}
    explanation     {"シャネルの高級バックです"}
    quality         {"良"}
    delivery_cost   {500}
    region          {"東京都"}
    period          {10}
    price           {10000}
  end
end