FactoryBot.define do
  factory :buddy do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    age { rand(120) }
    email { Faker::Internet.unique.email }
    phone { "070-5555-6666" }
  end

  trait :infant do
    age { rand(6) }
  end

  trait :children do
    age { rand(6..19) }
  end

  trait :adult do
    age { rand(20..64) }
  end

  trait :senior do
    age { rand(65..120) }
  end
end
