#class BuildingTestPDF < Thinreports::Report::Base
class BuildingTestPDF
  def initialize(building)
 
    report = Thinreports::Report.create do |r|

      # building_contents = {building_name: "#{building.building_name}",building_place: "#{building.building_place}",building_yaer: "築#{building.building_year}年",
      #                   building_scale: "#{building.building_scale}",building_type: "#{building.building_type}",building_construction: "#{building.building_construction}"}

   introduction(r, building)
   bodypart(r, building)
   conclusion(r, building)
 end
   return report
  end


  def introduction(r, building)
    building_contents_for_first_page = {building_name: "#{building.building_name}"}
      r.start_new_page :layout => File.join('app', 'pdfs', 'start_pdf.tlf') do |page|
        page.values(building_contents_for_first_page)
      end
      r.start_new_page :layout => File.join('app', 'pdfs', 'pdf_test.tlf') do |page|
        page.values(building_contents_for_first_page)
      end
  end


  def bodypart(r, building)
    building.parts.each do |part|
      #\r\nが改行
        cond = part.cond
        treat = part.treat
        if cond.include?("\r\n")
          cond.delete!("\r\n")
        end
        if treat.include?("\r\n")
          treat.delete!("\r\n")
        end

        part_contents = {condition: "#{cond}", treatment: "#{treat}", score: part.score, degraded_state: "現状",part_type: "#{part.part_type}"}

      if cond.length > 150 && cond.length < 210 && treat.length > 150 && treat.length < 210
        r.start_new_page :layout => File.join('app', 'pdfs', 'max_max',"max_max_#{part.score}.tlf") do |page|
          page.values(part_contents)
        end
      elsif cond.length > 150 && treat.length < 150 
        r.start_new_page :layout => File.join('app', 'pdfs', 'max_min','toso_pdf_max_min.tlf') do |page|
          page.values(part_contents)
        end
      elsif cond.length < 150 && treat.length > 150 
        r.start_new_page :layout => File.join('app', 'pdfs', 'min_max','toso_pdf_min_max.tlf') do |page|
          page.values(part_contents)
        end
      elsif  cond.length < 150 && cond.length > 90 &&  treat.length < 150 && treat.length > 90
        r.start_new_page :layout => File.join('app', 'pdfs', 'default','toso_pdf.tlf') do |page|
          page.values(part_contents)
        end
      elsif cond.length < 90 && treat.length < 90 
        r.start_new_page :layout => File.join('app', 'pdfs','min_min', 'toso_pdf_min_min.tlf') do |page|
          page.values(part_contents)
        end
      end
    end
  end

  def conclusion(r, building)
    if building.parts.group(:part_type).average(:score).keys.count > 2
        r.start_new_page :layout => File.join('app', 'pdfs', 'result_pdf.tlf') do |last_page|
          @score = building.parts.group(:part_type).average(:score)
          @avarage_score = @score.values.sum/@score.keys.count
            #グラフの作成
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
  end

end

