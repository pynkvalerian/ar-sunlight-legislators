require_relative '../models/congress_members'

class Sen < CongressMember
    self.inheritance_column = :title

end