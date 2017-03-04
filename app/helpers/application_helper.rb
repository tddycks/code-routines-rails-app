module ApplicationHelper

  def display_or_add_bio(user)
    if user.bio.present?
      user.bio
    elsif  user == current_user
      link_to "Add Bio", edit_user_path(user)
    end
  end
end
