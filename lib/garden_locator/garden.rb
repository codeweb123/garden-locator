class GardenLocator::Garden

    @@all = []

    attr_accessor :name, :review, :overview, :garden_url
    
    def initialize(name, review)
        @name = name
        @review = review
        @overview = []
        add_gardens
        save
    end

    def self.all
        @@all
    end

    def add_gardens
        GardenLocator::Scraper.scrape_gardens << self
        @@all
    end

    def self.print_all_gardens
        @@all.each_with_index do |garden, index|
            puts "== Garden ##{index + 1} =="
            puts "Garden name: " + garden.name
            puts "Garden review: " + garden.review
            puts "======================"
    end

    def save
        @@all << self
    end
end
end


       