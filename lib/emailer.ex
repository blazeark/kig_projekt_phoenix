defmodule Emailer do
    import Bamboo.Email
    import Bamboo.Mailer
  
    def create(to, subject, body) do
      new_email()
      |> to(to)
      |> from("me@example.com")
      |> subject(subject)
      |> html_body(body)
    end
  end