module StaticPagesHelper
  def gravatar(options = { size: 32 })
    gravatar_id =  Digest::MD5.hexdigest('daniel@lockyy.com')
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: 'user.name', class: 'gravatar')
  end
end
