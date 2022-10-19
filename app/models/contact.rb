class Contact < MailForm::Base
  attribute :name
  attribute :email
  attribute :string
  attribute :message

  def headers
    { to: "PLEASE-CHANGE-ME@example.org" }
  end
end
