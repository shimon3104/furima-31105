FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials}
    email                 {Faker::internet.free_email}
    password              {Faker::internet.password(min_length: 6)}
    password_confirmation {password}
    last_name             {gimei.last.kanji}
    first_name            {gimei.first.kanji}
    last_name_ruby        {gimei.last.katakana}
    first_name_ruby       {gimei.first.katakana}
    birthday              {Faker::Date.backward}
  end
end