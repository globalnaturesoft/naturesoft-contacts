Naturesoft::Contacts::Engine.routes.draw do
  # Frontend
  get "contact-us.html" => "contacts#index", as: :contacts
  post "contact-us.html" => "contacts#index"
  get "contact-us/success.html" => "contacts#success", as: :success
  
  #Backend
  namespace :admin, module: "admin" do
    resources :contacts
  end
end