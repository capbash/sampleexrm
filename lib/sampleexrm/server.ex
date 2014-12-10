defmodule Sampleexrm.Server do
  use GenServer

  def start_link() do
    :gen_server.start_link({:local, :sampleexrm}, __MODULE__, [], [])
  end

  def init([]) do
    { :ok, [] }
  end

  def handle_call(:version, _from, state) do
    { :reply, "0.0.5", state}
  end

end
