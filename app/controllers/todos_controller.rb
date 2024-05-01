class TodosController < ApplicationController

  before_action :set_todo, only: %w[update destroy]

  def index
    @todos = Todo.all.group_by(&:completed)
  end

  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      respond_to do |format|
        format.html { redirect_to todos_path, notice: 'Todo was successfully created.' }
        format.turbo_stream {
          render turbo_stream: turbo_stream.update("flash_messages", partial: "layouts/flash")
        }
      end
    else
      flash.now[:alert] = 'Error creating Todo.'
      render :index, status: :unprocessable_entity
    end
  end


  def update
    if @todo.update(todo_params)
      respond_to do |format|
        format.html { redirect_to todos_path, notice: 'Todo was successfully updated.' }
        format.turbo_stream {
          render turbo_stream: [
            turbo_stream.replace(dom_id(@todo), partial: "todos/todo", locals: { todo: @todo }),
            turbo_stream.update("flash_messages", partial: "layouts/flash", locals: { notice: 'Todo was successfully updated.' })
          ]
        }
      end
    else
      respond_to do |format|
        format.html { render :index, status: :unprocessable_entity, notice: @todo.errors.full_messages.join(', ')  }
        format.turbo_stream {
          render turbo_stream: turbo_stream.update("flash_messages", partial: "layouts/flash", locals: { alert: @todo.errors.full_messages.join(', ') }), status: :unprocessable_entity
        }
      end
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
