class SetDefaultValueForTodoCompleted < ActiveRecord::Migration[6.1]
  def up
    change_column :todos, :completed, :boolean, default: false
  end
end
