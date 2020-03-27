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
  
  new_hash[name][:color] = loop_and_add(old_data[:color], name)
  new_hash[name][:gender] = loop_and_add(old_data[:gender], name)
  new_hash[name][:lives] = loop_and_add(old_data[:lives], name)
  
  new_hash
end

def nyc_pigeon_organizer(data)
  # write your code here!
  pidgeon_names = {}
  data[:gender][:male].each { |name| pidgeon_names[name] = {} }
  data[:gender][:female].each { |name| pidgeon_names[name] = {} }
    
  
  name_keys = pidgeon_names.keys
  name_keys.each do |name|
    pidgeon_names[name] = add_data_to_name(data, pidgeon_names, name)
  end
  
  pidgeon_names
end
