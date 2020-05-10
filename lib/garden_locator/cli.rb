# CLI Controller
class GardenLocator::CLI

    def call
        puts "Welcome to your Central Florida Garden Locator!"
        puts ""

        input = nil
        while input != "exit"
            get_gardens
            Garden.print_all_gardens
            display_garden_list
            list_gardens
            get_user_garden
            next_choice
        end
        goodbye
    end

    def get_gardens
        puts "We're about to scrape the gardens..."
        GardenLocator::Scraper.scrape_gardens
        puts "Got them!" 
    end

    def list_gardens
        puts "Choose a garden to see it's review:"
        puts ""
        puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        puts "Enter your number:"
        puts ""
        get_user_garden
    end

    def get_user_garden
        input = gets.strip
        input.to_i <= GardenLocator::Garden.all.size
        garden = GardenLocator::Garden.all[input.to_i-1]
        puts garden.scrape_details 
    end
    
    def next_choice
        puts "Type 'exit' to exit"
        input = gets.strip
    end

    def goodbye
        puts "See you next time and enjoy visiting your Botanical Garden!"
    end
end

