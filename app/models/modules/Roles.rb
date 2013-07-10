module Roles
  ROLES = %w[admin]


  def roles=(roles)
    self.roles_mask = (roles & ROLES).map { |r| 2**ROLES.index(r) }.sum
  end

	def roles
  	ROLES.reject { |r| ((self.roles_mask || 0) & 2**ROLES.index(r)).zero? }
	end

	def role?(role)
		roles.include? role.to_s
	end

end