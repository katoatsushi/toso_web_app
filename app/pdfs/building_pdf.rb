class BuildingPDF

  require "fileutils"

  def self.create building
    # #1日以上前のグラフの写真がある場合、新しいPDFを作成するときに自動的に古いPDFを削除する
     Dir.glob("#{Rails.root}/app/assets/images/*").each do |file_name|
        file_path = file_name.split("_")
        if Rails.env == 'development'
          @file_date = file_path[2].to_time
        elsif Rails.env == 'production'
          @file_date = file_path[1].to_time
        end
        if Time.now - @file_date > 10
          FileUtils.rm(file_name)
        end
    end
    #ここまで

    report = Thinreports::Report.create do |r|

        building_contents_for_first_page = {building_name: "#{building.building_name}"}
        r.start_new_page :layout => File.join('app', 'pdfs', 'pdf_test.tlf') do |page|
          page.values(building_contents_for_first_page)
        end


      building_contents = {building_name: "#{building.building_name}",building_place: "#{building.building_place}",building_year: "築#{building.building_year}年",
                        building_scale: "#{building.building_scale}",building_type: "#{building.building_type}",building_construction: "#{building.building_construction}"}
      @reform_contents = {}

      @num = 0
  
      building.reforms.each do |f|
        @num += 1
        contents = {"reform_part_#{@num}":"#{f.reform_part}", "reform_material_#{@num}":"#{f.reform_material}", "reform_fin_mate_#{@num}":"#{f.reform_working_out}"}.symbolize_keys
        @reform_contents.merge!(contents)
      end
      intro_contents = @reform_contents.merge!(building_contents)
      r.start_new_page :layout => File.join('app', 'pdfs', 'intro_pdf.tlf') do |page|
        page.values(intro_contents)
      end

      building.parts.each do |part|
        cond = part.cond
        treat = part.treat
        if cond.include?("\r\n")
          cond.delete!("\r\n")
        end
        if treat.include?("\r\n")
          treat.delete!("\r\n")
        end

        part_contents = {condition: "#{cond}", treatment: "#{treat}", score: part.score, degraded_state: "現状",part_type: "#{part.part_type}"}
        if cond.length > 150 && treat.length > 150
          r.start_new_page :layout => File.join('app', 'pdfs', 'max_max',"max_max_#{part.score}.tlf") do |page|
            page.values(part_contents)
          end
        elsif cond.length <= 90 && treat.length <= 90 
          r.start_new_page :layout => File.join('app', 'pdfs','min_min', "min_min_#{part.score}.tlf") do |page|
            page.values(part_contents)
            #page.values(part_test_contents)
        end
        elsif cond.length > 150 && treat.length <= 150 
          r.start_new_page :layout => File.join('app', 'pdfs', 'max_min',"max_min_#{part.score}.tlf") do |page|
            page.values(part_contents)
          end
        elsif cond.length <= 150 && treat.length > 150 
          r.start_new_page :layout => File.join('app', 'pdfs', 'min_max',"min_max_#{part.score}.tlf") do |page|
            page.values(part_contents)
          end
        elsif  cond.length <= 150  &&  treat.length <= 150 
          r.start_new_page :layout => File.join('app', 'pdfs', 'default',"default_#{part.score}.tlf") do |page|
            page.values(part_contents)
          end
        end
      end
      #資料をまだ追加してないとき、資料のタイプが３つ未満の場合グラフを作成できないので、グラフ作成できない
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

          # file_name = "#{Rails.root}/public/images/buildingGraph_" + Time.now.to_s + "_"+ g.object_id.to_s + ".png"
          file_name = "#{Rails.root}/app/assets/images/buildingGraph_" + Time.now.to_s + "_"+ g.object_id.to_s + ".png"
          #{Rails.root}/app/assets/images/
          g.write(file_name)
          @gruff_img = {image: file_name}
          last_page.values(@gruff_img)

        end
      end
    end
    return report
  end


end

