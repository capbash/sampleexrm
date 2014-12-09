defmodule Sampleexrm.Server do
  use GenServer

  def start_link do
    GenServer.start_link(__MODULE__, 0, name: :sampleexrm_server)
  end

  def ping do
    GenServer.call(:sampleexrm_server, :ping)
  end

  def handle_call(:ping, _from, state) do
    {:reply, "Sample EXRM #{Bashdocs.Mixfile.project[:version]} #{state+1}", state+1}
  end
end

defmodule Sampleexrm do
  use Application

  # See http://elixir-lang.org/docs/stable/elixir/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      # Define workers and child supervisors to be supervised
      worker(Sampleexrm.Server, [])
    ]

    # See http://elixir-lang.org/docs/stable/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Sampleexrm.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
