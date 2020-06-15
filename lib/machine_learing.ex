defmodule MachineLearning do
    @moduledoc """
    Page keeps the contexts that define your domain
    and business logic.
  
    Contexts are also responsible for managing your data, regardless
    if it comes from the database, an external API or others.
    """
    use GenServer

    def jobs do
        [
        "https://www.pracuj.pl/praca/senior-node-js-developer-sopot,oferta,1000269472",
        "https://www.pracuj.pl/praca/przedstawiciel-ubezpieczeniowy-sprzedaz-zdalna-slupsk,oferta,1000188343?sug=list_top_cr_bd_47_tname_nopmi_tgroup_A",
        "https://www.pracuj.pl/praca/sprzedawca-kasjer-warszawa,oferta,1000256747",
        "https://www.pracuj.pl/praca/administrator-ms-active-directory-katowice,oferta,1000257037",
        "https://www.pracuj.pl/praca/shop-coordinator-e-commerce-with-russian-krakow,oferta,1000257107"
        ]
    end

    def start_link(state) do
        GenServer.start_link(__MODULE__, state, name: Jobber)
    end

    @impl true
    def init(state) do
      {:ok, state}
    end
    
    @impl true
    def handle_cast({:job, email, file}, state) do
      # nasza sieć neuronowa dobiera odpowiedną pracę dla kandydata
      # czasem potrafi się zepsuć
      Process.sleep(5000)
      job = Enum.fetch!(jobs(),Enum.random(0..6))
      GenServer.cast(EmailSender, {:job, email, job})
      {:noreply, []}
    end

  end
  