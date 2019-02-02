class BuildingPDF

  def self.create building
 
    report = Thinreports::Report.create do |r|

        building_contents = {building_name: "#{building.building_name}",building_place: "#{building.building_place}",building_yaer: "築#{building.building_year}年",
                        building_scale: "#{building.building_scale}",building_type: "#{building.building_type}",building_construction: "#{building.building_construction}"}
 
        building.parts.each do |part|
            part_contents = {condition: "#{part.cond}", treatment: "#{part.treat}", score: part.score, degraded_state: "現状",part_type: "#{part.part_type}"}
            r.start_new_page :layout => File.join('app', 'pdfs', 'toso_pdf.tlf') do |page|
                page.values(part_contents)
            end
        end

        r.start_new_page :layout => File.join('app', 'pdfs', 'result_pdf.tlf') do |last_page|
          @score = building.parts.group(:part_type).average(:score)
          @avarage_score = @score.values.sum/@score.keys.count

              g = Gruff::Spider.new(7, '445x295')
              g.font = "vendor/fonts/ipaexg.ttf"
              g.maximum_value = 6.0
              g.minimum_value = 0
              g.no_data_message = 'データがありません'
              @score.each do |key ,value|
                value = value.to_f
                g.data "#{key}", [value]
              end
              g.data "屋根" ,[7.0]
              g.theme_keynote
              g.bottom_margin = 80
              g.top_margin = 80
              g.legend_font_size = 35
              g.write(filename=File.expand_path("graphs/#{g.object_id}.png"))
              @gruff_img = {image: "graphs/#{g.object_id}.png"}
              last_page.values(@gruff_img)
        end
    end

    return report

  end


  # def gruff
  #   @score = building.parts.group(:part_type).average(:score)
  #   @avarage_score = @score.values.sum/@score.keys.count

  #   # r.start_new_page :layout => File.join('app', 'pdfs', 'result_pdf.tlf') do |page|
  #     @g = Gruff::Spider.new(7, '380x280')
  #     @g.font = "vendor/fonts/ipaexg.ttf"
  #     @g.maximum_value = 6.0
  #     @g.minimum_value = 0
  #     @g.no_data_message = 'データがありません'
  #     @score.each do |key ,value|
  #       value = value.to_f
  #       @g.data "#{key}", [value]
  #     end
  #     @g.data "屋根" ,[7.0]
  #     @g.theme_keynote
  #     @g.bottom_margin = 80
  #     @g.top_margin = 80
  #     @g.legend_font_size = 35
  #     @g.write(filename=File.expand_path("graphs/#{@g.object_id}.png"))
  #     image "graphs/#{@g.object_id}.png"
  #     #item(:image).src("graphs/#{g.object_id}.png")
  #     @gruff_img = {img: "graphs/#{@g.object_id}.png"}
  #     #return gruff_img
  #     last_page.values(@gruff_img)
  # end
end