class Zoo
    attr_accessor :name, :location

    @@all = []

    def initialize(name, location)
        @name = name
        @location = location
        self.class.all << self
    end

    def animals
        Animal.all.select { |animal| animal.zoo == self }
    end

    def animal_species
        animals.map { |animal| animal.species }.uniq
    end

    def find_by_species(species)
        animals.select { |animal| animal.species == species }
    end

    def add_animal(animal)
        animal.zoo = self
    end

    def animal_nicknames
        animals.map { |animal| animal.nickname }
    end

    def self.find_by_location(location)
        self.all.select { |zoo| zoo.location == location }
    end

    def self.all
        @@all
    end
end
