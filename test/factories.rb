FactoryBot.define do
  factory :user, class: "User" do
    name { "Nachname" }
    email { "test@user.de" }
    password { "test123" }
    password_confirmation { "test123" }
  end
end
