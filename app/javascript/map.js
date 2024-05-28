document.addEventListener("DOMContentLoaded", function() {
  let map;
  let markers = [];

  // Google Mapsを初期化する関数
  function initMap() {
    const mapElement = document.getElementById('map');
    if (!mapElement) return;

    // Google Mapオブジェクトの作成
    map = new google.maps.Map(mapElement, {
      center: { lat: 38.0189, lng: 138.3664 },
      zoom: 5,
    });

    console.log("Map initialized");
    updateMap(); // 初期表示時に地図を更新
  }

// 地図を更新する関数
function updateMap() {
  if (!map) return;

  // 既存のマーカーをクリアする
  markers.forEach(marker => marker.setMap(null));
  markers = [];

  console.log("Map updated");

  const currentUrl = window.location.pathname;

    // スポット詳細ページの場合
    if (currentUrl.match(/\/groups\/\d+\/spots\/\d+/)) {
      console.log("Updating map with single spot");
      if (window.spotData) {
        const spot = window.spotData;
        const marker = new google.maps.Marker({
          position: { lat: spot.latitude, lng: spot.longitude },
          map: map,
          title: spot.name
        });
        markers.push(marker);

        // スポットの位置に地図をズーム
        map.setCenter({ lat: spot.latitude, lng: spot.longitude });
        map.setZoom(15);
      }
    }
    // グループ詳細ページの場合
    else if (currentUrl.match(/\/groups\/\d+/)) {
      console.log("Updating map with group spots");
      if (window.spotsData) {
        window.spotsData.forEach(spot => {
          const marker = new google.maps.Marker({
            position: { lat: spot.latitude, lng: spot.longitude },
            map: map,
            title: spot.name
          });
          markers.push(marker);
        });
      }
    }
  }

  // グローバルスコープに関数を設定（Google Maps APIのコールバックで使用するため）
  window.initMap = initMap;
  window.updateMap = updateMap;

  // turbo:loadイベントに地図の更新を設定
  document.addEventListener("turbo:load", function() {
    console.log("Turbo:load event detected");
    updateMap(); // ページ遷移時に地図を更新
  });
});