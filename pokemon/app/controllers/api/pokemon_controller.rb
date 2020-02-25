class Api::PokemonController < ApplicationController

    def index
        @pokemon = Pokemon.all;
    end

    def show
        @pokemon = Pokemon.find_by(params[:id]);
    end

end
