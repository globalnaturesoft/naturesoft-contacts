Naturesoft::Menus::Menu.class_eval do
    @contacts = {
      "contact" => {
        "label" => "Contact Page",
        "controller" => "/naturesoft/contacts/contacts",
        "action" => "contact",
        "params" => {
        "id" => nil
        }
      }
    }
end