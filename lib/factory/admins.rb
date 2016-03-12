module Factory
  class Admins
    def self.create
      admin_role = 1
      admin_params = {role: admin_role, locale:'pt-BR', password:'123123', password_confirmation:'123123'}

      admin = User.create(admin_params.merge(name:'Ilton NITRO Admin', email:'ilton@nitrostart.me', legal_id: CPF.generate))
      admin.confirmed_at = Time.now
      admin.save
      if admin.errors.empty? then puts "\t #{admin}".green else puts "\t #{admin}".red end

      admin = User.create(admin_params.merge(name:'Ciro NITRO Admin', email:'ciro@nitrostart.me', legal_id: CPF.generate))
      admin.confirmed_at = Time.now
      admin.save
      if admin.errors.empty? then puts "\t #{admin}".green else puts "\t #{admin}".red end
    end
  end
end