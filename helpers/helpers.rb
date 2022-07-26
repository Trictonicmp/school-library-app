require 'date'

# app/helpers/helpers.rb
def parse_response(response)
  is_data_ok = false if %w[n N].include? response
  is_data_ok = true if %w[y Y].include? response

  is_data_ok
end

def generate_new_person_id(arr)
  new_id_found = false
  new_id = 0

  until new_id_found
    new_id = rand(1...1000)
    new_id_found = true
    arr.each do |person|
      if person.id == new_id
        new_id_found = false
        break
      end
    end
  end
  new_id
end

def until_valid_option(min, max)
  valid_option = false
  op = 0
  while !valid_option do
    yield
    print "Option: "
    op = Integer(gets.chomp)

    valid_option = true if op >= min && op < max
    print "Wrong item, try again\n\n" if op >= max || op < min
  end

  op
end

def until_data_ok
  is_data_ok = false
  while is_data_ok != true
    yield
    print "\nis all the information correct? [Y/N]: "
    is_data_ok = parse_response(gets.chomp)
  end
end
