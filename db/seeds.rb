# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# ADMIN
puts 'Inserting AdminUser...'.colorize(:green)
  admin = User.create(name:'NITRO Global Admin', email:'aa@a.a', legal_id: CPF.generate, locale:'pt-BR', password:'123', password_confirmation:'123')
  puts "\t #{admin}" if admin.errors.empty?
puts '...AdminUser inserted.'.colorize(:light_blue)
# /ADMIN