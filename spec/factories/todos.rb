# spec/factories/todos.rb
FactoryBot.define do
  factory :todo do
    title { "Sample Todo" }
    completed { false }
    description { "Description of the todo" }
    time { 1.day.from_now }
  end
end
