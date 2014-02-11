class NoteMailer < ActionMailer::Base
  default from: "cupid@thenoteblock.com"


  def index
    @greeting = "Hi"

    mail to: "scottli_010@hotmail.com"
  end
end
