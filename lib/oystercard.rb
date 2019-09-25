class Oystercard
  attr_reader :balance, :history, :journey, :in_journey

  MAX_BALANCE = 90
  MIN_BALANCE = 1

  def initialize
    @balance = 0
    @history = []
    @journey = {:entry_station => nil, :exit_station => nil}
    @in_journey = false
  end

  def top_up(amount)
    @balance + amount > MAX_BALANCE ? "card has balance limit of £#{MAX_BALANCE}" : @balance += amount
  end

  def touch_in(station)
    raise "Balance below minimum of #{MIN_BALANCE}" unless @balance >= MIN_BALANCE
    @in_journey = true
    @journey[:entry_station] = station
  end

  def touch_out(station)
    @in_journey = false
    @journey[:exit_station] = station
    @history << @journey

    deduct(MIN_BALANCE)
  end


  private

  def deduct(amount)
    @balance -= amount
  end

end
