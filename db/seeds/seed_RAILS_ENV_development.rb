#RAILS_ENV=production
Mainpart.create(mp_name: "外壁")
Mainpart.create(mp_name: "内壁")
Mainpart.create(mp_name: "屋根")

Material.create(mate_name: "塗装" ,mainpart_id: 1)
Material.create(mate_name: "タイル",mainpart_id: 1)
Material.create(mate_name: "パネル",mainpart_id: 1)

Material.create(mate_name: "塗装" ,mainpart_id: 2)
Material.create(mate_name: "タイル",mainpart_id: 2)
Material.create(mate_name: "パネル",mainpart_id: 2)

Material.create(mate_name: "塗装" ,mainpart_id: 3)
Material.create(mate_name: "タイル",mainpart_id: 3)
Material.create(mate_name: "パネル",mainpart_id: 3)

Symptom.create(s_name: "1", material_id: 1, mainpart_id: 1)
Symptom.create(s_name: "2", material_id: 1, mainpart_id: 1)
Symptom.create(s_name: "3", material_id: 1, mainpart_id: 1)
Symptom.create(s_name: "4", material_id: 2, mainpart_id: 1)
Symptom.create(s_name: "5", material_id: 2, mainpart_id: 1)
Symptom.create(s_name: "6", material_id: 2, mainpart_id: 1)
Symptom.create(s_name: "7", material_id: 3, mainpart_id: 1)
Symptom.create(s_name: "8", material_id: 3, mainpart_id: 1)
Symptom.create(s_name: "9", material_id: 3, mainpart_id: 1)

Symptom.create(s_name: "10", material_id: 4, mainpart_id: 2)
Symptom.create(s_name: "11", material_id: 4, mainpart_id: 2)
Symptom.create(s_name: "12", material_id: 4, mainpart_id: 2)
Symptom.create(s_name: "13", material_id: 5, mainpart_id: 2)
Symptom.create(s_name: "14", material_id: 5, mainpart_id: 2)
Symptom.create(s_name: "15", material_id: 5, mainpart_id: 2)
Symptom.create(s_name: "16", material_id: 6, mainpart_id: 2)
Symptom.create(s_name: "17", material_id: 6, mainpart_id: 2)
Symptom.create(s_name: "18", material_id: 6, mainpart_id: 2)

Symptom.create(s_name: "19", material_id: 7, mainpart_id: 3)
Symptom.create(s_name: "20", material_id: 7, mainpart_id: 3)
Symptom.create(s_name: "21", material_id: 7, mainpart_id: 3)
Symptom.create(s_name: "22", material_id: 8, mainpart_id: 3)
Symptom.create(s_name: "23", material_id: 8, mainpart_id: 3)
Symptom.create(s_name: "24", material_id: 8, mainpart_id: 3)
Symptom.create(s_name: "25", material_id: 9, mainpart_id: 3)
Symptom.create(s_name: "26", material_id: 9, mainpart_id: 3)
Symptom.create(s_name: "27", material_id: 9, mainpart_id: 3)

