require "spec_helper"

describe NoteMailer do
  describe "index" do
    it "should not send if missing arguments" do
      expect {
        NoteMailer.index
      }.to raise_error(RuntimeError, /arguments/)
    end

    it "should no require sender" do
      email = "scottli_010@hotmail.com"
      encrypted_token = SecureRandom.hex(32)
      note_id = 17

      mail = NoteMailer.index(
        email: email,
        encrypted_token: encrypted_token,
        note_id: note_id
      )

      expect(mail.body).to include("secret\sadmirer")
    end

    context "Data" do
      before(:each) do
        @sender = 'Samantha'
        @email = "scottli_010@hotmail.com"
        @recipient = "scottli_010"
        @encrypted_token = SecureRandom.hex(32)
        @note_id = 17

        @mail = NoteMailer.index(
          email: @email,
          sender: @sender,
          encrypted_token: @encrypted_token,
          note_id: @note_id
        )
      end

      it "renders the headers" do
        expect(@mail.subject).to include("Bitcoins")
        expect(@mail.to).to eq([@email])
        expect(@mail.From.value).to eq("The Noteblock <cupid@thenoteblock.com>")
      end

      it "should render recipient" do
        expect(@mail.subject).to include("#{@recipient}")
      end

      it "should render url" do
        url = "http://www.thenoteblock.com/notes/#{@note_id}/claim?token=#{@encrypted_token}"
        expect(@mail.body).to include("#{url}")
      end

      it "should render sender" do
        expect(@mail.subject).to include("#{@sender}")
        expect(@mail.body).to include("#{@sender}")
      end
    end
  end

  describe "Deliver" do
    before(:each) do
      @sender = 'Samantha'
      @email = "scottli0101@gmail.com"
      @recipient = "scottli_010"
      @encrypted_token = SecureRandom.hex(32)
      @note_id = 17

      @mail = NoteMailer.index(
        email: @email,
        sender: @sender,
        encrypted_token: @encrypted_token,
        note_id: @note_id,
      )

      @prod_mail = NoteMailer.index(
        email: @email,
        sender: @sender,
        encrypted_token: @encrypted_token,
        note_id: @note_id,
        force: true
      )
    end

    after(:each) do
      ActionMailer::Base.deliveries.clear
    end

    it "should deliver" do
      expect(@mail.deliver).to be_true
    end

    it "should deliver in production" do
      expect(@prod_mail.deliver).to be_true
    end

  end

end
