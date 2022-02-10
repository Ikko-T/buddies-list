module BuddiesHelper
  def full_name(buddy)
    buddy.first_name + ' ' + buddy.last_name
  end

  def nickname_or_email(buddy)
    buddy.user.nickname.present? ? "#{buddy.user.nickname}" : "#{buddy.user.email}"
  end
end
