class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.send_order_for_user.subject
  #
  def send_order_for_user user, order, address
    @user = user
    @order = order
    @address_detail = "#{address.address_receive}, #{address.ward}, #{address.district}, #{address.province}"
    mail to: user.email, subject: t("user_mailer.send_order_for_user.subject")
  end
end
