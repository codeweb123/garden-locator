class GardenLocator::Scraper
    def self.scrape_gardens
        base_url = "https://www.tripadvisor.com/Attractions-g1591089-Activities-c57-t58-Central_Florida_Florida.html"
        html_to_elements = open(base_url).read 

        parsed_html_elements = Nokogiri::HTML.parse(html_to_elements)
        garden_elements = parsed_html_elements.css("div.component.gallery-view-all").text
        garden_elements.map do |element|
            name = element.css("div._6sUF3jUd a h2").text  
            binding.pry   
            review = element.css("div._3XWoDb5N a.CNLCVaiU span").text
            garden_url = element.css("div > a").attribute("href").value
            new_garden = Garden.new(name, review, garden_url)
            end 
    end

    def self.display_garden_list            
        GardenLocator::Garden.all.each.with_index(1) do |garden, index|
        puts "#{index}. #{garden.name}"
    end
    
    def self.scrape_details
        html_to_elements = open(self.garden_url).read 
        parsed_html_elements = Nokogiri::HTML.parse(html_to_elements)
        overview = element.css("div.attractions-attraction-review-atf-AttractionReviewATFLayout__atf_component--2Qflo.attractions-attraction-review-atf-AttractionReviewATFLayout__overview_container--1KJ-6").text.strip
        puts "#{self.overview}"
    end
end
end
