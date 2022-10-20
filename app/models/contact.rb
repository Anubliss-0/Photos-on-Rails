class Contact < MailForm::Base
  attribute :name
  attribute :email
  attribute :string
  attribute :message

  def headers
    {
      to: "INSERT EMAIL",
      subject: "Inqueries Form",
      from: "INSERT EMAIL",  # change this to be the email it is coming from
      reply_to: "INSERT EMAIL"
    }  end
end
