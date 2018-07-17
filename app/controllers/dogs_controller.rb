class DogsController < ApplicationController

  # GET /dogs/ || GET /dogs/.json || GET /dogs/.xml
  def index
    @dogs = Dog.all

    respond_to do |f|
      f.json{ render json: @dogs }
      f.xml { render xml:  @dogs }
      f.html{ render json: @dogs }
    end
  end

  # GET /dogs/new || GET /dogs/new.json || GET /dogs/new.xml
  def new
    @dog = Dog.new

    respond_to do |f|
      f.json{ render json: @dog }
      f.xml { render xml:  @dog }
      f.html{ render json: @dog }
    end
  end

  # GET /dogs/1 || GET /dogs/1.json || GET /dogs/1.xml
  def show
    @dog = Dog.find(params[:id]) rescue []

    respond_to do |f|
      if @dog.blank?
        f.json{ head :not_found }
        f.xml { head :not_found }
        f.html{ head :not_found }

      else
        f.json{ render json: @dog }
        f.xml { render xml:  @dog }
        f.html{ render json: @dog }

      end
    end
  end

  # POST /dogs/ || POST /dogs/.json || POST /dogs/.xml
  def create
    @dog = CreateDog.new.(dog_parameters) # Dog.new(dog_parameters)

    require 'pry'; binding.pry
    respond_to do |f|
      if @dog.success?
        f.json{ render json: @dog.success, success: @dog.success?, location: @dog.success.delete(:times_picked_at_random) }
        f.xml { render  xml: @dog.success, success: @dog.success?, location: @dog.success.delete(:times_picked_at_random) }
        f.html{ render json: @dog.success, success: @dog.success?, location: @dog.success.delete(:times_picked_at_random) }

      else
        f.json{ render json: { success: @dog.success?, status: :unprocessable_entity, exception: @dog.failure } }
        f.xml { render xml:  { success: @dog.success?, status: :unprocessable_entity, exception: @dog.failure } }
        f.html{ render json: { success: @dog.success?, status: :unprocessable_entity, exception: @dog.failure } }

      end
    end
  end

  # PATCH/PUT /dogs/1 || PATCH/PUT /dogs/1.json || PATCH/PUT /dogs/1.xml
  def update
    @dog = Dog.find(params[:id]) rescue []

    head 404 and return if @dog.blank?

    respond_to do |f|
      if @dog.update_attributes(dog_parameters)
        f.json{ head :no_content }
        f.xml { head :no_content }
        f.html{ head :no_content }

      else
        f.json{ render json: @dog.errors, status: :unprocessable_entity }
        f.xml { render xml:  @dog.errors, status: :unprocessable_entity }
        f.html{ render json: @dog.errors, status: :unprocessable_entity }

      end
    end
  end

  # DELETE /dogs/1 || DELETE /dogs/1.json || DELETE /dogs/1.xml
  def destroy
    @dog = Dog.find(params[:id])

    @dog.destroy
    respond_to do |f|
      f.json{ head :no_content }
      f.xml { head :no_content }
      f.html{ head :no_content }
    end
  end

  # GET /random || GET /random?format=json || GET /random?format=xml
  def random
    @random_dog = Dog.find(rand(Dog.count)+1)

    @random_dog.found_dog_at_random()

    respond_to do |f|
      f.html{ render json: @random_dog }
      f.json{ render json: @random_dog }
      f.xml { render xml:  @random_dog }
    end
  end

  private
  def dog_parameters
    return params.require(:dog).permit(:race_name, :img_url)
  end
end
