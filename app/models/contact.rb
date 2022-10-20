class Contact < MailForm::Base
  attribute :name
  attribute :email
  attribute :string
  attribute :message

  def headers
    {
      to: "junkclay92@email.com",
      subject: "Inqueries Form",
      from: "claytonflaherty92@gmail.com",  # change this to be the email it is coming from
      reply_to: "claytonflahety92@gmail.com"
    }  end
end
