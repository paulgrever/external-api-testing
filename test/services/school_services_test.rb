require 'test_helper'

class SchoolistServiceTest < ActiveSupport::TestCase

  test '#schools' do
    schools = SchoolistService.new.schools
    first_school = schools.first
    assert_equal 2, first_school['id']
    assert_equal "17.2", first_school['overweight_percentage']
    assert_equal "25.4", first_school['obese_percentage']
    assert_equal 1, first_school['county_id']
  end
end

{"id"=>2,
 "uid"=>"010500",
 "overweight_percentage"=>"17.2",
 "obese_percentage"=>"25.4",
 "county_id"=>1,
 "created_at"=>"2015-04-29T15:05:35.097Z",
 "updated_at"=>"2015-04-29T15:05:35.097Z"}