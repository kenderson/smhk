class BootstrapFirstUser < ActiveRecord::Migration
  def self.up
    u = User.create(:login=>"admin",:password=>"kenderson4343",:password_confirmation=>"kenderson4343",:email=>"ken@kenderson.net",:name=>"Ken Henderson")
  end

  def self.down
    User.destroy_all
  end
end