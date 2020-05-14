# CLI runs all app logic that user sees: Command Line Interface
class GardenLocator::CLI

    attr_accessor :username

    def greet
        puts "                                             
FFFFFFFFFFFFFFFFFFFFFFLLLLLLLLLLL             
F::::::::::::::::::::FL:::::::::L             
F::::::::::::::::::::FL:::::::::L             
FF::::::FFFFFFFFF::::FLL:::::::LL             
  F:::::F       FFFFFF  L:::::L               
  F:::::F               L:::::L               
  F::::::FFFFFFFFFF     L:::::L               
  F:::::::::::::::F     L:::::L               
  F:::::::::::::::F     L:::::L               
  F::::::FFFFFFFFFF     L:::::L               
  F:::::F               L:::::L               
  F:::::F               L:::::L         LLLLLL
FF:::::::FF           LL:::::::LLLLLLLLL:::::L
F::::::::FF           L::::::::::::::::::::::L
F::::::::FF           L::::::::::::::::::::::L
FFFFFFFFFFF           LLLLLLLLLLLLLLLLLLLLLLLL".colorize(:light_blue)
        puts "
        ──▒▒▒▒▒▒▒▒───▒▒▒▒▒▒▒▒
        ─▒▐▒▐▒▒▒▒▌▒─▒▒▌▒▒▐▒▒▌▒
        ──▒▀▄█▒▄▀▒───▒▀▄▒▌▄▀▒
        ─────██─────────██
        ░░░▄▄██▄░░░░░░░▄██▄░░░ ".colorize(:light_green)
        puts ""
        puts "Hello there! Welcome to your FL Botanical Garden Locator!"
        puts ""
        puts "What's your name?".colorize(:light_blue)
        puts ""
        get_name
    end

    def get_name
        input = gets.chomp #returns just the name as a new string
        self.username = input #(input has become an instance variable) self refers to an instance variable, .username refers to the method created by the attr_reader that we can call anywhere in our program that creates an instance variable of @username. 
        puts ""
        puts "Welcome, #{self.username}!".colorize(:red)
        puts ""
        sleep(2)
        get_gardens
    end

    def get_gardens
        puts ""
        puts "Please wait a moment as we search for Florida's diverse and beautiful Botanical Gardens...".colorize(:blue)
        sleep(5)
        puts ""
        puts "Got them!" 
        sleep(2)
        puts ""
        puts ""
        sleep(3)
        GardenLocator::Garden.print_all_gardens
        choose_garden
    end

    def choose_garden
        puts "
        ──▒▒▒▒▒▒▒▒───▒▒▒▒▒▒▒▒
        ─▒▐▒▐▒▒▒▒▌▒─▒▒▌▒▒▐▒▒▌▒
        ──▒▀▄█▒▄▀▒───▒▀▄▒▌▄▀▒
        ─────██─────────██
        ░░░▄▄██▄░░░░░░░▄██▄░░░"
        puts ""
        puts "Choose a garden to see it's overview".colorize(:blue)
        puts ""
        puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        puts "Enter your number:".colorize(:red)
        puts ""
        get_user_garden
    end

    def get_user_garden
        input = gets.strip
        input.to_i <= GardenLocator::Garden.all.length
        garden = GardenLocator::Garden.all[input.to_i-1]
        get_user_garden_overview(garden)        
    end

    def get_user_garden_overview(garden)
        GardenLocator::Scraper.scrape_overview(garden)
        puts ""
        puts "#{garden.name}'s Overview:".colorize(:blue)
        puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        puts "#{garden.overview}"
        next_choice
    end

    def next_choice
        puts ""
        puts "If you're done, Type 'exit' to exit OR type 'start' to start again.".colorize(:red)
        puts ""
        input = gets.strip.downcase

        case input 
            when 'start'
                get_gardens
            when 'exit'
                goodbye
            else
                puts "Please try again."
        end
    end

    def goodbye
        puts ""
        puts "See you next time and enjoy visiting your Botanical Garden!".colorize(:blue)
    end

    def run
        system("clear")
        GardenLocator::Scraper.scrape_gardens
        greet
    end
end