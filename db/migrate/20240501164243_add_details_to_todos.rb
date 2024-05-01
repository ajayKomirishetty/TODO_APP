class AddDetailsToTodos < ActiveRecord::Migration[6.1]
  def up
    add_column :todos, :description, :text
    add_column :todos, :time, :datetime
  end

  def down
    remove_column :todos, :description
    remove_column :todos, :time
  end
end
