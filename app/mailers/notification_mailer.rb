class NotificationMailer < ApplicationMailer
   default from: 'no-replay@gmail.com'

  def complete_mail(user)
    @user = user
    mail(to: @user.email, subject: "登録が完了いたしました。")
  end

end
