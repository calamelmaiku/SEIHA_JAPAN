function initMenu() {
  const menuIcon = document.getElementById('menu-icon');
  const menu = document.getElementById('menu');

  if (menuIcon && menu) {
    // 既存のイベントリスナーを削除してから追加
    menuIcon.removeEventListener('click', toggleMenu);
    menuIcon.addEventListener('click', toggleMenu);
  }
}

function toggleMenu() {
  const menuIcon = document.getElementById('menu-icon');
  const menu = document.getElementById('menu');
  menuIcon.classList.toggle('active');
  menu.classList.toggle('active');
}

// Turboのイベントにリッスンして、関数を呼び出す
document.addEventListener("turbo:load", initMenu);
document.addEventListener("turbo:render", initMenu);

// ページの初回読み込み時に関数を呼び出す
document.addEventListener("DOMContentLoaded", initMenu);
