document.addEventListener("turbo:load", function() {
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

    updateMap(); // 初期表示時に地図を更新
  }

  // 地図を更新する関数
  function updateMap() {
    if (!map) return;

    // 既存のマーカーをクリアする
    markers.forEach(marker => marker.setMap(null));
    markers = [];


    const currentUrl = window.location.pathname;

    // スポット詳細ページの場合
    if (currentUrl.match(/\/groups\/\d+\/spots\/\d+/)) {
      if (window.spotData) {
        const spot = window.spotData;
        const marker = new google.maps.Marker({
          position: { lat: spot.latitude, lng: spot.longitude },
          map: map,
          title: spot.name
        });
        markers.push(marker);

        // 吹き出しの作成
        const infoWindow = new google.maps.InfoWindow({
          content: `<div style="font-size: 12px;">${spot.name}</div>`,
        });

        // 吹き出しを常に表示
        infoWindow.open(map, marker);

        // スポットの位置に地図をズーム
        map.setCenter({ lat: spot.latitude, lng: spot.longitude });
        map.setZoom(15);
      }
    }
    // グループ詳細ページの場合
    else if (currentUrl.match(/\/groups\/\d+/)) {
      if (window.spotsData) {
        window.spotsData.forEach(spot => {
          const marker = new google.maps.Marker({
            position: { lat: spot.latitude, lng: spot.longitude },
            map: map,
            title: spot.name
          });
          markers.push(marker);

          // 吹き出しの作成
          const infoWindow = new google.maps.InfoWindow({
            content: `<div>${spot.name}</div>`,
          });

          // 吹き出しを常に表示
          infoWindow.open(map, marker);
        });
      }
    }
  }

  // グローバルスコープに関数を設定（Google Maps APIのコールバックで使用するため）
  window.initMap = initMap;
  window.updateMap = updateMap;

  // turbo:loadイベントに地図の更新を設定
  document.addEventListener("turbo:load", function() {
    updateMap(); // ページ遷移時に地図を更新
  });
});
