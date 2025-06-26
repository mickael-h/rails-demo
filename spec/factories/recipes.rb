FactoryBot.define do
  factory :recipe do
    title { "MyString" }
    ingredients { "MyText" }
    instructions { "MyText" }
    source_url { "MyString" }
    image_url { "MyString" }
  end
end
