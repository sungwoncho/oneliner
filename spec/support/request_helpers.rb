module Requests
  module JsonHelpers
    def json(response)
      JSON.parse(response.body, symbolize_names: true)
    end
  end
end
