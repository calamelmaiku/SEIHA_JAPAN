document.addEventListener("DOMContentLoaded", function() {
  let map;

  function initMap() {
    const geocoder = new google.maps.Geocoder();

    map = new google.maps.Map(document.getElementById('map'), {
      center: { lat: 40.7828, lng: -73.9653 },
      zoom: 12,
    });

    const marker = new google.maps.Marker({
      position: { lat: 40.7828, lng: -73.9653 },
      map: map
    });
  }

  window.initMap = initMap; // グローバルスコープにinitMap関数を設定
});
