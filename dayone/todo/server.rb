require 'sinatra'
require 'sinatra/reloader'
require_relative('lib/tasks.rb')
require_relative('lib/todo.rb')

todo_list = TodoList.new("Alvaro")



get '/tasks' do
  erb(:task_index)
end