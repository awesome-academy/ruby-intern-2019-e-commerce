# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/send_order_for_user
  def send_order_for_user
    UserMailer.send_order_for_user
  end

end
