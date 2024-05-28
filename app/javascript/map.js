// DOMContentLoadedイベントが発生した時点で実行される関数を設定
document.addEventListener("DOMContentLoaded", function() {
  let map;

  // Google Mapsを初期化する関数
  function initMap() {
    // ジオコーダーの初期化
    const geocoder = new google.maps.Geocoder();

    // Google Mapオブジェクトの作成
    map = new google.maps.Map(document.getElementById('map'), {
      // 地図の中心を設定（緯度と経度）
      center: { lat: 40.7828, lng: -73.9653 },
      // ズームレベルを設定
      zoom: 12,
    });

    // マーカーの作成
    const marker = new google.maps.Marker({
      // マーカーを配置する位置を設定（緯度と経度）
      position: { lat: 40.7828, lng: -73.9653 },
      // マーカーを表示する地図を設定
      map: map
    });
  }

  // グローバルスコープにinitMap関数を設定（Google Maps APIのコールバックで使用するため）
  window.initMap = initMap;
});
