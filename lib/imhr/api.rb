module IMHR
  class API
    class << self
      def get(path, params)
        access_token.get(api_path(path), params: params)
      end

      def create(path, params)
        access_token.post(api_path(path), body: params)
      end

      def update(path, params)
        access_token.patch(api_path(path), body: params)
      end

      def delete(path)
        access_token.patch(path)
      end

      private

      def access_token
        @access_token ||= OAuth2::AccessToken.new(client, token)
      end

      def client
        OAuth2::Client.new(nil, nil, site: site)
      end

      def site
        ENV["IMHR_SITE"] || "https://imhr.io"
      end

      def api_path(path)
        "/api/#{path}"
      end

      def token
        ENV["IMHR_API_TOKEN"]
      end
    end
  end
end
