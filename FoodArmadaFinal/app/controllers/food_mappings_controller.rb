class FoodMappingsController < ApplicationController

  # Creates a new food_mapping but doesn't save it
  def new
    @food_mapping = FoodMapping.new
    Wolfram.appid = "PKTYVV-E47YQ82PLT"
  end

  # creates a new food_mapping and saves it
  def create
    Wolfram.appid = "PKTYVV-E47YQ82PLT"
    @food_mapping = FoodMapping.new(food_mapping_params)
  end

  # From the client, update the data on the server
  def update
    @food_mapping = 
  end

  # Reset state of the database; e.g., for if attempting an update after a day change
  def reset(theFoodMapping)
    
  end
  

  
  # From the client, get the data from the server
  def show
    # Needs to take an input --> puts it to query
    # Check hash returned. Check Input Interpretation for format of
    # food | amount | measuring_amount

    
    Wolfram.appid = "PKTYVV-E47YQ82PLT"
    query = 'food turkey'
    result = Wolfram.fetch(query)
    # to see the result as a hash of pods and assumptions:                                        
    hash = Wolfram::HashPresenter.new(result).to_hash

    # Perform check, extract serving input amount read
    interp = hash[:pods]["Input interpretation"]
    puts interp
    # Nutrition facts

    nutritionFacts = hash[:pods]["Nutrition facts"]
    puts nutritionFacts
    # Checks out Average nutrition facts
    
    avgNutrition = hash[:pods]["Average nutrition facts"]
    puts avgNutrition
    # Check out Average daily value ranking
    
    avgDV = hash[:pods]["Average daily value ranking"]
    puts avgDV
    # Check out Average highest nutrients compared to other foods
    
    highNutrition = hash[:pods]["Average highest nutrients compared to other foods"]
    puts highNutrition

    #Check out Calories
    calories = hash[:pods]["Calories"]
    puts calories
    
    # Check out Carbs
    carbs = hash[:pods]["Carbohydrates"]
    puts carbs
    #numa = hash["pods"]["Average nutrition facts"]

    # Check out Fats
    fats = hash[:pods]["Fats and fatty acids"]
    puts fats
    # Checkout out Protein
    protein = hash[:pods]["Protein and amino acids"]
    puts protein
    # Checkout out Vitamins
    vitamins = hash[:pods]["Vitamins"]
    puts vitamins
    
    sterols = hash[:pods]["Sterols"]
    puts sterols

    alcohol = hash[:pods]["Alcohol content"]
    puts alcohol

    
    physical = hash[:pods]["Physical properties"]
    puts physical
    
    render json: hash[:pods]
  end

   private
`
`def food_mapping_params
  params.require(:food_mapping).permit(:biotin, :choline, :folate, :folic_acid, :niacin, :riboflavin, :thiamin, :vitamin_A, :vitamin_B12, :vitamin_B6, :vitamin_C, :vitamin_D, :vitamin_E, :vitamin_K, :panto_acid, :calories, :fatCalories, :fiber, :protein)
  
end


  

end
