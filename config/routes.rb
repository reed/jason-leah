Rails.application.routes.draw do
  get 'events' => 'pages#events', as: :events
  get 'directions' => 'pages#directions', as: :directions
  get 'activities' => 'pages#activities', as: :activities
  get 'accommodations' => 'pages#accommodations', as: :accommodations
  get 'gifts' => 'pages#gifts', as: :gifts

  resources :rsvp, only: [:index, :new, :create], as: :rsvps

  root to: 'pages#home'
end
