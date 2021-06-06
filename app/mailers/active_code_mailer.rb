class ActiveCodeMailer < ApplicationMailer
default from: 'kbooster17@gmail.com'

  # send a signup email to the user, pass in the user object that   contains the user's email address
  def send_active_code_email(user)
    @user = user

    mail(to: @user.email,
         subject: "#{@user.email} Find your activation code in this email.")
  end
end
