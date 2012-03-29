DashboardSample::Application.routes.draw do
  root :to => 'index#index'
  
  controller :index do
    get 'accesses' => :accesses
  end

end
