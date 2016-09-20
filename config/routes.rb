Naturesoft::Contacts::Engine.routes.draw do
  namespace :admin, module: "admin", path: "admin/contacts" do
    resources :contacts do
      collection do
        get "select2"
      end
    end
  end
end