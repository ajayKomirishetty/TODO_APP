class AddRequiredFiledsToTodosTable < ActiveRecord::Migration[6.1]
  def change
    change_column :todos, :title, :string,  required: true
  end
end
