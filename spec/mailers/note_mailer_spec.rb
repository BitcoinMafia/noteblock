require "spec_helper"

describe NoteMailer do
  describe "index" do
    before(:each) do
      @mail = NoteMailer.index
    end

    it "renders the headers" do
      @mail.subject.should eq("Index")
      @mail.to.should eq(["to@example.org"])
      @mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      @mail.body.encoded.should match("Hi")
    end
  end

end
