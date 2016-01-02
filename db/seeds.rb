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
  admin_params = {role: admin_role, legal_id: CPF.generate, locale:'pt-BR', password:'123', password_confirmation:'123'}

  admin = User.create(admin_params.merge(name:'Ilton NITRO Admin', email:'ilton@a.a'))
  if admin.errors.empty? then puts "\t #{admin}".green else puts "\t #{admin}".red end

  admin = User.create(admin_params.merge(name:'Ciro NITRO Admin', email:'ciro@a.a'))
  if admin.errors.empty? then puts "\t #{admin}".green else puts "\t #{admin}".red end

  admin = User.create(admin_params.merge(name:'Cristiano NITRO Admin', email:'cristiano@a.a'))
  if admin.errors.empty? then puts "\t #{admin}".green else puts "\t #{admin}".red end
puts '...AdminUser inserted.'.colorize(:light_blue)
# /ADMIN