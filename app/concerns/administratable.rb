module Administratable
  def to_s
    "#{self.class} ##{id}"
  end
end
