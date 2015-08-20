require_relative '../app/models/congress_members.rb'
require_relative '../app/models/senators.rb'
require_relative '../app/models/representatives.rb'

def congressmembers_in_state(string)
  senators = Sen.state(string)
  sorted_senators = senators.sort_by {|sen| sen[:last_name]}

  puts "Senators:"
  sorted_senators.each do |senator|
    puts "   #{senator[:first_name]} #{senator[:last_name]} (#{senator[:party]})"
  end

  reps = Rep.state(string)
  sorted_reps = reps.sort_by {|rep| rep[:last_name]}

  puts "Representatives:"
  sorted_reps.each do |senator|
    puts "   #{senator[:first_name]} #{senator[:last_name]} (#{senator[:party]})"
  end

end

def congressmembers_by_gender(string)
  senators = Sen.gender(string).count
  percentage = (senators.to_f/Sen.all.count * 100).round(0)

    case string
      when "M"
      puts "Male Senators: #{senators} (#{percentage}%)"
      when "F"
      puts "Female Senators: #{senators} (#{percentage}%)"
      else
      puts "Choose a gender."
    end
end

def active_in_states
  states = []
  CongressMember.all.group(:state).each do |group|
    states << group.state
  end
  state_hash = []

  states.each do |state|
    hash = {}
    sen_count = Sen.state(state).count
    rep_count = Rep.state(state).count
    hash[:state] = state
    hash[:senators] = sen_count
    hash[:reps] = rep_count
    hash[:total] = sen_count + rep_count
    state_hash << hash
  end

  sorted_states = state_hash.sort_by {|s| -s[:total]}

  sorted_states.each do |states|
    if states[:senators] != 0 && states[:reps] != 0
      puts "#{states[:state]}: #{states[:senators]} Senators, #{states[:reps]} Representative(s)"
    end
  end

end

def count_all
  puts "Senators: #{Sen.all.count}"
  puts "Representatives: #{Rep.all.count}"
end

def delete_not_in_office?
  not_active = CongressMember.where(in_office: "0")
   not_active.delete_all
end

# congressmembers_in_state("NY")
# congressmembers_by_gender("M")
# active_in_states
count_all
delete_not_in_office