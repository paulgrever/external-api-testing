require 'test_helper'

class SchoolistServiceTest < ActiveSupport::TestCase

  test '#schools' do
    VCR.use_cassette("schoolist_service_schools") do 
      schools = SchoolistService.new.schools
      first_school = schools.first
      assert_equal 2, first_school['id']
      assert_equal "17.2", first_school['overweight_percentage']
      assert_equal "25.4", first_school['obese_percentage']
      assert_equal 1, first_school['county_id']
    end
  end

  
end

