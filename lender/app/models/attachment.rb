class Attachment

  CONF = Authenticator.load_config("#{Rails.root}/config/dropbox.json") unless defined?(CONF)
  AUTH = Authenticator.new(CONF) unless defined?(AUTH)
  login_and_authorize(AUTH.get_request_token, CONF)
  ACCESS_TOKEN = AUTH.get_access_token


  attr_reader :name, :size, :content

  def initialize name, size, content=''
    @name = name
    @size = size
    @content = content
  end

  class << self

    def find_all
      results = client.metadata(CONF['root'], "/")
      files = results['contents'].find_all { |content| content['is_dir'] == false }
      files.collect { |file| Attachment.new file['path'][1..-1], file['size'] }
    end

    def load file_name
      content = client.get_file(CONF['root'], "/#{URI.escape(file_name)}")
      Attachment.new file_name, '', content
    end

    def client
      @client ||= DropboxClient.new(CONF['server'], CONF['content_server'], CONF['port'], AUTH)
    end
  end

#  def save
#    self.class.client.put_file(CONF['root'], "/", name, content)
#  end


end