document.addEventListener("DOMContentLoaded", function() {
  const charts = document.querySelectorAll('.group-completion-chart');

  charts.forEach(chart => {// 各グラフ要素の処理
    const completionRate = parseFloat(chart.getAttribute('data-completion-rate')); // data属性取得し、数値に変換
    const groupName = chart.getAttribute('data-group-name'); // グループ名をdata属性から取得
    const ctx = chart.querySelector('canvas').getContext('2d'); // canvas要素のコンテキストを取得
    new Chart(ctx, { // 新しいChartインスタンスを作成
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
    const red = Math.min(255, Math.floor((1 - percentage / 100) * 255));
    const green = Math.min(255, Math.floor((percentage / 100) * 255));
    return `rgb(${red}, ${green}, 0)`;
  }
});
