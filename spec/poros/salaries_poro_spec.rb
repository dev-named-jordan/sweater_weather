require 'rails_helper'

RSpec.describe 'Salaries poro' do
  it 'can make a poro' do

    poro = SalariesFacade.get_destination("denver,co")

    expect(poro.destination).to eq("Denver, Colorado, United States")
    expect(poro.forecast).to be_a(Hash)
    expect(poro.salaries).to be_an(Array)
    expect(poro.salaries.count).to eq(7)
  end
end
