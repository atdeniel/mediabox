OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '208754729294583', 'ab03023832134fc5771461163f0676cd'
  provider :google_oauth2, '883336797430.apps.googleusercontent.com','K1ANKD7SHWYVP8q5IWbMBPMJ'
  end