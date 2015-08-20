require_relative '../../db/config'

class CongressMember < ActiveRecord::Base
  # def state(string)
  #   self.where(state: string)
  # end

  # def party(string)
  #   self.where(party: string)
  # end

end

p CongressMember.all



