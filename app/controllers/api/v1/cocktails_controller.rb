module Api
  module V1
    class CocktailsController < ApplicationController
      def index
        render json: Cocktail.all
      end

      def show
        cocktail = Cocktail.find(params[:id])

        cocktail_json = {
          id: cocktail.id,
          name: cocktail.name,
          description: cocktail.description,
          instructions: cocktail.instructions,
          source: cocktail.source,
          proportions: cocktail.proportions.map do |prop|
            {
              id: prop.id,
              ingredient_name: prop.ingredient.name,
              amount: prop.amount
            }
          end
        }

        render json: cocktail_json
      end

      def create
        # cocktail = Cocktail.create(name: params[:name], description: params[:description], instructions: params{:instructions}, source: params{:source})
        # cocktail = Cocktail.create(name: cocktail_params[:name])

        # cocktail_params[:proportions].each do |proportion|
        #   ingredient = Ingredient.find_or_create_by(name: proportion[:ingredient_name])
        #   proportion = Proportion.create(amount: proportion[:amount], ingredient: ingredient, cocktail: cocktail)
        # end 

        cocktail = Cocktail.create(cocktail_params)


        render json: cocktail 
      end 

      def edit

      end

      def update

      end

      def destroy

      end
      
      private

      def cocktail_params
        params.require(:cocktail).permit(
          :name,
          :description,
          :instructions,
         proportions: [:ingredient_name, :amount]
        )
      end 
      
    end
  end
end
