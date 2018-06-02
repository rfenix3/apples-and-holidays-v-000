require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  # given that holiday_hash looks like this:
  # {
  #   :winter => {
  #     :christmas => ["Lights", "Wreath"],
  #     :new_years => ["Party Hats"]
  #   },
  #   :summer => {
  #     :fourth_of_july => ["Fireworks", "BBQ"]
  #   },
  #   :fall => {
  #     :thanksgiving => ["Turkey"]
  #   },
  #   :spring => {
  #     :memorial_day => ["BBQ"]
  #   }
  # }
  # return the second element in the 4th of July array
  holiday_hash[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  # holiday_hash is identical to the one above
  # add the second argument, which is a supply, to BOTH the
  # Christmas AND the New Year's arrays

  # Using Iterate method
  holiday_hash.each do |season, holidays|
    if season == :winter
        holidays.each do |holiday, items|
          items.push(supply)
          #binding.pry
        end
    end
  end
  
  # Using Enumerator method, see below
  #holiday_hash[:winter][:christmas] << supply
  #holiday_hash[:winter][:new_years] << supply
  
end


def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array

  # Using Iterate method
  holiday_hash.each do |season, holidays|
    holidays.each do |holiday, items|
      if holiday == :memorial_day
        items.push(supply)
        #binding.pry
      end
    end
  end
  
  # Using Enumerator method, see below  
  # holiday_hash[:spring][:memorial_day] << supply

end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  # code here
  # remember to return the updated hash

  holiday_hash.each do |seasons, holiday_names|
    if seasons == season
      holiday_hash[season][holiday_name] = supply_array
    end
  end
  
  # Using Enumerator method, see below  
  # holiday_hash[season][holiday_name] = supply_array

  holiday_hash
end

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
  #holiday_hash[:winter]

  supplies = []
  holiday_hash[:winter].each do |holiday, supply|
    supplies.push(supply)
  end
  supplies.flatten
end

def all_supplies_in_holidays(holiday_hash)
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.
  
  holiday_hash.each do |season, holidays|
    puts "#{capitalize_it(season)}:"
    holidays.each do |holiday, supplies|
      tempPuts = "  #{capitalize_it(holiday)}: " 
      supplies.each do |supply|
        if supplies.last == supply 
          tempPuts = tempPuts + supply
        else
          tempPuts = tempPuts + supply + ", "
        end
      end
      puts "#{tempPuts}"
    end
  end
end

def capitalize_it(string)
  newString = string.to_s
  if newString.count('_') > 0
    newStringArray = string.to_s.split('_')
  else 
    newStringArray = string.to_s.split
  end
  newStringArray.each do |a|
    a.capitalize!
  end
  newString = newStringArray.join(' ')
end

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
  holiday_list = []
  holiday_hash.each do |season, holidays|
    holidays.each do |holiday, supplies|
      supplies.each do |supply|
        if supply == "BBQ"
          holiday_list.push(holiday)
        end
      end
    end
  end
    holiday_list
end







