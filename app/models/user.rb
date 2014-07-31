class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :registerable, :cas_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable #:database_authenticatable

    def cas_extra_attributes=(extra_attributes)
    	extra_attributes.each do |name, value|
    case name.to_sym
     		when :fullname
        		self.fullname = value
      		when :email
        		self.email = value
      		end
    	end
  	end
end
