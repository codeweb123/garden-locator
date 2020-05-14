
class GardenLocator::Scraper
    def self.scrape_gardens
        url = "https://en.wikipedia.org/wiki/List_of_botanical_gardens_and_arboretums_in_Florida"
        html_to_elements = open(url)
        parsed_html_elements = Nokogiri::HTML(html_to_elements)
        garden_elements = parsed_html_elements.css("div table.sortable tr")[1..]
        garden_elements.map do |element|
            if element != garden_elements[11]
                name = element.css("td > a").attribute("title").value
                city = element.css("td:nth-child(4) > a").attribute("title").value
                garden_url = element.css("td > a").attribute("href").value
                GardenLocator::Garden.new(name, city, garden_url)
            end
        end 
    end 

    def self.scrape_overview(garden)
        html_to_elements = open("https://en.wikipedia.org" + "#{garden.garden_url}")
        parsed_html_elements = Nokogiri::HTML(html_to_elements)
        garden_elements = parsed_html_elements.css("div.mw-parser-output")
        #binding.pry
        garden_elements.map do |element|
        #binding.pry
            if element != garden_elements[11] 
                info = element.css("p").first.text.strip
                #binding.pry
                garden.overview = info
            end 
        end
        garden
    #binding.pry
    end
end










            #name = element.css("tr td:nth-of-type(1)").text
            #garden = Garden.find_or_create_by(garden_name)
            #city = element.css("tr td:nth-of-type(4)").text
            #city = City.new(city_name)

        #overview = element.css(" ").text.strip
        #puts "#{self.overview}"


    #class GardenLocator::Scraper
#    def self.scrape_gardens
#        url = "https://en.wikipedia.org/wiki/List_of_botanical_gardens_and_arboretums_in_Florida"
#        html_to_elements = open(url)
#        parsed_html_elements = Nokogiri::HTML(html_to_elements)
#        garden_elements = parsed_html_elements.css("tbody")
#        garden_elements.map do |element|
#            name = element.css("tr td:nth-of-type(1)").text
            #garden = Garden.find_or_create_by(garden_name)
#            city = element.css("tr td:nth-of-type(4)").text
            #city = City.new(city_name)
#            garden_url = element.css("a").first.attr("href")
            #("td:first-child:not(.deprecated)")
            #("tr td:nth-of-type(1) a")[0]["href"]
 #           binding.pry
#            new_garden = GardenLocator::Garden.new(name, city, garden_url)
#        end 
#    end

#garden_elements.each do |element|
#    name = element.css("td:nth-child(2) > a").attribute("title").value
#    city = element.css("td:nth-child(3) > a").attribute("title").value
#    garden_url = element.css("td:nth-child(2) > a").attribute("href").value
#    new_garden = GardenLocator::Garden.new
#    new_garden.name = name
#    new_garden.city = city
#    new_garden.garden_url = garden_url
#    GardenLocator::Garden.all << new_garden 