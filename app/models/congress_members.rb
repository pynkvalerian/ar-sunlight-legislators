require_relative '../../db/config'

class CongressMember < ActiveRecord::Base

  def self.state(string)
    self.where(state: string)
  end

  def self.party(string)
    self.where(party: string)
  end

  def self.gender(string)
    self.where(gender: string)
  end

end

