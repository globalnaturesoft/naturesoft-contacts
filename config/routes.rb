Naturesoft::Contacts::Engine.routes.draw do
  namespace :admin, module: "admin", path: "admin/contacts" do
    resources :contacts
  end
end