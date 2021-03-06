require 'test_helper'

class SchoolistServiceTest < ActiveSupport::TestCase
  attr_reader :service
  def setup
    @service = SchoolistService.new
  end

  test '#schools' do
    VCR.use_cassette("schoolist_service_schools") do 
      schools = service.schools
      first_school = schools.first
      assert_equal 2, first_school['id']
      assert_equal "17.2", first_school['overweight_percentage']
      assert_equal "25.4", first_school['obese_percentage']
      assert_equal 1, first_school['county_id']
    end
  end

  test '#school' do 
    VCR.use_cassette("schoolist_service_school") do 
      school = service.school(2)
      assert_equal 2, school['id']
      assert_equal "17.2", school['overweight_percentage']
      assert_equal "25.4", school['obese_percentage']
      assert_equal 1, school['county_id']
    end
  end

  test '#create_school' do 
    VCR.use_cassette("schoolist_service_create_school") do
      school_params = { school: {uid: "1", overweight_percentage: "1", obese_percentage: "1"}}
      school = ""
      assert_difference("service.schools.count", 1) do 
        school = service.create_school(school_params)
      end
      assert_equal '1', school['uid']
      assert_equal '1.0', school['overweight_percentage']
      assert_equal '1.0', school['obese_percentage']
      service.destroy_school(school['uid'])
    end
  end

  test '#update_school' do 
    VCR.use_cassette("schoolist_service_update_school") do 
      original_params = { school: {uid: "1", overweight_percentage: "1", obese_percentage: "1"}}
      original_school = service.create_school(original_params)
      updated_params = { school: {uid: "2", overweight_percentage: "2", obese_percentage: "2"}}
      service.update_school(original_school['id'], updated_params)
      updated_school = service.school(original_school['id'])

      refute_equal original_school, updated_school
      assert_equal '2', updated_school['uid']
      assert_equal '2.0', updated_school['overweight_percentage']
      assert_equal '2.0', updated_school['obese_percentage']
      service.destroy_school(original_school['id'])
    end
  end
end

