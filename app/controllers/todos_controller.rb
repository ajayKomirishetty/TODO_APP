class TodosController < ApplicationController
  def index
    @todos = Todo.all
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
    @todo = Todo.find(params[:id])
    @todo.update(todo_params)
    respond_to do |format|
      format.html { redirect_to root_path }
      format.turbo_stream
    end
  end

    def destroy
      @todo = Todo.find(params[:id])
      @todo.destroy
      redirect_to todos_path, notice: 'Todo was successfully deleted.'
    end


  private

  def todo_params
    params.require(:todo).permit(:title, :completed)
  end
end
