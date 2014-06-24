class PortfolioController < ApplicationController
  
  def show
    @sections = Section.cached_sections
  end
  
end
