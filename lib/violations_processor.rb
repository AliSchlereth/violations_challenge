require 'CSV'
require './lib/violation.rb'

class ViolationsProcessor

  attr_reader :violations

  def initialize
    @violations = {}
  end

  def load_csv(filename)
    contents = CSV.open(filename, headers: true, header_converters: :symbol)
    contents.each do |row|
      type = row[:violation_type]
      date = row[:violation_date]
      check_violations(type, date)
    end
    print_violations_data
  end

  def check_violations(type, date)
    if violations[type]
      update_violation(type, date)
    else
      violations[type] = Violation.new(type, date)
    end
  end

  def update_violation(type, date)
    violations[type].earliest = date if violations[type].earliest > date
    violations[type].latest = date   if violations[type].latest   < date
    violations[type].count += 1
  end

  def print_violations_data
      puts  "Violation Type                                       Count     Earliest Violation        Latest Violation"
      puts ""
    violations.each do |type, violation|
      type = violation.type.ljust(48)
      count = violation.count.to_s.rjust(7)
      earliest = violation.earliest.rjust(25)
      latest = violation.latest.rjust(25)
      puts "#{type} #{count} #{earliest} #{latest}"
    end
  end

end
