Rails.application.routes.draw do
  resources :timesheets
  resources :employees
  resources :grades
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
