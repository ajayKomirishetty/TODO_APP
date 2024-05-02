require 'rails_helper'

RSpec.describe Todo, type: :model do
  # This line includes FactoryBot methods to simplify object creation for tests
  include FactoryBot::Syntax::Methods

  describe 'validations' do
    it 'is valid with valid attributes' do
      todo = build(:todo)
      expect(todo).to be_valid
    end

    it 'is invalid without a title' do
      todo = build(:todo, title: nil)
      expect(todo).not_to be_valid
      expect(todo.errors[:title]).to include("can't be blank")
    end

    it 'is invalid with a description longer than 500 characters' do
      long_description = 'a' * 501
      todo = build(:todo, description: long_description)
      expect(todo).not_to be_valid
      expect(todo.errors[:description]).to include('is too long (maximum is 500 characters)')
    end
  end
end
