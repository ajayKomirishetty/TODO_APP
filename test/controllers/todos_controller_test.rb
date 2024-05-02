# spec/controllers/todos_controller_spec.rb
require 'rails_helper'

RSpec.describe TodosController, type: :controller do
  describe "GET index" do
    it "assigns all todos grouped by completion status" do
      completed_todo = FactoryBot.create(:todo, completed: true)
      incomplete_todo = create(:todo, completed: false)
      get :index
      expect(assigns(:todos)).to eq({true => [completed_todo], false => [incomplete_todo]})
    end
  end

  describe "POST create" do
    context "with valid attributes" do
      it "creates a new todo and redirects" do
        expect {
          post :create, params: {todo: attributes_for(:todo)}
        }.to change(Todo, :count).by(1)
        expect(response).to redirect_to(todos_path)
        expect(flash[:notice]).to eq('Todo was successfully created.')
      end
    end

    context "with invalid attributes" do
      it "does not create a todo and re-renders the index template" do
        expect {
          post :create, params: {todo: attributes_for(:todo, title: nil)}
        }.not_to change(Todo, :count)
        expect(response).to render_template(:index)
        expect(flash[:alert]).to be_present
      end
    end
  end

  describe "PUT update" do
    let(:todo) { FactoryBot.create(:todo) }

    context "with valid attributes" do
      it "updates the todo and redirects" do
        put :update, params: { id: todo.id, todo: { title: "Updated Title" } }
        todo.reload
        expect(todo.title).to eq("Updated Title")
        expect(response).to redirect_to(todos_path)
        expect(flash[:notice]).to eq('Todo was successfully updated.')
      end
    end

    context "with invalid attributes" do
      it "does not update the todo and returns unprocessable entity" do
        put :update, params: { id: todo.id, todo: { title: nil } }
        previous_title = todo.title
        todo.reload
        expect(todo.title).to eq(previous_title)
        expect(response).to render_template(:index)
      end
    end
  end

  describe "DELETE destroy" do
    let!(:todo) { FactoryBot.create(:todo) }

    it "deletes the todo" do
      expect {
        delete :destroy, params: { id: todo.id }
      }.to change(Todo, :count).by(-1)
      expect(response).to redirect_to(todos_path)
      expect(flash[:notice]).to eq('Todo was successfully deleted.')
    end
  end
end
