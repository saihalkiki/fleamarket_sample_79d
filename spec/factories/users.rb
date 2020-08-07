FactoryBot.define do
  factory :user do
    email                   {"test@example.com"}
    nickname                {"tarou"}
    last_name               {"鈴木"}
    first_name              {"太郎"}
    last_name_read          {"すずき"}
    first_name_read         {"たろう"}
    gender                  {"男性"}
    birthday                {"2020-01-01"}
    password                {"00000000"}
    password_confirmation   {"00000000"}
  end
end
