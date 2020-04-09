puts "-" * 20
puts "Exo sur les cryptos"

local_dir = File.expand_path('../', __FILE__)
$LOAD_PATH.unshift(local_dir)
require "currencies.rb"

def merged_arrays
  #toutes les valeurs sans le $ et converties en f
  value_crypto = VALUES.map{|i| i.delete("$").to_f}
  #on merged le tout
  hash = Hash[CRYPTOS.zip(value_crypto)]
end

def sort_higher(hash)
  puts "Voici les 5 cryptos qui ont la plus grosse valeur"
  puts Hash[hash.sort_by{|k, i| -i}[0..4]]
end

def sort_smaller(hash)
  puts "et les 5 cryptos qui en ont le moins"
  puts Hash[hash.sort_by{|k, i| i}[0..4]]
end

def coin_name(hash)
  puts "-" * 10
  puts "Voici le nombre de cryptos avec le mot coin"
  puts hash.count{|k, i| k.to_s.downcase.include?("coin")}
end

def crypto_under (hash)
  puts "-" * 10
  puts "Voici le nombre de cryptos < à 6000$"
  puts hash.count{|k, i| i.to_f < 6000}
end

def best_crypto_under (hash)
  puts "-" * 10
  puts "et les 5 meilleurs < à 6000$"
  hash_under = hash.select{|k, i| i.to_f < 6000}

  puts Hash[hash_under.sort_by{|k, i| -i}[0..4]]

  puts "-" * 20
end

def perform
  merged_arrays
  sort_higher(merged_arrays)
  sort_smaller(merged_arrays)
  coin_name(merged_arrays)
  crypto_under(merged_arrays)
  best_crypto_under(merged_arrays)
end

perform
