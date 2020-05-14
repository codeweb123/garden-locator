class GardenLocator::Garden

    @@all = []

    attr_accessor :name, :city, :garden_url, :overview
    
    def initialize(name, city, garden_url)
        @name = name
        @city = city
        @garden_url = garden_url
        @@all << self
    end

    def self.all
        @@all
    end

    def self.print_all_gardens
        @@all.each_with_index do |garden, index|
        puts "- Garden ##{index + 1} -".colorize(:green)
        puts "  Garden name: #{garden.name}"
        puts "  Garden city: #{garden.city}"
        puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        end
    end
end      