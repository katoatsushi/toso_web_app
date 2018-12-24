Mainpart.create(mp_name: "外壁")
Mainpart.create(mp_name: "内壁")
Mainpart.create(mp_name: "屋根")

Material.create(mate_name: "塗装" ,mainpart_id: 1)
Material.create(mate_name: "タイル",mainpart_id: 1)
Material.create(mate_name: "パネル",mainpart_id: 1)

Material.create(mate_name: "2塗装(内壁)" ,:mainpart_id => 2)
Material.create(mate_name: "2タイル(内壁)",:mainpart_id => 2)
Material.create(mate_name: "2パネル(内壁)",:mainpart_id => 2)

Material.create(mate_name: "3塗装(屋根)" ,mainpart_id: 3)
Material.create(mate_name: "3タイル(屋根)",mainpart_id: 3)
Material.create(mate_name: "3パネル(屋根)",mainpart_id: 3)