class NoticeMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notice_mailer.sendmail_pic.subject
  #
  def sendmail_pic(pic)
    @pic = pic

    mail to: "kaku.mobile.12345@docomo.ne.jp",
      subject:"【Instagoo】写真が投稿されました"
    end
end
