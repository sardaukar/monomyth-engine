MonomythEngine::Engine.routes.draw do
  match '*path', to: 'endpoints#serve', via: [:get]
end
