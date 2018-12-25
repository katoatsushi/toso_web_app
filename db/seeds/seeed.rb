Mainpart.create(mp_name: "外壁")
Mainpart.create(mp_name: "内壁")
Mainpart.create(mp_name: "屋根")

Material.create(mate_name: "塗装" ,mainpart_id: 1)
Material.create(mate_name: "タイル",mainpart_id: 1)
Material.create(mate_name: "パネル",mainpart_id: 1)

Material.create(mate_name: "塗装" ,mainpart_id: 11)
Material.create(mate_name: "タイル",mainpart_id: 11)
Material.create(mate_name: "パネル",mainpart_id: 11)

Material.create(mate_name: "塗装" ,mainpart_id: 21)
Material.create(mate_name: "タイル",mainpart_id: 21)
Material.create(mate_name: "パネル",mainpart_id: 21)

Symptom.create(s_name: "ひび割れ(塗装)", material_id: 1, mainpart_id: 1)
Symptom.create(s_name: "剥がれ(塗装)", material_id: 1, mainpart_id: 1)
Symptom.create(s_name: "色褪せ(塗装)", material_id: 1, mainpart_id: 1)

Symptom.create(s_name: "ひび割れ(タイル)", material_id: 11, mainpart_id: 1)
Symptom.create(s_name: "剥がれ(タイル)", material_id: 11, mainpart_id: 1)
Symptom.create(s_name: "色褪せ(タイル)", material_id: 11, mainpart_id: 1)

Symptom.create(s_name: "ひび割れ(パネル)", material_id: 21, mainpart_id: 1)
Symptom.create(s_name: "剥がれ(パネル)", material_id: 21, mainpart_id: 1)
Symptom.create(s_name: "色褪せ(パネル)", material_id: 21, mainpart_id: 1)

Symptom.create(s_name: "ひび割れ(塗装)", material_id: 31, mainpart_id: 11)
Symptom.create(s_name: "剥がれ(塗装)", material_id: 31, mainpart_id: 11)
Symptom.create(s_name: "色褪せ(塗装)", material_id: 31, mainpart_id: 11)

Symptom.create(s_name: "ひび割れ(タイル)", material_id: 41, mainpart_id: 11)
Symptom.create(s_name: "剥がれ(タイル)", material_id: 41, mainpart_id: 11)
Symptom.create(s_name: "色褪せ(タイル)", material_id: 41, mainpart_id: 11)

Symptom.create(s_name: "ひび割れ(パネル)", material_id: 51, mainpart_id: 11)
Symptom.create(s_name: "剥がれ(パネル)", material_id: 51, mainpart_id: 11)
Symptom.create(s_name: "色褪せ(パネル)", material_id: 51, mainpart_id: 11)

Symptom.create(s_name: "ひび割れ(塗装)", material_id: 61, mainpart_id: 21)
Symptom.create(s_name: "剥がれ(塗装)", material_id: 61, mainpart_id: 21)
Symptom.create(s_name: "色褪せ(塗装)", material_id: 61, mainpart_id: 21)

Symptom.create(s_name: "ひび割れ(タイル)", material_id: 71, mainpart_id: 21)
Symptom.create(s_name: "剥がれ(タイル)", material_id: 71, mainpart_id: 21)
Symptom.create(s_name: "色褪せ(タイル)", material_id: 71, mainpart_id: 21)

Symptom.create(s_name: "ひび割れ(パネル)", material_id: 81, mainpart_id: 31)
Symptom.create(s_name: "剥がれ(パネル)", material_id: 81, mainpart_id: 31)
Symptom.create(s_name: "色褪せ(パネル)", material_id: 81, mainpart_id: 31)

Detail.create(detail_name: "ひび割れ(塗装)①",condition: "ひどいひび割れ①です",treatment: "ひび①修理します", mainpart_id: 1, material_id: 1, symptom_id: 1 ,detail_type: "壁")
Detail.create(detail_name: "ひび割れ(塗装)②",condition: "ひどいひび割れ②です2",treatment: "ひび②修理します2", mainpart_id: 1, material_id: 1, symptom_id: 1 ,detail_type: "壁")
Detail.create(detail_name: "ひび割れ(塗装)③",condition: "ひどいひび割れ③です3",treatment: "ひび③修理します3", mainpart_id: 1, material_id: 1, symptom_id: 1 ,detail_type: "壁")
