FactoryBot.define do
  factory :post do
    title { Faker::Lorem.characters(number: 10) }
    content { Faker::Lorem.characters(number: 100) }
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/sample.jpeg')) }
  end
end