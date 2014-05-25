require 'securerandom'

def secure_token
  token_file = Rails.root.join('.secret')
  if File.exist?(token_file)
    # Use the existing token.
    File.read(token_file).chomp
  elsif Rails.env.production?
    ENV['SECRET_TOKEN'] || ENV['SECRET_KEY_BASE'] || SecureRandom.hex(64)
  else
    # Generate a new token and store it in token_file.
    token = SecureRandom.hex(64)
    File.write(token_file, token)
    token
  end
end

Rails.application.config.secret_key_base = secure_token
