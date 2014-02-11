class NoteMailer < ActionMailer::Base
  default from: "The Noteblock <cupid@thenoteblock.com>"


  def index(email: nil, sender: nil, note_id: nil, token: nil)
    if !email || !token || !note_id
      raise "missing arguments"
      return;
    end

    @recipient = email.split("@")[0]
    @sender = sender || "A secret admirer"
    @url = "http://www.thenoteblock.com/notes/#{note_id}/claim?token=#{token}"

    mail(
      to: email,
      subject: "Hi #{@recipient}, #{@sender} just sent some Bitcoins to you."
    )
  end
end
