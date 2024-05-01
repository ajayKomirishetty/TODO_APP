class TodosController < ApplicationController

  before_action :set_todo, only: %w[update destroy]

  def index
    @todos = Todo.all.group_by(&:completed)
  end

  def create
    @todo = Todo.new(todo_params)
    @todo.save
    respond_to do |format|
      format.html { redirect_to root_path }
      format.turbo_stream
    end
  end

  def update
    @todo.update(todo_params)
    respond_to do |format|
      format.html { redirect_to root_path }
      format.turbo_stream
    end
  end

    def destroy
      @todo.destroy
      redirect_to todos_path, notice: 'Todo was successfully deleted.'
    end


  private

  def set_todo
    @todo = Todo.find(params[:id])
  end

  def todo_params
    params.require(:todo).permit(:title, :completed, :description, :time)
  end
end
