class CreateDog
  include Dry::Transaction

  step :process
  step :validate
  step :persist!

  def process input
    Success(race_name: input[:race_name],
      img_url: input[:img_url],
      times_picked_at_random: input[:times_picked_at_random]
    )
  end

  def validate input
    if input[:race_name].blank? or input[:img_url].blank?
      return Failure(:not_valid)
    else
      Success(input)
    end

    if Dog.where(race_name: input[:race_name]).length > 1
      return Failure(:already_exists)
    else
      Success(input)
    end

    if input[:img_url][0..3] != 'http'
      return Failure(:no_host_name)
    else
      Success(input)
    end
  end

  def persist! input
    @dog = Dog.new(input)
    if @dog.save
      Success(@dog.attributes)
    else
      return Failure(:persistance_error)
    end
  end
end
