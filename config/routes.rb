Rails.application.routes.draw do
  get 'about', to: 'pages#about'
  root 'courses#index'
  resources :courses, :students
  get 'login', to: 'logins#new'
  post 'login', to: 'logins#create'
  delete 'logout', to: 'logins#destroy'
  post 'course_enroll', to: 'student_courses#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
