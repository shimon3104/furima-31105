FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials}
    email                 {Faker::internet.free_email}
    password              {Faker::internet.password(min_length: 6)}
    password_confirmation {password}
    last_name             {}
    first_name            {}
    last_name_ruby        {}
    first_name_ruby       {}
    birthday              {Faker::Date.backward}
  end
end