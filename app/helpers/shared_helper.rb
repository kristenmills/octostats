class SharedHelper
  def self.last_updated client
    time = Time.parse(client.last_response.headers['date'])
    time.strftime('Last Updated: %B %d, %Y %R %Z')
  end

  def self.to_data hash
    array_string = ''
    hash.each do |key, value|
      array_string += "['#{key or 'None'}', #{value}],"
    end
    array_string.chop!
    "[#{array_string}]"
  end
end