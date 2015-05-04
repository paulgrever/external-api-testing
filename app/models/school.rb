class School < OpenStruct

  def self.service
    @service ||= SchoolistService.new
  end

  def self.all 
    service.schools.map { |school| new(school) }
  end

  def self.find(id)
    new(service.school(id))
  end

  def self.create(params)
    new(service.create_school(params))
  end

  def self.update(id, params)
    service.update_school(id, params)
  end

  def self.destroy(id)
    service.destroy_school(id)
  end





# Open struct changes this from new to use open struct which is more flexible
  # def self.find(id)
  #   new(service.school(id))
  # end

   
  # def self.find(id)
  #   _build_object(service.school(id))
  # end
  #how to use ostruct if not declared

  # def self._build_object(data)
  #   OpenStruct.new(data)
  # end

  #end of osctruct but allows all below to be removed 
  # this changes  
  # attr_reader :uid, :id, :overweight_percentage, :obese_percentage

  # def initialize(data)
  #   @uid = data['uid']
  #   @id = data['id']
  #   @overweight_percentage = data['overweight_percentage']
  #   @obese_percentage = data['obese_percentage']
  # end

end