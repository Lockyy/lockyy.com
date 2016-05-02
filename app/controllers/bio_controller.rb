class BioController < ApplicationController
  def show
    @bio = Bio.first
  end
end
