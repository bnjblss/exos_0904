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
  puts hash.count{|k| k.to_s[/[Cc]oin]/]}
end

def perform
  merged_arrays
  sort_higher(merged_arrays)
  sort_smaller(merged_arrays)
  coin_name(hash)
end

perform
