FactoryGirl.define do
  password = Faker::Internet.password(min_length = 8)

  factory :user do
    name                  { Faker::Name.name }
    email                 { Faker::Internet.email }
    password              password
    password_confirmation password
    created_at { Faker::Time.between(7.days.ago, 4.days.ago, :all) }
    updated_at { Faker::Time.between(3.days.ago, Time.now, :all) }

    after(:create) do |user|
      user.groups << create(:group)
    end
  end

end
