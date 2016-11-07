Naturesoft::Contacts::Engine.routes.draw do
  namespace :backend, module: "backend", path: "backend/contacts" do
    resources :contacts do
      collection do
        get "select2"
        delete 'delete'
      end
    end
    resources :messages do
      collection do
        get "select2"
      end
    end
  end
end