Detail.create(detail_name: "1ひび割れ(塗装)①",condition: "ひどいひび割れ①です",treatment: "ひび①修理します", mainpart_id: 1, material_id: 1, symptom_id: 1 ,detail_type: "壁")
Detail.create(detail_name: "1ひび割れ(塗装)②",condition: "ひどいひび割れ②です2",treatment: "ひび②修理します2", mainpart_id: 1, material_id: 1, symptom_id: 1 ,detail_type: "壁")
Detail.create(detail_name: "1ひび割れ(塗装)③",condition: "ひどいひび割れ③です31ひび割れ(塗装)③1ひび割れ(塗装)③",treatment: "ひび③修理します31ひび割れ(塗装)③1ひび割れ(塗装)③", mainpart_id: 1, material_id: 1, symptom_id: 1 ,detail_type: "壁")
Detail.create(detail_name: "2ひび割れ(塗装)①",condition: "ひどいひび割れ①です",treatment: "ひび①修理します", mainpart_id: 1, material_id: 1, symptom_id: 2 ,detail_type: "壁")
Detail.create(detail_name: "2ひび割れ(塗装)②",condition: "ひどいひび割れ②です2",treatment: "ひび②修理します2", mainpart_id: 1, material_id: 1, symptom_id: 2 ,detail_type: "壁")
Detail.create(detail_name: "2ひび割れ(塗装)③",condition: "ひどいひび割れ③です3",treatment: "ひび③修理します3", mainpart_id: 1, material_id: 1, symptom_id: 2 ,detail_type: "壁")
Detail.create(detail_name: "3ひび割れ(塗装)①",condition: "ひどいひび割れ①です",treatment: "ひび①修理します", mainpart_id: 1, material_id: 1, symptom_id: 3 ,detail_type: "壁")
Detail.create(detail_name: "3ひび割れ(塗装)②",condition: "ひどいひび割れ②です2",treatment: "ひび②修理します2", mainpart_id: 1, material_id: 1, symptom_id: 3 ,detail_type: "壁")
Detail.create(detail_name: "3ひび割れ(塗装)③",condition: "ひどいひび割れ③です3",treatment: "ひび③修理します3", mainpart_id: 1, material_id: 1, symptom_id: 3 ,detail_type: "壁")
Detail.create(detail_name: "4ひび割れ(塗装)①",condition: "ひどいひび割れ①です",treatment: "ひび①修理します", mainpart_id: 1, material_id: 2, symptom_id: 4,detail_type: "壁")
Detail.create(detail_name: "4ひび割れ(塗装)②",condition: "ひどいひび割れ②です2",treatment: "ひび②修理します2", mainpart_id: 1, material_id: 2, symptom_id: 4 ,detail_type: "壁")
Detail.create(detail_name: "4ひび割れ(塗装)③",condition: "ひどいひび割れ③です3",treatment: "ひび③修理します3", mainpart_id: 1, material_id: 2, symptom_id: 4 ,detail_type: "壁")
Detail.create(detail_name: "5ひび割れ(塗装)①",condition: "ひどいひび割れ①です",treatment: "ひび①修理します", mainpart_id: 1, material_id: 2, symptom_id: 5 ,detail_type: "壁")
Detail.create(detail_name: "5ひび割れ(塗装)②",condition: "ひどいひび割れ②です2",treatment: "ひび②修理します2", mainpart_id: 1, material_id: 2, symptom_id: 5 ,detail_type: "壁")
Detail.create(detail_name: "5ひび割れ(塗装)③",condition: "ひどいひび割れ③です3",treatment: "ひび③修理します3", mainpart_id: 1, material_id: 2, symptom_id: 5 ,detail_type: "壁")
Detail.create(detail_name: "6ひび割れ(塗装)①",condition: "ひどいひび割れ①です",treatment: "ひび①修理します", mainpart_id: 1, material_id: 2, symptom_id: 6 ,detail_type: "壁")
Detail.create(detail_name: "6ひび割れ(塗装)②",condition: "ひどいひび割れ②です2",treatment: "ひび②修理します2", mainpart_id: 1, material_id: 2, symptom_id: 6 ,detail_type: "壁")
Detail.create(detail_name: "6ひび割れ(塗装)③",condition: "ひどいひび割れ③です3",treatment: "ひび③修理します3", mainpart_id: 1, material_id: 2, symptom_id: 6 ,detail_type: "壁")
Detail.create(detail_name: "7ひび割れ(塗装)①",condition: "ひどいひび割れ①です",treatment: "ひび①修理します", mainpart_id: 1, material_id: 3, symptom_id: 7 ,detail_type: "壁")
Detail.create(detail_name: "7ひび割れ(塗装)②",condition: "ひどいひび割れ②です2",treatment: "ひび②修理します2", mainpart_id: 1, material_id: 3, symptom_id: 7 ,detail_type: "壁")
Detail.create(detail_name: "7ひび割れ(塗装)③",condition: "ひどいひび割れ③です3",treatment: "ひび③修理します3", mainpart_id: 1, material_id: 3, symptom_id: 7 ,detail_type: "壁")
Detail.create(detail_name: "8ひび割れ(塗装)①",condition: "ひどいひび割れ①です",treatment: "ひび①修理します", mainpart_id: 1, material_id: 3, symptom_id: 8 ,detail_type: "壁")
Detail.create(detail_name: "8ひび割れ(塗装)②",condition: "ひどいひび割れ②です2",treatment: "ひび②修理します2", mainpart_id: 1, material_id: 3, symptom_id: 8 ,detail_type: "壁")
Detail.create(detail_name: "8ひび割れ(塗装)③",condition: "ひどいひび割れ③です3",treatment: "ひび③修理します3", mainpart_id: 1, material_id: 3, symptom_id: 8 ,detail_type: "壁")
Detail.create(detail_name: "9ひび割れ(塗装)①",condition: "ひどいひび割れ①です",treatment: "ひび①修理します", mainpart_id: 1, material_id: 3, symptom_id: 9 ,detail_type: "壁")
Detail.create(detail_name: "9ひび割れ(塗装)②",condition: "ひどいひび割れ②です2",treatment: "ひび②修理します2", mainpart_id: 1, material_id: 3, symptom_id: 9 ,detail_type: "壁")
Detail.create(detail_name: "9ひび割れ(塗装)③",condition: "ひどいひび割れ③です3",treatment: "ひび③修理します3", mainpart_id: 1, material_id: 3, symptom_id: 9 ,detail_type: "壁")

