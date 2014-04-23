class StaticPagesController < ApplicationController
  def bio
  	@bio = Bio.order(:order).all
  end

  def portfolio
  	@sections = Section.order(:order).where(section_id: nil)
  end
end
