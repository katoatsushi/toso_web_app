class BuildingPDF < Prawn::Document
  def initialize(building)
    super()

    font "vendor/fonts/ipaexm.ttf"
    @building = building
    @parts = @building.parts

    # @score = building.parts.group(:part_type).average(:score) 
    #   @score.each do |key ,value|
    #     text "#{key} と　#{value}"
    #   end
    #ここまで
   
define_grid(:columns => 12, :rows => 8, :gutter => 10)

grid([7, 0], [7, 5]).show
# grid([7, 6], [6, 11]).show

    @parts.each do |part|
      #補助
      stroke_axis
      part(part)
      start_new_page
    end


   #if @building.parts.group(:part_type).average(:score).to_a.count >= 3
    #part_typeは最低でも3つ以上ないとグラフを作成できない
    #グラフの作成
      text "部位ごとの点数"
      spider_graph_report(@building)
    #else
    #end

    start_new_page
    spider

end

def introduction
end

def spider
g = Gruff::Spider.new(100, 640)
# タイトル
g.title = 'ゆうしゃ'
# 使うフォント
#g.font = File.expand_path('artwork/fonts/meiryo.ttc', RAILS_ROOT)
g.font = "vendor/fonts/ipaexg.ttf"
# グラフの目盛りの最大値
g.maximum_value = 1000
# グラフの目盛りの最小値
g.minimum_value = 0
# データが無いときの表示メッセージ
g.no_data_message = 'データがないよ。'
# データ
g.data 'ちから', [70]
g.data 'すばやさ', [40]
g.data 'たいりょく', [80]
g.data 'かしこさ', [20]
g.data 'うんのよさ', [30]
# 37signalsっぽくする
g.theme_37signals
# ファイルとして置く
g.write(filename=File.expand_path('graphs/status.png'))
image 'graphs/status.png'
# クライアントに投げつける
# send_data(g.to_blob,
# :disposition => 'inline',
# :type => 'image/png',
# :filename => 'bart_scores.png')
end

def spider_graph_report(building)
  #参考に
  #https://d.conma.me/entry/20081011/1223736412
    stroke_axis
    #平均点をハッシュで返す
    @score = building.parts.group(:part_type).average(:score)
    g = Gruff::Spider.new(7, '535x400')
    # タイトル
    g.title = '部位ごとの点数'
    # 使うフォント
    #g.font = File.expand_path('artwork/fonts/meiryo.ttc', RAILS_ROOT)
    g.font = "vendor/fonts/ipaexg.ttf"
    # グラフの目盛りの最大値
    g.maximum_value = 6.0
    # グラフの目盛りの最小値
    g.minimum_value = 0
    g.no_data_message = 'データがありません'
    @score.each do |key ,value|
      value = value.to_f
      g.data "#{key}", [value]
    end
    g.data "壁2", [5.5]
    g.data "壁2", [6.5]
    g.data "壁2", [5.5]
    g.data "壁2", [4.5]
    g.data "壁2", [5.5]
    g.data "床2", [2.0]

    # g.theme = {
    #   :colors => ['black', 'grey'],
    #   :marker_color => 'grey',
    #   :font_color => 'black',
    #   :background_colors => 'transparent'
    # }

    #g.theme_rails_keynote
    g.theme_keynote

    g.bottom_margin = 100
    g.top_margin = 50
    #g.title_font_size = 70
    g.legend_font_size = 35

    # marker_font_size
    # title_font_size グラフのタイトルのフォントサイズ
    # legend_font_size  凡例のフォントサイズ
    # legend_box_size 凡例のサイズ

    #ファイルとして置く
    #g.write(filename=File.expand_path('graphs/status.png', RAILS_ROOT))

    # うまくいかなかったらこっちで
    # #g.write("tankyou#{g.object_id}.png")
    # #image "tankyou#{g.object_id}.png"
    # 画像の表示

    #graphsフォルダ配下に画像を保存
    g.write(filename=File.expand_path("graphs/#{g.object_id}.png"))
    image "graphs/#{g.object_id}.png"
end

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





def gruff(building)
  text "#{building.building_name}"
# id = building.id
    @g = Gruff::Line.new(450)
    @g.title = "#{building.building_name}"
    @g.theme = {
      :colors => ['black', 'grey'],
      :marker_color => 'grey',
      :font_color => 'black',
      :background_colors => 'transparent'
    }
    @g.labels = {
      0 => '5/6',
      1 => '5/15',
      2 => '5/24',
      3 => DateTime.now,
    }
    @g.data(:apples, [-1, 0, 4, -4])
    @g.data(:peaches, [10, 8, 6, 3])
    #binding.pry
    @g.write("#{building.id}.png")
    image "#{building.id}.png"
    # g.write
    # image g.write
    # image g

end






end




