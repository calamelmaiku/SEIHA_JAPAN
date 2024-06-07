document.addEventListener("DOMContentLoaded", function() {
  const charts = document.querySelectorAll('.group-completion-chart');

  charts.forEach(chart => {// 各グラフ要素の処理
    const completionRate = parseFloat(chart.getAttribute('data-completion-rate'));// data属性取得し、数値に変換
    const groupName = chart.getAttribute('data-group-name');// グループ名をdata属性から取得
    const color = getGradientColor(completionRate);// getGradientColor関数で色を決定
    const ctx = chart.querySelector('canvas').getContext('2d');// canvas要素のコンテキストを取得
    new Chart(ctx, {// 新しいChartインスタンスを作成
      type: 'doughnut', // ドーナツグラフを指定
      data: {
        datasets: [{
          data: [completionRate, 100 - completionRate], // 完了率と未完了率のデータを設定
          backgroundColor: [color, 'rgba(0, 0, 0, 0.1)'], // データの背景色を設定
          borderWidth: 1 // 境界線の幅を設定
        }]
      },
      options: {
        responsive: true, // グラフをレスポンシブに
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
                text: groupName, // グラフの中央に表示するテキストを設定
                font: {
                  size: '20' // フォントサイズを設定
                },
                color: '#333' // フォントカラーを設定
              }
            ]
          }
        }
      }
    });
  });

  // 完了率に応じた色を取得する関数
  function getGradientColor(percentage) {
    const baseRed = 255;
    const baseGreen = 255;
    const baseBlue = 255;
    const targetRed = 47;
    const targetGreen = 79;
    const targetBlue = 79;

    const red = Math.floor(baseRed + (targetRed - baseRed) * (percentage / 100));
    const green = Math.floor(baseGreen + (targetGreen - baseGreen) * (percentage / 100));
    const blue = Math.floor(baseBlue + (targetBlue - baseBlue) * (percentage / 100));

    return `rgb(${red}, ${green}, ${blue})`;
  }
});
