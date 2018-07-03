defmodule Pepperup.Worker do
  use GenServer

  require Logger

  def start_link do
    GenServer.start_link(__MODULE__, %{})
  end

  def init(state) do
    Logger.info "worker initing"
    Process.send_after(self(), :work, 0)
    {:ok, state}
  end

  def handle_info(:work, state) do
    Logger.info "working"

    {:ok, _} = HTTPoison.start
    response = HTTPoison.get! "https://stark-mesa-98224.herokuapp.com/"
    Logger.info "response: #{inspect response}"

    Process.send_after(self(), :work, 4*60*60*1000)
    {:noreply, state}
  end
end
