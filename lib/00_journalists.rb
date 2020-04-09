puts "-" * 20
puts "Questions concernant la liste de handle Twitter"

local_dir = File.expand_path('../', __FILE__)
$LOAD_PATH.unshift(local_dir)
require "journalists_list.rb"

def comptage
#Combien de journalistes dans ce array ?
  puts "-" * 10
  puts "Combien y a-t-il de journalistes dans ce array ?"
  puts "> #{HANDLES.length}"
end

def numero
#Combien d'handle avec un numéro
  puts "-" * 10
  puts "Combien d'handle contiennent un numéro ?"
  puts HANDLES.count{|handle| handle[/\d/]}
end


#Combien contiennent Aude/Aude
def aude
  puts "-" * 10
  puts "Combien d'handle contiennent Aude ?"
  puts HANDLES.count{|handle| handle[/aude/]} + HANDLES.count{|handle| handle[/Aude/]}
end

#Combien commencent avec une maj
def majuscule
  puts "-" * 10
  puts "Combien d'handle commencent avec une majuscule ?"
  puts HANDLES.count{ |handle| handle[/^@[A-Z]/]}
end

def une_majuscule
  puts "-" * 10
  puts "Combien contiennent une majuscule ?"
  puts HANDLES.count{ |handle| handle[/[A-Z]/]}
end

def underscores
  puts "-" * 10
  puts "Combien de underscores au total ?"
  puts HANDLES.count{|handle| handle[/_/]}
#faux, il faut calculer TOUS les _
end

def tri_az
  puts "-" * 10
  puts "Voici la liste par ordre alphabétique"

  puts "Veux-tu vraiment la voir ? (y/n)"
  print "> "
  answer1 = gets.chomp

  if answer1 == "y"
    no_arobase = HANDLES.map{|handle| handle.gsub(/@/, "")}
    puts no_arobase.sort{|a, b| a.downcase <=> b.downcase }
  else
  end
end

def shorter_handles
  puts "-" * 10
  puts "Voici les 50 handles les plus courts"

  puts "Veux-tu vraiment la voir ? (y/n)"
  print "> "
  answer1 = gets.chomp

  if answer1 == "y"
    handles_length = HANDLES.sort_by{|handle| handle.length}
    puts handles_length[0..50]
  else
  end
end

def epenser_position
  puts "-" * 10
  puts "Quelle est la position de @epenser ?"

  puts "@epenser est à la #{HANDLES.index("@epenser")}e position"
  puts "-" * 20
end

def perform
  comptage
  numero
  aude
  majuscule
  une_majuscule
  underscores
  tri_az
  shorter_handles
  epenser_position
end

perform
