Rails.application.config.middleware.use OmniAuth::Builder do
      provider :facebook, '1122909594462847', '3785a4baeb9e11102eb9e5fc913c6e7c'
end
