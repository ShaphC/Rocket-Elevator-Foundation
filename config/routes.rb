
Rails.application.routes.draw do
  get 'maps/map'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'home/index'
  get 'pages/residential'
  get 'pages/commercial'
  get 'pages/404'
  get 'quotes/quotes'
  devise_for :users
  
  root to: "home#index"
  
  get '/commercial'   => 'pages#commercial'
  get "/home"         => 'home#index'
  get '/404'          => 'pages#404'
  get '/quotes'       => 'quotes#quotes'

  #Keep users that aren't admin from going directly to Intervention
  authenticate :user, ->(user) { user.employee_role? } do
    get '/intervention' => 'interventions#interventions'
  end
  
  get '/residential'  => 'pages#residential'
  get '/news'         => 'home#news'
  get '/clients'      => 'home#clients'
  get '/contact'      => 'home#contact'
  get '/portfolio'    => 'home#portfolio'
  get '/charts'       => 'charts#dashboard'
  get '/get_buildings'=> 'interventions#get_buildings'
  get '/get_batteries'=> 'interventions#get_batteries'
  get '/get_columns'  => 'interventions#get_columns'
  get '/get_elevators'=> 'interventions#get_elevators'
  # get '/new'     => 'interventions#new'
  post '/leads'       => 'leads#create'
  post '/quotes'      => 'quotes#create'

  # get '/watson'       => 'watson#textToSpeech'

  # get '/spotify'      => 'api/v1/tracks#random'
  get '/auth/spotify/callback', to: 'users#spotify'

   
  devise_scope :user do 
    get "/signup"     => "devise/registrations#new" 
    get "/signin"     => "devise/sessions#new" 
    get "/signout"    => "devise/sessions#destroy"
    get "/changepassword" => "devise/passwords#new"

    post "/signup"     => "devise/registrations#new" 
    post "/signin"     => "devise/sessions#new" 
    post "/signout"    => "devise/sessions#destroy"
    post "/changepassword" => "devise/passwords#new"

  end

  Rails.application.routes.draw do
  get "/maps" => "maps#map"
    resources :quotes, only: [:new, :create]
    resources :interventions, only: [:new, :create]
    # resources :interventions do
    #   collection do
    #       get '/get_buildings', to: 'interventions#get_buildings'
    #   end
    # end
  end

  Rails.application.routes.draw do
    namespace :api do
      namespace :v1 do
        resources :tracks do
          collection do
            get :top_100
            get :random
            get :search
          end
        end
      end
    end
  end

end