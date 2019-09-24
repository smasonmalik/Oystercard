class Oystercard
  attr_reader :balance

  MAX_BALANCE = 90
  MIN_BALANCE = 1

  def initialize
    @balance = 0
    @in_journey = false
    #@entry_station = nil
  end

  def in_journey?
    @in_journey
  end

  def top_up(amount)
    @balance + amount > MAX_BALANCE ? "card has balance limit of £#{MAX_BALANCE}" : @balance += amount
  end

  def touch_in
    raise "Balance below minimum of #{MIN_BALANCE}" unless @balance >= MIN_BALANCE
    @in_journey = true
    #@entry_station = entry_station
  end

  def touch_out
    @in_journey = false

    deduct(MIN_BALANCE)

  end

  private 

  def deduct(amount)
    @balance -= amount
  end

end
