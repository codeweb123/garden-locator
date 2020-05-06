# CLI Controller
class GardenLocator::CLI

    def call
        puts "Welcome to your Botanical and Arboretum Locator!"
        puts "Enter your state:"
        get_state
        menu
        goodbye
    end

    def get_state
        @states = GardenLocator::State.all
    end 

    def menu
        puts "Enter your selection or type list for options or type exit:"
        input = nil
        while input != "exit"   
            input = gets.strip.downcase
                case input
                    when "1"
                        puts "Please type your state:"
                    when "2"
                        puts "Alabama, Alaska, Arizona, Arkansas, California, Colorado, Connecticut, Delaware, Florida, Georgia, Hawaii, Idaho, Illinois, Indiana, Iowa, Kansas, Kentucky, Louisiana, Maine, Maryland, Massachusetts, Michigan, Minnesota, Mississippi, Missouri, Montana, Nebraska, Nevada, New Hampshire, New Jersey, New Mexico, New York, North Carolina, North Dakota, Ohio, Oklahoma, Oregon, Pennsylvania, Rhode Island, South Carolina, South Dakota, Tennessee, Texas, Utah, Vermont, Virginia, Washington, West Virginia, Wisconsin, Wyoming"
                        puts "Please type your state:"
                    when "3"
                        puts "A botanical garden or botanic garden[nb 1] is a garden dedicated to the collection, cultivation, preservation and display of a wide range of plants labelled with their botanical names. It may contain specialist plant collections such as cacti and other succulent plants, herb gardens, plants from particular parts of the world, and so on; there may be greenhouses, shadehouses, again with special collections such as tropical plants, alpine plants, or other exotic plants. Visitor services at a botanical garden might include tours, educational displays, art exhibitions, book rooms, open-air theatrical and musical performances, and other entertainment. Botanical gardens are often run by universities or other scientific research organizations, and often have associated herbaria and research programmes in plant taxonomy or some other aspect of botanical science. In principle, their role is to maintain documented collections of living plants for the purposes of scientific research, conservation, display, and education, although this will depend on the resources available and the special interests pursued at each particular garden."
                    when "4"
                        goodbye
                    when "list"
                        welcome_garden
                    else
                        puts "Not sure what you want, type list or exit." 
                    end
                end
            end

    def goodbye
        puts "See you next time!"
    end
end
