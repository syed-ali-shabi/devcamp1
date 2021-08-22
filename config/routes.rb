Rails.application.routes.draw do
  get 'pages/:else', to: 'pages#something'
  resources :portfolios, except: [:show]
  get 'angular-item' , to:  "portfolios#angular"
   get 'ruby-on-rails' , to:  "portfolios#ruby_on_rails"
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show' 
  # i did that because i dont want  localhost:3000/portfoios/1/edit instead  i want localhost:3000/portfoio/1/   the difference is of singular & plural  in the first one the portfolio was plural and in the second on the portfolio is plural
  get 'about',  to: 'pages#about'
  get 'contact', to: 'pages#contact'
  # get 'pages/home'  
  # get 'pages/about'
  # get 'pages/contact'
  resources :blogs do
    member do
      get :toggle_status
    end
  end


   root to: 'pages#home' 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

