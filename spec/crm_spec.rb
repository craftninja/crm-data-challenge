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

end
