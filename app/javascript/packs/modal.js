const modal = document.getElementById('modal-container');
const img = modal.querySelector('img');

modal.addEventListener('click', () => (modal.style.display = 'none'));

/* document自体をclickイベント監視、targetがpopup対象なら以降の処理を行う例 */
document.addEventListener('click', (e) => {
  if (!e.target.classList.contains('popup')) return;
  img.src = e.target.src;
  modal.style.display = 'block';
});
