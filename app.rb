get '/' do
  @pending_tasks = Task.all_pending
  @completed_tasks = Task.all_completed
  erb :index
end

post '/' do
  @task = Task.create(:description => @params["description"], :done => false)
  redirect_to "/"
end

get '/edit/([0-9]+)' do |id|
  @task = Task.get(id)
  erb :edit
end

post '/edit/([0-9]+)' do |id|
  @task = Task.get(id)
  @task.description = @params["description"]
  @task.save
  redirect_to "/"
end

post '/finish/([0-9]+)' do |id|
  @task = Task.get(id)
  @task.done = true
  @task.save
  redirect_to "/"
end

post '/delete/([0-9]+)' do |id|
  @task = Task.get(id)
  @task.destroy
  redirect_to "/"
end