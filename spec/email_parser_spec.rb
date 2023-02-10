describe "EmailAddressParser" do
  describe ".new" do
    it "has an initialize method that takes in a list of emails" do
      expect {
        EmailAddressParser.new("avi@test.com, arel@test.com")
      }.not_to raise_error
    end
  end

  describe "#parse" do
    it "parses comma-separated value (CSV) emails" do
      expect(EmailAddressParser.new("avi@test.com, arel@test.com").parse).to eq(
        %w[avi@test.com arel@test.com]
      )
    end

    it "parses space delimited emails" do
      expect(EmailAddressParser.new("avi@test.com arel@test.com").parse).to eq(
        %w[avi@test.com arel@test.com]
      )
    end

    it "parses both CSV and space delimited emails" do
      emails = "avi@test.com, arel@test.com test@avi.com, test@arel.com"
      expect(EmailAddressParser.new(emails).parse).to eq(
        %w[avi@test.com arel@test.com test@avi.com test@arel.com]
      )
    end

    it "parses and removes duplicate emails" do
      expect(EmailAddressParser.new("avi@test.com, avi@test.com").parse).to eq(
        ["avi@test.com"]
      )
    end
  end
end
