class SkillInventoryApp < Sinatra::Base
  get '/' do
    erb :dashboard
  end

  # Read
  get '/skills' do
    @skills = SkillInventory.all
    erb :index
  end

  # Create
  get '/skills/new' do
    erb :new
  end

  get '/skills/:id' do |id|
    @skill = SkillInventory.find(id.to_i)
    erb :show
  end

  post '/skills' do
    SkillInventory.create(params[:skill])
    redirect '/skills'
  end

  # Update
  get '/skills/:id/edit' do |id|
    @skill = SkillInventory.find(id.to_i)
    erb :edit
  end

  put '/skills/:id' do |id|
    SkillInventory.update(id.to_i, params[:skill])
    redirect '/skills'
  end

  # Delete
  delete '/skills/:id' do |id|
    SkillInventory.delete(id.to_i)
    redirect '/skills'
  end

end
