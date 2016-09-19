FactoryGirl.define do
  factory(:user) do
    email('user@email.com')
    password('123456')
    id(1)
  end

  factory(:question) do
    a_answer("Go to France")
    b_answer("Go to the Moon")
    user_id(1)
  end
end
