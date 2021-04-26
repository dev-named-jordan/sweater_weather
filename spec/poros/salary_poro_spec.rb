require 'rails_helper'

RSpec.describe 'Salary poro' do
  it 'can make a poro' do

    poro = SalariesFacade.get_destination("denver,co")

    expect(poro.salaries.first).to be_an_instance_of(Salary)
    expect(poro.salaries.first.max).to eq("$62106.69")
    expect(poro.salaries.first.min).to eq("$42878.34")
    expect(poro.salaries.first.title).to eq("Data Analyst")
    expect(poro.salaries.count).to eq(7)
  end
end
