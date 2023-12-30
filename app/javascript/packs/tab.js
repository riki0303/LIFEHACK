import $, { data } from 'jquery';

document.addEventListener('DOMContentLoaded', () => {
  $('.header__tab').on('click', () => {
    $('.header__nav').toggleClass('hidden');
  });

  $(document).on('click', (event) => {
    // クリックされた要素がheader__tabでない場合
    if (!$(event.target).closest('.header__tab').length) {
      // header__navにhiddenクラスを追加
      $('.header__nav').addClass('hidden');
    }
  });
// ーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーー
  $('.post__tab').on('click', function () {
    $(this).children().toggleClass('hidden');
  });

  $(document).on('click', function (event) {
    if (!$(event.target).closest('.post__tab').length) {
      // .post__tab以外の要素がクリックされた場合、.hiddenクラスを削除
      $('.post__tab').children().addClass('hidden');
    }
  });
});
