class DeleteDog
  include Dry::Transaction

  step :process
  step :persist!

  def process input
    Success input
  end

  def persist! input
    @dog.destroy()
    Success(id: input[:id])
  end
end
