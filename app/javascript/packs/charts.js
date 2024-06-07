document.addEventListener("turbo:load", function() {
  if (typeof Chart === 'undefined') {// Chart.jsが読み込まれていない場合はロードしてからチャートを初期化
    loadChartJs().then(initializeCharts);
  } else {// すでに読み込まれている場合は直接チャートを初期化
    initializeCharts();
  }
});
// 既存のチャートインスタンスを保持する配列
let chartInstances = [];
// Chart.jsを非同期で読み込む関数
function loadChartJs() {
  return new Promise((resolve, reject) => {
    const script = document.createElement('script');
    script.src = "https://cdn.jsdelivr.net/npm/chart.js";
    script.async = true;
    script.onload = resolve; // ロード成功時に解決
    script.onerror = reject; // ロード失敗時に拒否
    document.head.appendChild(script);
  });
}
// チャートを初期化する関数
function initializeCharts() {
  // 既存のチャートインスタンスを破棄して配列をクリア
  if (chartInstances.length > 0) {
    chartInstances.forEach(chart => chart.destroy());
    chartInstances = [];
  }
  // チャートを描画する要素を取得
  const charts = document.querySelectorAll('.group-completion-chart');
  if (charts.length === 0) {
    return; // 要素がない場合は終了
  }
  charts.forEach(chart => {
    const completionRate = parseFloat(chart.getAttribute('data-completion-rate')); // 完了率を取得
    const groupName = chart.getAttribute('data-group-name'); // グループ名を取得
    const color = getGradientColor(completionRate); // 完了率に応じた色を取得
    const ctx = chart.querySelector('canvas').getContext('2d'); // キャンバスのコンテキストを取得
    // 新しいChartインスタンスを作成
    const newChart = new Chart(ctx, {
      type: 'doughnut', // ドーナツグラフを指定
      data: {
        datasets: [{
          data: [completionRate, 100 - completionRate], // 完了率と未完了率のデータ
          backgroundColor: [color, 'rgba(0, 0, 0, 0.1)'], // データの背景色
          borderWidth: 1 // 境界線の幅
        }]
      },
      options: {
        responsive: true, // グラフをレスポンシブにする
        cutout: '70%', // ドーナツチャートの内側の穴のサイズを指定
        plugins: {
          legend: {
            display: false // 凡例を表示しない
          },
          tooltip: {
            enabled: false // ツールチップを表示しない
          },
          doughnutlabel: {
            labels: [
              {
                text: groupName, // グラフの中央に表示するテキスト
                font: {
                  size: '20' // フォントサイズを指定
                },
                color: '#333' // フォントカラーを指定
              }
            ]
          }
        }
      }
    });
    // 新しいチャートインスタンスを配列に追加
    chartInstances.push(newChart);
  });
}
// 完了率に応じたグラデーションカラーを取得する関数
function getGradientColor(percentage) {
  const baseRed = 255;
  const baseGreen = 255;
  const baseBlue = 255;
  const targetRed = 47;
  const targetGreen = 79;
  const targetBlue = 79;

  // 完了率に基づいて赤、緑、青の値を計算
  const red = Math.floor(baseRed + (targetRed - baseRed) * (percentage / 100));
  const green = Math.floor(baseGreen + (targetGreen - baseGreen) * (percentage / 100));
  const blue = Math.floor(baseBlue + (targetBlue - baseBlue) * (percentage / 100));

  return `rgb(${red}, ${green}, ${blue})`; // 計算した色を返す
}
