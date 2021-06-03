FactoryBot.define do
  factory :review do
    title { "MyString" }
    description { "MyText" }
    score { 1 }
    unit { nil }
    reviewer { nil }
  end
end
