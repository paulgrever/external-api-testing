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

  test '#school' do 
    VCR.use_cassette("schoolist_service_school") do 
      school = SchoolistService.new.school(2)
      assert_equal 2, school['id']
      assert_equal "17.2", school['overweight_percentage']
      assert_equal "25.4", school['obese_percentage']
      assert_equal 1, school['county_id']
    end
  end

  test '#create_school' do 
    VCR.use_cassette("schoolist_service_create_school") do
      school_params = { school: {uid: "1", overweight_percentage: "1", obese_percentage: "1"}}
      school = SchoolistService.new.create_school(school_params)
      assert_equal '1', school['uid']
      assert_equal '1.0', school['overweight_percentage']
      assert_equal '1.0', school['obese_percentage']

      SchoolistService.new.destroy_school(school['uid'])
    end
  end




end

