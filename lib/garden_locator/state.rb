class GardenLocator::State
    attr_accessor :name, :gardens
    @@all = []

    def initialize(name)
        @name = name
        @gardens = []
        save
    end

end