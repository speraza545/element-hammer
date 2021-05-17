module FactionHelper
    def faction_logo(faction)
        if faction.name == "fire" 
            image_tag("fire.png")
        elsif faction.name == "water" 
            image_tag("water.png")
        elsif faction.name == "earth" 
            image_tag("earth.png")
        else 
            "No Image"
        end 
    end
end