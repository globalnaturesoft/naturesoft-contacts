Naturesoft::Contacts::Engine.routes.draw do
  namespace :admin, module: "admin" do
    resources :contacts
  end
end