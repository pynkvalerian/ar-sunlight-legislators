require_relative '../models/congress_members'

class Rep < CongressMember
    self.inheritance_column = :title
end