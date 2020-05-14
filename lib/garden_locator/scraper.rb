
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