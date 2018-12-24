#https://qiita.com/takashisite/items/9d1484b88708e2872134
#参考にする

# User.create(:name=>"山田　太郎",:email=>"test1@gmail.com",:password=>"111111")
# User.create(:name=>"井上　花子",:email=>"test2@gmail.com",:password=>"222222")
# User.create(:name=>"安倍　晋三",:email=>"test3@gmail.com",:password=>"333333")

# Building.create(:building_name=>"ライオンズマンション2号棟",:user_id=>"1")
# Building.create(:building_name=>"サンヴァリエンエ日吉",:user_id=>"1")
# Building.create(:building_name=>"四軒家",:user_id=>"2")

# 100.times do |index|
#   Building.create(:building_name=>"テスト",:user_id=>"1")
# end

#Mainpartのseed
Mainpart.create(mp_name: "外壁")
#ここまで
#Materialのseed
Material.create(mate_name: "塗装" ,mainpart_id: 1)
Material.create(mate_name: "タイル",mainpart_id: 1)
Material.create(mate_name: "パネル",mainpart_id: 1)

Mainpart.create(mp_name: "内壁")
Material.create(mate_name: "塗装(内壁)" ,mainpart_id: 2)
Material.create(mate_name: "タイル(内壁)",mainpart_id: 2)
Material.create(mate_name: "パネル(内壁)",mainpart_id: 2)

Mainpart.create(mp_name: "屋根")
Material.create(mate_name: "塗装(屋根)" ,mainpart_id: 3)
Material.create(mate_name: "タイル(屋根)",mainpart_id: 3)
Material.create(mate_name: "パネル(屋根)",mainpart_id: 3)
#ここまで

Symptom.create(s_name: "ひび割れ", material_id: 2, mainpart_id: 1)
Symptom.create(s_name: "剥がれ", material_id: 2, mainpart_id: 1)
Symptom.create(s_name: "色褪せ", material_id: 2, mainpart_id: 1)
Symptom.create(s_name: "ひび割れ", material_id: 2, mainpart_id: 2)
Symptom.create(s_name: "剥がれ", material_id: 2, mainpart_id: 2)
Symptom.create(s_name: "色褪せ", material_id: 2, mainpart_id: 2)
Symptom.create(s_name: "ひび割れ", material_id: 2, mainpart_id: 3)
Symptom.create(s_name: "剥がれ", material_id: 2, mainpart_id: 3)
Symptom.create(s_name: "色褪せ", material_id: 2, mainpart_id: 3)

Detail.create(detail_name: "ひび割れ①",condition: "ひどいひび割れ①です",treatment: "ひび①修理します", mainpart_id: 1, material_id: 2, symptom_id: 1 ,detail_type: "壁")
Detail.create(detail_name: "ひび割れ②",condition: "ひどいひび割れ②です2",treatment: "ひび②修理します2", mainpart_id: 1, material_id: 2, symptom_id: 1 ,detail_type: "壁")
Detail.create(detail_name: "ひび割れ③",condition: "ひどいひび割れ③です3",treatment: "ひび③修理します3", mainpart_id: 1, material_id: 2, symptom_id: 1 ,detail_type: "壁")

Detail.create(detail_name: "剥がれ①",condition: "ひどい剥がれ①です",treatment: "剥がれ①修理します", mainpart_id: 1, material_id: 2, symptom_id: 2 ,detail_type: "床")
Detail.create(detail_name: "剥がれ②",condition: "ひどい剥がれ②です2",treatment: "剥がれ②修理します2", mainpart_id: 1, material_id: 2, symptom_id: 2 ,detail_type: "床")
Detail.create(detail_name: "剥がれ③",condition: "ひどい剥がれ③です3",treatment: "剥がれ③修理します3", mainpart_id: 1, material_id: 2, symptom_id: 2 ,detail_type: "床")

Detail.create(detail_name: "色褪せ①",condition: "ひどい色褪せ①です",treatment: "色褪せ①修理します", mainpart_id: 1, material_id: 2, symptom_id: 3 ,detail_type: "屋根")
Detail.create(detail_name: "色褪せ②",condition: "ひどい色褪せ②です2",treatment: "色褪せ②修理します2", mainpart_id: 1, material_id: 2, symptom_id: 3 ,detail_type: "屋根")
Detail.create(detail_name: "色褪せ③",condition: "ひどい色褪せ③です3",treatment: "色褪せ③修理します3", mainpart_id: 1, material_id: 2, symptom_id: 3 ,detail_type: "屋根")
# render 'db/mainpart_seed.rb'
# render 'db/material_seed.rb'
# render 'db/symptom_seed.rb'
# render 'db/detail_seed.rb'


# Part.create(cond: "",treat: "",building_id: 1,detail_id: 1)
# Part.create(cond: "",treat: "",building_id: 1,detail_id: 2)
# Part.create(cond: "",treat: "",building_id: 1,detail_id: 3)
# Part.create(cond: "",treat: "",building_id: 1,detail_id: 3)
