Noteblock::Application.routes.draw do
  root to: "application#index"

  namespace :api do
    resources :notes, only: [:index, :show, :create]
  end

  # Static Assets normally served before this
  # By the time it hits this, it's too late, unfound
  get "/templates" => "application#unfound_assets"
  get "/templates/*all" => "application#unfound_assets"

  # All other routes to redirect to angular
  get "*path" => "application#index"
end
