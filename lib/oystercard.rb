require 'journey'

class Oystercard
  attr_reader :balance, :history, :journey, :in_journey

  MAX_BALANCE = 90
  MIN_BALANCE = 1

  def initialize
    @balance = 0
    @history = []
    @journey = Journey.new
    @in_journey = false
  end

  def top_up(amount)
    @balance + amount > MAX_BALANCE ? "card has balance limit of £#{MAX_BALANCE}" : @balance += amount
  end

  def touch_in(station)
    raise "Balance below minimum of #{MIN_BALANCE}" unless @balance >= MIN_BALANCE
    @journey.start(station)
  end

  def touch_out(station)
    @journey.finish(station)
    @history << @journey.current_journey

    deduct(MIN_BALANCE)
  end


  private

  def deduct(amount)
    @balance -= amount
  end

end
