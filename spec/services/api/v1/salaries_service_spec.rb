require 'rails_helper'

RSpec.describe 'Salaries API service', type: :request do
  it 'get_destination'do

    destination = SalariesService.get_destination('denver,co')

    expect(destination).to be_a(Hash)
    expect(destination[:_embedded][:"city:search-results"][0][:_links][:"city:item"][:href]).to be_a(String)
  end
  it 'get destination url' do

    destination = SalariesService.get_destination_url('denver,co')

    expect(destination).to be_a(String)
  end
  it 'get destination slug' do

    destination = SalariesService.get_slug('denver,co')

    expect(destination).to be_a(String)
  end
  it 'get salaries url' do

    salary = SalariesService.get_salaries_url('denver,co')

    expect(salary).to be_a(String)
  end
  it 'get salaries' do

    salary = SalariesService.get_salaries('denver,co')

    expect(salary).to be_an(Array)
  end
end
