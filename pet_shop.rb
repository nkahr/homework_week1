def pet_shop_name(pet_shop_hash)
  return pet_shop_hash[:name]

end

def total_cash(pet_shop_hash)
  return pet_shop_hash[:admin][:total_cash]
end

def add_or_remove_cash(pet_shop_hash, quantity)
  pet_shop_hash[:admin][:total_cash] += quantity
end

def pets_sold(pet_shop_hash)
  return pet_shop_hash[:admin][:pets_sold]
end

def increase_pets_sold(pet_shop_hash, quantity)
  pet_shop_hash[:admin][:pets_sold] += quantity
end

def stock_count(pet_shop_hash)
  return pet_shop_hash[:pets].length()
end

def pets_by_breed(pet_shop_hash, breed_string)
  counter = 0 
  array_of_pets = [] 
  while counter < pet_shop_hash[:pets].length
    if pet_shop_hash[:pets][counter][:breed] == breed_string
      array_of_pets.push(pet_shop_hash[:pets][counter][:name])
    end
    counter += 1
  end
  return array_of_pets
end

def find_pet_by_name(pet_shop_hash, name_string)

  counter = 0
  while counter < pet_shop_hash[:pets].length
    if pet_shop_hash[:pets][counter][:name] == name_string
      pet = pet_shop_hash[:pets][counter]
    end
    counter += 1 
  end
  return pet
end

def remove_pet_by_name(pet_shop_hash, name_string)
  counter = 0
  while counter < pet_shop_hash[:pets].length
    if pet_shop_hash[:pets][counter][:name] == name_string
      pet_shop_hash[:pets].delete_at(counter)
    end
    counter += 1 
  end
end

def add_pet_to_stock(pet_shop_hash, new_pet_hash)
  pet_shop_hash[:pets].push(new_pet_hash)
end

def customer_pet_count(customer_hash)
  customer_hash[:pets].length
end

def add_pet_to_customer(customer_hash, new_pet_hash)
  customer_hash[:pets].push(new_pet_hash)
end

def customer_can_afford_pet(customer_hash, new_pet_hash)
  return customer_hash[:cash] > new_pet_hash[:price]
end

def sell_pet_to_customer(pet_shop_hash, pet_hash, customer_hash)
  if pet_hash
    if pet_hash[:price] < customer_hash[:cash]
      customer_hash[:cash] -= pet_hash[:price]
      customer_hash[:pets].push(pet_hash)
      remove_pet_by_name(pet_shop_hash, pet_hash[:name])
      pet_shop_hash[:admin][:total_cash] += pet_hash[:price]
      pet_shop_hash[:admin][:pets_sold] += 1
    end
  end
end



