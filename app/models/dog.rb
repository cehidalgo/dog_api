class Dog < ApplicationRecord
  before_create :set_times_to_zero

  def set_times_to_zero
    self.times_picked_at_random = 0

    self.save() if self.persisted?
  end

  def found_dog_at_random
    self.times_picked_at_random += 1

    self.save()
  end
end
