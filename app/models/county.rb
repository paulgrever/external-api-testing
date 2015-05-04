class County < OpenStruct


  def self.service
    @service ||= SchoolistService.new
  end

  def self.all
    service.counties.map { |county| new(county)}
  end

   def self.find(id)
    new(service.county(id))
  end
end