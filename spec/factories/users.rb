FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    last_name             {Gimei.last.kanji}
    first_name            {Gimei.first.kanji}
    last_name_ruby        {Gimei.last.katakana}
    first_name_ruby       {Gimei.first.katakana}
    birthday              {Faker::Date.backward}
  end
end