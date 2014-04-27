class StaticPagesController < ApplicationController
  def bio
  	@bio = Bio.cached_bio_lines
  end

  def portfolio
  	@sections = Section.cached_sections
  end
end
