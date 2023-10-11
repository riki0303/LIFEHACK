FactoryBot.define do
  factory :post do
    title { Faker::Lorem.characters(number: 10) }
    content { Faker::Lorem.characters(number: 100) }

    #afterメソッド。Postインスタンスをbuildした後、画像をつける。
    after(:build) do |post|
      post.image.attach(io: File.open('spec/fixtures/test.jpeg'), filename: 'test.jpeg', content_type: 'image/jpeg')
    end
  end
end