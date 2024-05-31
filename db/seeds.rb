# グループデータ
groups = [
  { name: "日本三名園", creator: "不明", text: "優れた景勝を持つ三つの日本庭園の総称" },
  { name: "日本三景", creator: "林春斎", text: "全て海にある風景となっており、古くから詩歌に詠まれ、絵画に描かれた" },
  { name: "日本三大がっかり", creator: "不明", text: "思わずがっかりしてしまう日本の名所" },
  { name: "日本三大夜景", creator: "不明", text: "日本国内で最も美しいとされる三つの夜景" },
  { name: "日本三大祭り", creator: "不明", text: "日本の代表的な三つの祭り" },
  { name: "日本三古泉", creator: "日本書紀、風土記などに登場することに基づく", text: "日本に昔から存在する古い温泉" },
  { name: "日本三大美肌の湯", creator: "藤田聡（温泉評論家）", text: "肌に対する効能が良い温泉" },
  { name: "日本三大秘境", creator: "不明", text: "自然が美しく、人里離れた秘境とされる3つの地域" }
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
  { name: "函館山", text: "標高334mの山から眺める夜景は、広がる街並みと海のコントラストが美しい。", address: "北海道函館市", latitude: 41.7687, longitude: 140.7288, group_name: "日本三大夜景" },
  { name: "摩耶山", text: "摩耶山頂上からの夜景は、神戸の街と海が一望でき、特に「1000万ドルの夜景」と称される。", address: "兵庫県神戸市", latitude: 34.7070, longitude: 135.2383, group_name: "日本三大夜景" },
  { name: "稲佐山", text: "稲佐山からの夜景は、長崎港を中心に広がる光景が美しく、「1千万ドルの夜景」と言われる。", address: "長崎県長崎市", latitude: 32.7446, longitude: 129.8772, group_name: "日本三大夜景" },
  { name: "祇園祭", text: "八坂神社の祭りで、豪華な山鉾巡行や華やかな行事が特徴。", address: "京都府京都市", latitude: 35.0038, longitude: 135.7787, group_name: "日本三大祭り" },
  { name: "天神祭", text: "大阪天満宮の祭りで、陸渡御と船渡御が織りなすダイナミックな行列が見どころ。", address: "大阪府大阪市", latitude: 34.7025, longitude: 135.5097, group_name: "日本三大祭り" },
  { name: "神田祭", text: "神田明神の祭りで、神輿や山車の巡行が街中を賑わせる壮大なイベント。", address: "東京都千代田区", latitude: 35.6981, longitude: 139.7671, group_name: "日本三大祭り" },
  { name: "有馬温泉", text: "兵庫県神戸市北区に位置する温泉。日本三古泉の一つ。", address: "兵庫県神戸市北区有馬町", latitude: 34.7981, longitude: 135.2531, group_name: "日本三古泉" },
  { name: "白浜温泉", text: "和歌山県西牟婁郡白浜町に位置する温泉。日本三古泉の一つ。", address: "和歌山県西牟婁郡白浜町", latitude: 33.6773, longitude: 135.3498, group_name: "日本三古泉" },
  { name: "道後温泉", text: "愛媛県松山市に位置する温泉。日本三古泉の一つ。", address: "愛媛県松山市道後湯之町", latitude: 33.8521, longitude: 132.7784, group_name: "日本三古泉" },
  { name: "喜連川温泉", text: "かつて喜連川藩の温泉場として栄え、歴史のある温泉地。肌に優しいアルカリ性単純温泉が特徴で、日本三大美肌の湯の一つとして知られる。", address: "栃木県さくら市", latitude: 36.6836, longitude: 139.9692, group_name: "日本三大美肌の湯" },
  { name: "斐乃上温泉", text: "古くから美肌効果があるとされ、地元の人々に親しまれてきた。アルカリ性単純温泉で、肌がすべすべになると言われている。日本三大美肌の湯の一つ。", address: "島根県仁多郡奥出雲町", latitude: 35.1367, longitude: 133.0307, group_name: "日本三大美肌の湯" },
  { name: "嬉野温泉", text: "日本書紀にも登場する歴史ある温泉地で、古くから美肌効果が高いとされる。ナトリウム炭酸水素塩泉で、肌がしっとりとなるのが特徴。", address: "佐賀県嬉野市", latitude: 33.1176, longitude: 130.0543, group_name: "日本三大美肌の湯" },
  { name: "白川郷", text: "合掌造りの伝統的な集落が特徴。世界遺産にも登録されており、美しい自然と歴史的建造物が調和している。", address: "岐阜県大野郡白川村", latitude: 36.2709, longitude: 136.8990, group_name: "日本三大秘境" },
  { name: "祖谷山村", text: "深い谷と切り立った山々が広がり、かずら橋などの観光名所がある。", address: "徳島県三好市東祖谷", latitude: 33.9025, longitude: 133.7871, group_name: "日本三大秘境" },
  { name: "椎葉村", text: "豊かな自然と伝統的な文化が残る地域。平家の落人伝説があることでも知られる。", address: "宮崎県東臼杵郡椎葉村", latitude: 32.4668, longitude: 131.1833, group_name: "日本三大秘境" }
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

# テスト用アカウント
User.create!(
  name: 'seiha',
  email: 'seiha@seiha.com',
  password: 'seiha1818',
  password_confirmation: 'seiha1818'
)
