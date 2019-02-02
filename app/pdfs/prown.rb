require "prawn"
class BuildingPDF < Prawn::Document

  def initialize(building)
    super()
    font "vendor/fonts/ipaexm.ttf"
    @building = building
    @parts = @building.parts
    @score = @building.parts.group(:part_type).average(:score)
    @avarage_score = @score.values.sum/@score.keys.count
    toso
    fill_color "000000"
    start_new_page
    title
    start_new_page
    # introduction

    # @parts.each do |part|
    #   stroke_axis
    #   part(part)
    #   start_new_page
    # end
    #診断結果
    conclusion

  end


  def title
    font_size 15
    formatted_text [
                         { text: @building.building_name, color: "4AAED8" },
                         { text: " さんの英会話" },
                         { text: "　（レッスン日: 2079/9/12", size: 9 }
                       ]
    move_down 10
    self
  end

  def toso
  bounding_box([0,750], :width => 200, :height => 300) do
    stroke_color 'FFFF00'
    fill_color "4dd2ff"
    stroke_bounds
    text_box "Firma Conducente ________  Firma Cessionario _____", 
          :size => 10, :at=> [50,700], :width => 90, :height => 70 
  end
  end
  def conclusion_title
    text_first_data = [["診断結果"]]
    table text_first_data do
      cells.padding = 5
      cells.borders = [:top,:bottom,:right,:left]
      cells.border_width = 1.2

      row(0).align = :center
      row(0).size = 30
      row(0).background_color = "4dd2ff"
      row(0).heigh = 35
      self.column_widths = [540]
    end
  end

  def conclusion_scores_of_each_point_rows
    data = [["建物の部位","点数(7点中)"]]
    @score.each do |key, value|
      data << ["#{key}",value.to_f.round(1)]
    end
    data << ["屋根", 7]
    data << ["総合評価",@avarage_score.to_f.round(1)]
    return data
  end

  def conclusion_table_content
    # tableメソッドは2次元配列を引数(line_item_rows)にとり、それをテーブルとして表示する
    # ブロック(do...end)内でテーブルの書式の設定をしている
    table conclusion_scores_of_each_point_rows do
      # 全体設定
      cells.padding = 6          # セルのpadding幅
      cells.borders = [:top,:bottom,:right,:left] # 表示するボーダーの向き(top, bottom, right, leftがある)
      cells.border_width = 1.2 # ボーダーの太さ
      cells.size = 15 
      cells.align = :center
      # 個別設定
      # row(0) は0行目、row(-1) は最後の行を表す
      row(0).align = :center
      row(-1).background_color = "4dd2ff"
      row(0).background_color = "33ccff"
      row(-1).borders = []
      self.header     = true  # 1行目をヘッダーとするか否か
      self.row_colors = ['dddddd', 'ffffff'] # 列の色
      self.column_widths = [270, 270] # 列の幅
    end
    move_down 10
  end

  def conclusion_text
    text_data = 'このボックスの使い勝手はかなりいいですね'* 7
    text_test_data = '外壁はチョーキング現象が発生し、劣化の進行が顕著である為、早急な修繕が必要な状態です。
    鉄部は塗装の劣化だけでなく、錆の発生も著しい為、早急な修繕が必要な状態です。屋根は所々に塗膜の劣化􏰀コケの発生が見られる為、修繕をお奨め致します。' 
    data = [["総評"],["#{text_test_data}"]]
    table data do 
      cells.padding = 10
      cells.borders = [:top,:bottom,:right,:left]
      cells.border_width = 1.2

      row(0).align = :center
      row(0).size = 25
      row(1).size = 18
      row(0).background_color = "d9d9d9"
      row(0).heigh = 20
      #row(1).kerning = 10
      #row(1).character_spacing = 2.5
      row(1).height = 120
      self.column_widths = [540]
    end
  end

  def conclusion
     #stroke_axis
      conclusion_title

      move_down 3
      text "♦#{@building.building_name}さんの診断結果です。♦",:align => :center,:character_spacing => 1.2
      move_down 2
      text "♦点数は７点に近いほど補修の必要があると判断された結果です。♦",:align => :center,:character_spacing => 1.2
      move_down 2
      text "♦複数の診断を行った部位につきましては、その部位における平均点を記載しております。♦",:align => :center,:character_spacing => 0.8
      move_down 5

      conclusion_table_content
      
      #if @building.parts.group(:part_type).average(:score).to_a.count >= 3
      #part_typeは最低でも3つ以上ないとグラフを作成できない
      g = Gruff::Spider.new(7, '380x280')
      # タイトル
      #g.title = '部位ごとの点数'
      g.font = "vendor/fonts/ipaexg.ttf"
      g.maximum_value = 6.0
      g.minimum_value = 0
      g.no_data_message = 'データがありません'
      @score.each do |key ,value|
        value = value.to_f
        g.data "#{key}", [value]
      end
      # g.data "壁10", [5.5]
      # g.data "壁10", [6.5]
      # g.data "壁10", [5.5]
      # g.data "壁10", [4.5]
      g.data "屋根" ,[7.0]
      g.theme_keynote
      g.bottom_margin = 80
      g.top_margin = 80
      #g.title_font_size = 70
      g.legend_font_size = 35
        g.write(filename=File.expand_path("graphs/#{g.object_id}.png"))
      bounding_box([75, 465], width: 400, height: 300) do
        image "graphs/#{g.object_id}.png"
      end
    # else
    # end
     #総評
     conclusion_text
  end


  def part(part)
    #stroke_rectangle [左端からの距離,下からの距離],width, height
    define_grid(:columns => 12, :rows => 8, :gutter => 10)
    stroke_color 50, 100, 0, 0
    #左
    stroke_rectangle [0, 170], 265, 170
    #右
    stroke_rectangle [276, 170], 265, 170

    # grid([7, 0], [7, 5]).bounding_box do
    #   #grid([7, 0], [6, 5]).show
    #   #fill_color "FFFFCC"
    #   #text "#{part.cond}"
    # end
    # grid([7, 6], [7, 11]).bounding_box do
    #   #grid([7, 6], [6, 11]).show
    #   #fill_color "FFFFCC"
    #   #text "#{part.treat}"
    # end
  end






end




