# frozen_string_literal: true

class PortfolioController < ApplicationController
  def show
    @sections = Section.top_level
  end
end