Detail.create(detail_name: "10ひび割れ(塗装)①",condition: "ひどいひび割れ①です",treatment: "ひび①修理します", mainpart_id: 2, material_id: 4, symptom_id: 10 ,detail_type: "壁")
Detail.create(detail_name: "10ひび割れ(塗装)②",condition: "ひどいひび割れ②です2",treatment: "ひび②修理します2", mainpart_id: 2, material_id: 4, symptom_id: 10 ,detail_type: "壁")
Detail.create(detail_name: "10ひび割れ(塗装)③",condition: "ひどいひび割れ③です3",treatment: "ひび③修理します3", mainpart_id: 2, material_id: 4, symptom_id: 10 ,detail_type: "壁")
Detail.create(detail_name: "11ひび割れ(塗装)①",condition: "ひどいひび割れ①です",treatment: "ひび①修理します", mainpart_id: 2, material_id: 4, symptom_id: 11 ,detail_type: "壁")
Detail.create(detail_name: "11ひび割れ(塗装)②",condition: "ひどいひび割れ②です2",treatment: "ひび②修理します2", mainpart_id: 2, material_id: 4, symptom_id: 11 ,detail_type: "壁")
Detail.create(detail_name: "11ひび割れ(塗装)③",condition: "ひどいひび割れ③です3",treatment: "ひび③修理します3", mainpart_id: 2, material_id: 4, symptom_id: 11 ,detail_type: "壁")
Detail.create(detail_name: "12ひび割れ(塗装)①",condition: "ひどいひび割れ①です",treatment: "ひび①修理します", mainpart_id: 2, material_id: 4, symptom_id: 12 ,detail_type: "壁")
Detail.create(detail_name: "12ひび割れ(塗装)②",condition: "ひどいひび割れ②です2",treatment: "ひび②修理します2", mainpart_id: 2, material_id: 4, symptom_id: 12 ,detail_type: "壁")
Detail.create(detail_name: "12ひび割れ(塗装)③",condition: "ひどいひび割れ③です3",treatment: "ひび③修理します3", mainpart_id: 2, material_id: 4, symptom_id: 12 ,detail_type: "壁")
Detail.create(detail_name: "13ひび割れ(塗装)①",condition: "ひどいひび割れ①です",treatment: "ひび①修理します", mainpart_id: 2, material_id: 5, symptom_id: 13 ,detail_type: "壁")
Detail.create(detail_name: "13ひび割れ(塗装)②",condition: "ひどいひび割れ②です2",treatment: "ひび②修理します2", mainpart_id: 2, material_id: 5, symptom_id: 13 ,detail_type: "壁")
Detail.create(detail_name: "13ひび割れ(塗装)③",condition: "ひどいひび割れ③です3",treatment: "ひび③修理します3", mainpart_id: 2, material_id: 5, symptom_id: 13 ,detail_type: "壁")
Detail.create(detail_name: "14ひび割れ(塗装)①",condition: "ひどいひび割れ①です",treatment: "ひび①修理します", mainpart_id: 2, material_id: 5, symptom_id: 13 ,detail_type: "壁")
Detail.create(detail_name: "14ひび割れ(塗装)②",condition: "ひどいひび割れ②です2",treatment: "ひび②修理します2", mainpart_id: 2, material_id: 5, symptom_id: 14 ,detail_type: "壁")
Detail.create(detail_name: "14ひび割れ(塗装)③",condition: "ひどいひび割れ③です3",treatment: "ひび③修理します3", mainpart_id: 2, material_id: 5, symptom_id: 14 ,detail_type: "壁")
Detail.create(detail_name: "15ひび割れ(塗装)①",condition: "ひどいひび割れ①です",treatment: "ひび①修理します", mainpart_id: 2, material_id: 5, symptom_id: 15 ,detail_type: "壁")
Detail.create(detail_name: "15ひび割れ(塗装)②",condition: "ひどいひび割れ②です2",treatment: "ひび②修理します2", mainpart_id: 2, material_id: 5, symptom_id: 15 ,detail_type: "壁")
Detail.create(detail_name: "15ひび割れ(塗装)③",condition: "ひどいひび割れ③です3",treatment: "ひび③修理します3", mainpart_id: 2, material_id: 5, symptom_id: 15 ,detail_type: "壁")
Detail.create(detail_name: "16ひび割れ(塗装)①",condition: "ひどいひび割れ①です",treatment: "ひび①修理します", mainpart_id: 2, material_id: 6, symptom_id: 16 ,detail_type: "壁")
Detail.create(detail_name: "16ひび割れ(塗装)②",condition: "ひどいひび割れ②です2",treatment: "ひび②修理します2", mainpart_id: 2, material_id: 6, symptom_id: 16 ,detail_type: "壁")
Detail.create(detail_name: "16ひび割れ(塗装)③",condition: "ひどいひび割れ③です3",treatment: "ひび③修理します3", mainpart_id: 2, material_id: 6, symptom_id: 16 ,detail_type: "壁")
Detail.create(detail_name: "17ひび割れ(塗装)①",condition: "ひどいひび割れ①です",treatment: "ひび①修理します", mainpart_id: 2, material_id: 6, symptom_id: 17 ,detail_type: "壁")
Detail.create(detail_name: "17ひび割れ(塗装)②",condition: "ひどいひび割れ②です2",treatment: "ひび②修理します2", mainpart_id: 2, material_id: 6, symptom_id: 17 ,detail_type: "壁")
Detail.create(detail_name: "17ひび割れ(塗装)③",condition: "ひどいひび割れ③です3",treatment: "ひび③修理します3", mainpart_id: 2, material_id: 6, symptom_id: 17 ,detail_type: "壁")
Detail.create(detail_name: "18ひび割れ(塗装)①",condition: "ひどいひび割れ①です",treatment: "ひび①修理します", mainpart_id: 2, material_id: 6, symptom_id: 18 ,detail_type: "壁")
Detail.create(detail_name: "18ひび割れ(塗装)②",condition: "ひどいひび割れ②です2",treatment: "ひび②修理します2", mainpart_id: 2, material_id: 6, symptom_id: 18 ,detail_type: "壁")
Detail.create(detail_name: "18ひび割れ(塗装)③",condition: "ひどいひび割れ③です3",treatment: "ひび③修理します3", mainpart_id: 2, material_id: 6, symptom_id: 18 ,detail_type: "壁")

