module UsersHelper
	# Follow button helper
	def follow_button user
		if current_user.following? user
			button_to "Unfollow", user_follow_path(user), method: :delete, class: "btn btn-danger"
		else	
			button_to "Follow", user_follow_path(user), class: "btn btn-danger"
		end
	end


  def avatar_for(user, options = { size: 40 })
    size = options[:size]
    style = options[:style]
    if user.avatar?
      if size <= 40
        image_tag user.avatar.url(:thumb), width: size, height: size, alt: user.username, class: 'avatar', style: style
      else
        image_tag user.avatar.url, width: size, height: size, alt: user.username, class: 'avatar', style: style
      end
    else
      image_tag 'missing.svg', width: size, height: size, alt: 'avatar image', class: 'avatar', style: style
    end
  end
end