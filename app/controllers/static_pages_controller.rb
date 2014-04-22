class StaticPagesController < ApplicationController
  def bio
  	@bio = Bio.all
  end

  def portfolio
  	@sections = Section.all.order("order DESC")
  end
end
