// DOMContentLoadedイベントが発生した時点で実行される関数を設定
document.addEventListener("DOMContentLoaded", function() {
  let map;

  // Google Mapsを初期化する関数
  function initMap() {
    // Google Mapオブジェクトの作成
    map = new google.maps.Map(document.getElementById('map'), {
      // 地図の中心を設定（緯度と経度）
      center: { lat: 38.0189, lng: 138.3664 },
      // 日本全体が表示されるズームレベルを設定
      zoom: 5,
    });

    // スポットデータを取得してマーカーを追加
    const spots = window.spotsData;
    spots.forEach(spot => {
      new google.maps.Marker({
        position: { lat: spot.latitude, lng: spot.longitude },
        map: map,
        title: spot.name
      });
    });
  }

  // グローバルスコープにinitMap関数を設定（Google Maps APIのコールバックで使用するため）
  window.initMap = initMap;
});
