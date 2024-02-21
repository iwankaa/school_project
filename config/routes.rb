Rails.application.routes.draw do
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do 
   resources :marks
   resources :subjects
 
   resources :students do
     resources :library_tickets
   end

   resources :students do
     resources :marks
   end
   
  
 
   devise_for :users
 
   get 'home/about'
   root 'home#index'
  end 
end