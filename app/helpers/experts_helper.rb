module ExpertsHelper
  # Returns the Gravatar (http://gravatar.com/) for the given user.
  def gravatar_for(expert)
    gravatar_id = Digest::MD5::hexdigest(expert.email_address.downcase)
    gravatar_url = "http://gravatar.com/avatar/#{gravatar_id}.png"
    image_tag(gravatar_url, alt: expert.first_name, class: "gravatar")
  end
end
