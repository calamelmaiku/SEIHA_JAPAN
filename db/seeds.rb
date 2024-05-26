# グループデータ
groups = [
  { name: "茨城観光", creator: "まこと", text: "茨城の観光スポットを巡るグループです" },
  { name: "東京観光", creator: "たろう", text: "東京の観光スポットを巡るグループです" },
  { name: "京都観光", creator: "じろう", text: "京都の観光スポットを巡るグループです" }
]

# スポットデータ
spots = [
  { name: "偕楽園", text: "茨城にある庭園", latitude: 36.3756, longitude: 140.454, group_name: "茨城観光" },
  { name: "筑波山", text: "茨城にある山", latitude: 36.2251, longitude: 140.1033, group_name: "茨城観光" },
  { name: "大洗水族館", text: "茨城にある水族館", latitude: 36.3131, longitude: 140.5707, group_name: "茨城観光" },
  { name: "東京タワー", text: "東京にある塔", latitude: 35.6586, longitude: 139.7454, group_name: "東京観光" },
  { name: "スカイツリー", text: "東京にある塔", latitude: 35.7101, longitude: 139.8107, group_name: "東京観光" },
  { name: "浅草寺", text: "東京にある寺", latitude: 35.7148, longitude: 139.7967, group_name: "東京観光" },
  { name: "清水寺", text: "京都にある寺", latitude: 34.9948, longitude: 135.7850, group_name: "京都観光" },
  { name: "金閣寺", text: "京都にある寺", latitude: 35.0394, longitude: 135.7292, group_name: "京都観光" },
  { name: "銀閣寺", text: "京都にある寺", latitude: 35.0272, longitude: 135.7986, group_name: "京都観光" }
]

# グループの作成
groups.each do |group_data|
  Group.find_or_create_by(name: group_data[:name]) do |group|
    group.creator = group_data[:creator]
    group.text = group_data[:text]
  end
end

# スポットの作成
spots.each do |spot_data|
  group = Group.find_by(name: spot_data[:group_name])
  if group
    Spot.find_or_create_by(name: spot_data[:name], group: group) do |spot|
      spot.text = spot_data[:text]
      spot.latitude = spot_data[:latitude]
      spot.longitude = spot_data[:longitude]
    end
  end
end

