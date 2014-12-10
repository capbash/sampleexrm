defmodule Sampleexrm.Server do
  use GenServer

  def start_link() do
    GenServer.start_link(__MODULE__, [], name: :sampleexrm)
  end

  def init([]) do
    { :ok, [] }
  end

  def handle_call(:version, _from, state) do
    { :reply, "0.0.6", state}
  end

end
