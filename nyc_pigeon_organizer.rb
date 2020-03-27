def build_structure(name_array)
  new_hash = Hash.new
  name_array.each do |name| 
    new_hash[name] = {
      color: [],
      gender: [],
      lives: []
    }
  end
  new_hash
end

def loop_and_add(data, name)
  new_array = []
  key_array = data.keys
  key_array.each do |key|
    new_array << key.to_s if data[key].include?(name)
  end
  new_array
end

def add_data_to_name(old_data, new_data, name)
  new_hash = new_data
  
  new_hash[:color] = loop_and_add(old_data[:color], name)
  new_hash[:gender] = loop_and_add(old_data[:gender], name)
  new_hash[:lives] = loop_and_add(old_data[:lives], name)
  
  new_hash
end

def nyc_pigeon_organizer(data)
  # write your code here!
  
  name_keys = []
  data[:gender][:male].each { |name| name_keys << name }
  data[:gender][:female].each { |name| name_keys << name }
  
  pp name_keys
  
  pidgeon_names = build_structure(name_keys)
  
  pp pidgeon_names
  
  name_keys.each do |name|
    name_data = add_data_to_name(data, pidgeon_names[name], name)
    pidgeon_names[name] = add_data_to_name(data, pidgeon_names, name)
  end
  
  pidgeon_names
end
