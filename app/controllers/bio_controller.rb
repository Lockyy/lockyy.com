# frozen_string_literal: true

class BioController < ApplicationController
  def show
    @bio = Bio.first
  end
end
