import $, { data } from 'jquery';

document.addEventListener('DOMContentLoaded', () => {
  $('.header__tab').on('click', () => {
    $('.header__nav').toggleClass('hidden');
  });

  $('.post__tab').on('click', function () {
    $(this).children().toggleClass('hidden');
  });
});
