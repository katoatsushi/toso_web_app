require "prawn"
class BuildingPDF < Prawn::Document

  def initialize(building)
    super()


    font "vendor/fonts/ipaexm.ttf"


    @building = building
    @parts = @building.parts
    @score = @building.parts.group(:part_type).average(:score)
    @avarage_score = @score.values.sum/@score.keys.count

    #診断結果
    conclusion

    @parts.each do |part|
      #補助
      stroke_axis
      part(part)
      start_new_page
    end
end


def conclusion_scores_of_each_point_rows
  data = [["建物の部位","点数(7点中)"]]
  @score.each do |key, value|
    data << ["#{key}",value.to_f]
  end
  data << ["屋根", 4]
  data << ["総合評価",@avarage_score.to_f.round(1)]
  return data
end

#部位ごとの点数
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
  text_data = 'このボックスの使い勝手はかなりいいですね' * 7
  data = [["総評"],["#{text_data}"]]
  table data do 
    cells.padding = 10
    cells.borders = [:top,:bottom,:right,:left]
    cells.border_width = 1.2

    row(0).align = :center
    row(0).size = 25
    row(1).size = 18
    row(0).background_color = "d9d9d9"
    row(0).heigh = 35
    row(1).height = 120
    self.column_widths = [540]
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

def conclusion
conclusion_first
    #text "診断結果",:align => :center, :size => 35 

    move_down 3
    text "♦#{@building.building_name}の診断結果です。♦",:align => :center
    move_down 2
    text "♦点数は７点に近いほど補修の必要があると判断された結果です。♦",:align => :center
    text "♦複数の診断を行った部位につきましては、その部位における平均点を記載しております。♦",:align => :center
    move_down 10

    table_content
    
    stroke_axis
    #平均点をハッシュで返す
    #@score = building.parts.group(:part_type).average(:score)
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
    g.data "壁10", [5.5]
    g.data "壁10", [6.5]
    g.data "壁10", [5.5]
    g.data "壁10", [4.5]
    g.theme_keynote
    g.bottom_margin = 80
    g.top_margin = 80
    #g.title_font_size = 70
    g.legend_font_size = 35
       g.write(filename=File.expand_path("graphs/#{g.object_id}.png"))
    bounding_box([75, 466], width: 400, height: 300) do
        image "graphs/#{g.object_id}.png"
    end
  # else
  # end
   #総評
   conclusion_text

    start_new_page
end

def test_for_tables
end



# def spider_graph_report(building)
#   #参考に
#   #https://d.conma.me/entry/20081011/1223736412
#     stroke_axis
#     #平均点をハッシュで返す
#     @score = building.parts.group(:part_type).average(:score)
#     g = Gruff::Spider.new(7, '535x400')
#     # タイトル
#     #g.title = '部位ごとの点数'
#     # 使うフォント
#     #g.font = File.expand_path('artwork/fonts/meiryo.ttc', RAILS_ROOT)
#     g.font = "vendor/fonts/ipaexg.ttf"
#     # グラフの目盛りの最大値
#     g.maximum_value = 6.0
#     # グラフの目盛りの最小値
#     g.minimum_value = 0
#     g.no_data_message = 'データがありません'
#     @score.each do |key ,value|
#       value = value.to_f
#       g.data "#{key}", [value]
#     end
#     g.data "壁10", [5.5]
#     g.data "壁10", [6.5]
#     g.data "壁10", [5.5]
#     g.data "壁10", [4.5]

#     # g.theme = {
#     #   :colors => ['black', 'grey'],
#     #   :marker_color => 'grey',
#     #   :font_color => 'black',
#     #   :background_colors => 'transparent'
#     # }

#     #g.theme_rails_keynote
#     g.theme_keynote

#     # g.theme_37signals
#     # g.theme_greyscale
#     # g.theme_keynote
#     # g.theme_odeo
#     # g.theme_pastel
#     #g.theme_rails_keynote

#     g.bottom_margin = 80
#     g.top_margin = 60
#     #g.title_font_size = 70
#     g.legend_font_size = 35
#     # marker_font_size
#     # title_font_size グラフのタイトルのフォントサイズ
#     # legend_font_size  凡例のフォントサイズ
#     # legend_box_size 凡例のサイズ

#     #ファイルとして置く
#     #g.write(filename=File.expand_path('graphs/status.png', RAILS_ROOT))

#     # うまくいかなかったらこっちで
#     # #g.write("tankyou#{g.object_id}.png")
#     # #image "tankyou#{g.object_id}.png"
#     # 画像の表示

#     #graphsフォルダ配下に画像を保存
#     g.write(filename=File.expand_path("graphs/#{g.object_id}.png"))
#     image "graphs/#{g.object_id}.png"
# end


# end

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




