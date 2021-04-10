defmodule Rockelivery.Orders.ReportRunner do
  use GenServer

  require Logger

  alias Rockelivery.Orders.Report

  # Client

  def start_link(_initial_stack) do
    GenServer.start(__MODULE__, %{})
  end

  # Server

  @impl true
  def init(state) do
    Logger.info("Report runner started...")

    schedule_report_generation()

    {:ok, state}
  end

  @impl true
  # Receives any type of message
  def handle_info(:generate, state) do
    Logger.info("Generating Report...")

    Report.create()

    schedule_report_generation()

    {:noreply, state}
  end

  def schedule_report_generation do
    # 5 hours
    Process.send_after(self(), :generate, 1000 * 60 * 60 * 5)
  end
end
