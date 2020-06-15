defmodule EmailSender do
    @moduledoc """
    Page keeps the contexts that define your domain
    and business logic.
  
    Contexts are also responsible for managing your data, regardless
    if it comes from the database, an external API or others.
    """
    use GenServer

    def start_link(state) do
        GenServer.start_link(__MODULE__, state, name: EmailSender)
    end

    @impl true
    def init(state) do
      {:ok, state}
    end
    
    @impl true
    def handle_cast({:job, email, link}, state) do
      email = Emailer.create(email, "Your dream job", link)
      Page.Mailer.deliver_now(email)
      {:noreply, []}
    end

  end
  