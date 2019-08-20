class AddressesController < ApplicationController
  def index
    @addresss=Address.all
  end

  def new
    @address=Address.new
  end
  def create
    @address=Address.new(address_params)
    @address.save
  end
end
