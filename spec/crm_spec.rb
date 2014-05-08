require 'spec_helper'
require_relative '../lib/crm'
require_relative '../lib/test_data'

describe 'returns properly munged data structures' do

  it 'returns a data structure: list of companies with associated employees' do
    crm = Crm.new
    actual = crm.employees_of_companies
    expected =
      [
        {:name => "Nicolas and Sons",
         :employees => []
        },
        {:name => "Mueller LLC",
         :employees => [
           {
             :id => 1,
             :first_name => "Whitney",
             :last_name => "Domenic",
             :title => "Regional Applications Designer"
           },
           {
             :id => 2,
             :first_name => "Savannah",
             :last_name => "Clementina",
             :title => "Chief Communications Consultant"
           }
         ]
        },
        {:name => "Mohr, King and Gleason",
         :employees => []
        },
        {:name => "Grimes Inc",
         :employees => [
           {
             :id => 1,
             :first_name => "Whitney",
             :last_name => "Domenic",
             :title => "Internal Mobility Executive"
           }
         ]
        }
      ]

    expect(actual).to eq(expected)
  end

  it 'returns new data structure: list of all employments and details' do
    crm = Crm.new
    actual= crm.employments
    expected = [
      {
        :company_id=>1,
        :company_name=>"Mueller LLC",
        :person_id=>1,
        :person_first_name=>"Whitney",
        :person_last_name=>"Domenic",
        :title=>"Regional Applications Designer"
      },
      {
        :company_id=>3,
        :company_name=>"Grimes Inc",
        :person_id=>1,
        :person_first_name=>"Whitney",
        :person_last_name=>"Domenic",
        :title=>"Internal Mobility Executive"
      },
      {
        :company_id=>1,
        :company_name=>"Mueller LLC",
        :person_id=>2,
        :person_first_name=>"Savannah",
        :person_last_name=>"Clementina",
        :title=>"Chief Communications Consultant"
      }
    ]
    expect(actual).to eq(expected)
  end

  it 'returns new data structure: list of all people with no work history' do
    crm = Crm.new
    actual = crm.no_work_history
    expected = [
      {:id=>3,
       :first_name=>"Elyse",
       :last_name=>"Jensen"}
    ]
    expect(actual).to eq(expected)
  end

end
