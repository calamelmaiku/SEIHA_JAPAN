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
      mapId: '<%= ENV["GOOGLE_MAPS_MAP_ID"] %>' // マップIDを設定
    });

    updateMap(); // 初期表示時に地図を更新
  }

  // 地図を更新する関数
  async function updateMap() {
    if (!map) return;

    // 必要なライブラリをインポート
    const { AdvancedMarkerElement, PinElement } = await google.maps.importLibrary("marker");

    // 既存のマーカーをクリアする
    markers.forEach(marker => marker.map = null);
    markers = [];

    const bounds = new google.maps.LatLngBounds(); // マーカーの範囲を保持するオブジェクト

    const currentUrl = window.location.pathname;

    // スポット詳細ページの場合
    if (currentUrl.match(/\/groups\/\d+\/spots\/\d+/)) {
      if (window.spotData) {
        const spot = window.spotData;
        const markerElement = document.createElement('div');
        markerElement.innerHTML = `<div style="background-color: white; padding: 5px; border-radius: 5px; box-shadow: 0 0 5px rgba(0,0,0,0.3);">${spot.name}</div>`;

        const marker = new AdvancedMarkerElement({
          position: { lat: spot.latitude, lng: spot.longitude },
          map: map,
          title: spot.name,
          content: markerElement
        });
        markers.push(marker);

        // スポットの位置に地図をズーム
        bounds.extend(marker.position); // マーカーの位置を範囲に追加
        map.fitBounds(bounds); // マーカーの範囲に地図を調整

        // スポット詳細ページの場合は少しズームアウト
        const zoomChangeBoundsListener = google.maps.event.addListenerOnce(map, 'bounds_changed', function(event) {
          if (this.getZoom() > 15) {
            this.setZoom(10); // 任意のズームレベルに設定
          }
        });
        setTimeout(function() { google.maps.event.removeListener(zoomChangeBoundsListener) }, 2000);
      }
    }
    // グループ詳細ページの場合
    else if (currentUrl.match(/\/groups\/\d+/)) {
      if (window.spotsData) {
        window.spotsData.forEach(spot => {
          const markerElement = document.createElement('div');
          markerElement.innerHTML = `<div style="background-color: white; padding: 5px; border-radius: 5px; box-shadow: 0 0 5px rgba(0,0,0,0.3);">${spot.name}</div>`;

          const marker = new AdvancedMarkerElement({
            position: { lat: spot.latitude, lng: spot.longitude },
            map: map,
            title: spot.name,
            content: markerElement
          });
          markers.push(marker);

          bounds.extend(marker.position); // マーカーの位置を範囲に追加
        });
        map.fitBounds(bounds); // マーカーの範囲に地図を調整
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
