class UserMailer < ApplicationMailer
  def newsletter
    @user = User.find_by(id: 11)
    # @user = params[:user]
    @url  = 'https://www.kotobutsuen.com'
    @url_radio = 'https://radiotalk.jp/program/11933/'
    mail bcc: @user.email
  end
end
