# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# ADMIN
puts 'Inserting AdminUser...'.colorize(:green)
  admin_role = 1
  admin = User.create(name:'NITRO Global Admin', role: admin_role, email:'aa@a.a', legal_id: CPF.generate, locale:'pt-BR', password:'123', password_confirmation:'123')
  if admin.errors.empty? then puts "\t #{admin}".green else puts "\t #{admin}".red end
puts '...AdminUser inserted.'.colorize(:light_blue)
# /ADMIN