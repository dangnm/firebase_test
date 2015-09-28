module V1

  class BaseApi < Grape::API
    version 'v1', using: :path, vendor: 'Firebase test'
    format :json

    helpers AuthHelpers

    rescue_from ActiveRecord::RecordNotFound do |e|
      rack_response(format_message({ errors: { code: 404, message: e.message } }, []), 404)
    end

    mount UsersApi
  end

end