Detail.create(detail_name: "19ひび割れ(塗装)①",condition: "ひどいひび割れ①です",treatment: "ひび①修理します", mainpart_id: 3, material_id: 7, symptom_id: 19 ,detail_type: "壁")
Detail.create(detail_name: "19ひび割れ(塗装)②",condition: "ひどいひび割れ②です2",treatment: "ひび②修理します2", mainpart_id: 3, material_id: 7, symptom_id: 19 ,detail_type: "壁")
Detail.create(detail_name: "19ひび割れ(塗装)③",condition: "ひどいひび割れ③です3",treatment: "ひび③修理します3", mainpart_id: 3, material_id: 7, symptom_id: 19 ,detail_type: "壁")
Detail.create(detail_name: "20ひび割れ(塗装)①",condition: "ひどいひび割れ①です",treatment: "ひび①修理します", mainpart_id: 3, material_id: 7, symptom_id: 20 ,detail_type: "壁")
Detail.create(detail_name: "20ひび割れ(塗装)②",condition: "ひどいひび割れ②です2",treatment: "ひび②修理します2", mainpart_id: 3, material_id: 7, symptom_id: 20 ,detail_type: "壁")
Detail.create(detail_name: "20ひび割れ(塗装)③",condition: "ひどいひび割れ③です3",treatment: "ひび③修理します3", mainpart_id: 3, material_id: 7, symptom_id: 20 ,detail_type: "壁")
Detail.create(detail_name: "21ひび割れ(塗装)①",condition: "ひどいひび割れ①です",treatment: "ひび①修理します", mainpart_id: 3, material_id: 7, symptom_id: 21 ,detail_type: "壁")
Detail.create(detail_name: "21ひび割れ(塗装)②",condition: "ひどいひび割れ②です2",treatment: "ひび②修理します2", mainpart_id: 3, material_id: 7, symptom_id: 21 ,detail_type: "壁")
Detail.create(detail_name: "21ひび割れ(塗装)③",condition: "ひどいひび割れ③です3",treatment: "ひび③修理します3", mainpart_id: 3, material_id: 7, symptom_id: 21 ,detail_type: "壁")
Detail.create(detail_name: "22ひび割れ(塗装)①",condition: "ひどいひび割れ①です",treatment: "ひび①修理します", mainpart_id: 3, material_id: 8, symptom_id: 22 ,detail_type: "壁")
Detail.create(detail_name: "22ひび割れ(塗装)②",condition: "ひどいひび割れ②です2",treatment: "ひび②修理します2", mainpart_id: 3, material_id: 8, symptom_id: 22 ,detail_type: "壁")
Detail.create(detail_name: "22ひび割れ(塗装)③",condition: "ひどいひび割れ③です3",treatment: "ひび③修理します3", mainpart_id: 3, material_id: 8, symptom_id: 22 ,detail_type: "壁")
Detail.create(detail_name: "23ひび割れ(塗装)①",condition: "ひどいひび割れ①です",treatment: "ひび①修理します", mainpart_id: 3, material_id: 8, symptom_id: 23 ,detail_type: "壁")
Detail.create(detail_name: "23ひび割れ(塗装)②",condition: "ひどいひび割れ②です2",treatment: "ひび②修理します2", mainpart_id: 3, material_id: 8, symptom_id: 23 ,detail_type: "壁")
Detail.create(detail_name: "23ひび割れ(塗装)③",condition: "ひどいひび割れ③です3",treatment: "ひび③修理します3", mainpart_id: 3, material_id: 8, symptom_id: 23,detail_type: "壁")
Detail.create(detail_name: "24ひび割れ(塗装)①",condition: "ひどいひび割れ①です",treatment: "ひび①修理します", mainpart_id: 3, material_id: 8, symptom_id: 24 ,detail_type: "壁")
Detail.create(detail_name: "24ひび割れ(塗装)②",condition: "ひどいひび割れ②です2",treatment: "ひび②修理します2", mainpart_id: 3, material_id: 8, symptom_id: 24 ,detail_type: "壁")
Detail.create(detail_name: "24ひび割れ(塗装)③",condition: "ひどいひび割れ③です3",treatment: "ひび③修理します3", mainpart_id: 3, material_id: 8, symptom_id: 24 ,detail_type: "壁")
Detail.create(detail_name: "25ひび割れ(塗装)①",condition: "ひどいひび割れ①です",treatment: "ひび①修理します", mainpart_id: 3, material_id: 9, symptom_id: 25 ,detail_type: "壁")
Detail.create(detail_name: "25ひび割れ(塗装)②",condition: "ひどいひび割れ②です2",treatment: "ひび②修理します2", mainpart_id: 3, material_id: 9, symptom_id: 25 ,detail_type: "壁")
Detail.create(detail_name: "25ひび割れ(塗装)③",condition: "ひどいひび割れ③です3",treatment: "ひび③修理します3", mainpart_id: 3, material_id: 9, symptom_id: 25 ,detail_type: "壁")
Detail.create(detail_name: "26ひび割れ(塗装)①",condition: "ひどいひび割れ①です",treatment: "ひび①修理します", mainpart_id: 3, material_id: 9, symptom_id: 26 ,detail_type: "壁")
Detail.create(detail_name: "26ひび割れ(塗装)②",condition: "ひどいひび割れ②です2",treatment: "ひび②修理します2", mainpart_id: 3, material_id: 9, symptom_id: 26 ,detail_type: "壁")
Detail.create(detail_name: "26ひび割れ(塗装)③",condition: "ひどいひび割れ③です3",treatment: "ひび③修理します3", mainpart_id: 3, material_id: 9, symptom_id: 26 ,detail_type: "壁")
Detail.create(detail_name: "27ひび割れ(塗装)①",condition: "ひどいひび割れ①です",treatment: "ひび①修理します", mainpart_id: 3, material_id: 9, symptom_id: 27 ,detail_type: "壁")
Detail.create(detail_name: "27ひび割れ(塗装)②",condition: "ひどいひび割れ②です2",treatment: "ひび②修理します2", mainpart_id: 3, material_id: 9, symptom_id: 27 ,detail_type: "壁")
Detail.create(detail_name: "27ひび割れ(塗装)③",condition: "ひどいひび割れ③です3",treatment: "ひび③修理します3", mainpart_id: 3, material_id: 9, symptom_id: 27 ,detail_type: "壁")
