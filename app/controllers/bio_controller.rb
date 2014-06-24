class BioController < ApplicationController
  
  def show
  	@bio = Bio.cached_bio_lines
  end
  
end
