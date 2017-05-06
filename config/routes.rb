Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "users/registrations"}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

   resources :jobs do
       resources :resumes
   end
   root 'welcome#index'

   namespace :admin do
     resources :jobs do
        member do
            post :publish
            post :hide
        end
    end
   end

   namespace :company do
     resources :jobs do
       member do
         post :publish
         post :hide
       end
     end
   end

end
