# グループデータ
groups = [
  { name: "日本三名園", creator: "不明", text: "優れた景勝を持つ三つの日本庭園の総称" },
  { name: "日本三景", creator: "林春斎", text: "東京の観光スポットを巡るグループです" },
  { name: "日本三大がっかり", creator: "不明", text: "京都の観光スポットを巡るグループです" }
]

# スポットデータ
spots = [
  { name: "偕楽園", text: "水戸藩九代藩主徳川斉昭によって造園された。100種3000本の梅が植えられている。", address: "茨城県水戸市", latitude: 36.3756, longitude: 140.454, group_name: "日本三名園" },
  { name: "兼六園", text: "加賀藩によって金沢城の外郭に造営された江戸時代を代表する池泉回遊式庭園。", address: "石川県金沢市", latitude: 36.5629, longitude: 136.6627, group_name: "日本三名園" },
  { name: "岡山後楽園", text: "岡山藩二代藩主池田綱政がやすらぎの場として作らせた庭園。", address: "岡山県岡山市北区", latitude: 34.6676, longitude: 133.9362, group_name: "日本三名園" },
  { name: "松島", text: "約260の島々からなる諸島やそれを擁する多島海。", address: "宮城県宮城郡松島町", latitude: 38.3677, longitude: 141.0769, group_name: "日本三景" },
  { name: "天橋立", text: "長さ3.6kmの砂洲。美しい景観、砂浜、数千本もの松林で有名。", address: "京都府宮津市", latitude: 35.5700, longitude: 135.1918, group_name: "日本三景" },
  { name: "宮島（厳島）", text: "厳島神社を中心とした島。", address: "広島県廿日市市", latitude: 34.2736, longitude: 132.3055, group_name: "日本三景" },
  { name: "札幌市時計台", text: "現存しているものでは日本最古の時計塔。", address: "北海道札幌市中央区", latitude: 43.3570, longitude: 141.2451, group_name: "日本三大がっかり" },
  { name: "はりまや橋", text: "江戸時代に町をにぎわせた僧侶と町娘による恋物語の舞台として有名。", address: "高知県高知市", latitude: 33.5601, longitude: 133.5427, group_name: "日本三大がっかり" },
  { name: "オランダ坂", text: "外国人居留地の名残で異国情緒あふれる石畳の坂道。", address: "長崎県長崎市", latitude: 32.7387, longitude:  129.8726, group_name: "日本三大がっかり" },
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
      spot.address = spot_data[:address]
      spot.latitude = spot_data[:latitude]
      spot.longitude = spot_data[:longitude]
    end
  end
end

