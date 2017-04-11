class Violation

  attr_accessor :type, :earliest, :latest, :count

  def initialize(type, date)
    @type = type
    @earliest = date
    @latest = date
    @count = 1
  end

end
