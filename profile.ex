defmodule Profile do
	import Nutrients
	
	defstruct name: "My Name", gender: :m, weight: 0, height: 0, age: 0, bmr: 0, nutrients: %Nutrients{}

	def start_link do
		Agent.start_link(fn -> %Profile{} end, name: __MODULE__)
	end
	
	def calculate_BMR do

	end

	def find_calorieSpec do  

	end

	def nutrientTable do

	end
	
end
