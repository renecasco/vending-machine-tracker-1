require 'rails_helper'

RSpec.describe 'When a user visits a vending machine show page', type: :feature do
  scenario 'they see the location of that machine' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")

    visit machine_path(dons)

    expect(page).to have_content("Don's Mixed Drinks Vending Machine")
  end

  scenario ' they see the name of all of the snacks associated with that vending machine along with their price' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    burger = dons.snacks.create(name: "White Castle Burger", price: 3.50)
    rocks = dons.snacks.create(name: "Pop Rocks", price: 2.50)
    cheetos = dons.snacks.create(name: "Flaming Hot Cheetos", price: 2.50)


    visit machine_path(dons)

    expect(page).to have_content("* White Castle Burger: $3.50")
    expect(page).to have_content("Pop Rocks: $1.50")
    expect(page).to have_content("Flaming Hot Cheetos: $2.50")
  end
end
