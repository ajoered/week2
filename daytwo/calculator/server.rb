require "sinatra"

get "/add" do
  erb(:add)
end

post "/calculate_add" do
  first = params[:first_number].to_f
  second = params[:second_number].to_f
    result = first + second
  "#{first} + #{second} = #{result}"
end