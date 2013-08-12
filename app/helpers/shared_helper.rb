class SharedHelper
  def self.last_updated client
    time = Time.parse(client.last_response.headers['date'])
    time.strftime('Last Updated: %B %d, %Y %R %Z')
  end
end