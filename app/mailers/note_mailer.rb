class NoteMailer < ActionMailer::Base
  default from: "The Noteblock <cupid@thenoteblock.com>"


  def index(email: nil, sender: nil, note_id: nil, encrypted_token: nil, force: false)
    if !email || !encrypted_token || !note_id
      raise "missing arguments"
      return;
    end

    @recipient = email.split("@")[0]
    @sender = sender || "A secret admirer"
    @url = "http://www.thenoteblock.com/notes/#{note_id}/claim?token=#{encrypted_token}"
    delivery_method = Noteblock::Application.config.action_mailer.delivery_method

    mail(
      to: email,
      subject: "Hi #{@recipient}, #{@sender} just sent some Bitcoins to you.",
      delivery_method: force ? :smtp : delivery_method
    )
  end
end
