import $, { data } from 'jquery';
import axios from 'axios';
import { csrfToken } from 'rails-ujs';

axios.defaults.headers.common['X-CSRF-Token'] = csrfToken();

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

// 画面ロード後
document.addEventListener('DOMContentLoaded', () => {
  // show いいねされているハートを取得
  $('.like__active-heart').each(function (index, element) {
    const dataset = $(element).data();
    const postId = dataset.postId;

    axios.get(`/posts/${postId}/like`).then((res) => {
      const hasLiked = res.data.hasLiked;
      if (hasLiked === true) {
        $(element).removeClass('hidden');
      }
    });
  });

  // show いいねされていないハートを取得
  $('.like__inactive-heart').each(function (index, element) {
    const dataset = $(element).data();
    const postId = dataset.postId;

    axios.get(`/posts/${postId}/like`).then((res) => {
      const hasLiked = res.data.hasLiked;
      if (hasLiked === false) {
        $(element).removeClass('hidden');
      }
    });
  });

  // create いいねする
  $('.like__inactive-heart').on('click', (e) => {
    e.preventDefault();
    const dataset = $(e.currentTarget).data();
    const postId = dataset.postId;
    axios
      .post(`/posts/${postId}/like`)
      .then((res) => {
        if (res.data.status === 'ok') {
          $(`#like__active-heart${postId}`).removeClass('hidden');
          $(`#like__inactive-heart${postId}`).addClass('hidden');
          // いいね数表示
          $(`#like-count-js${postId}`).text(res.data.likesCount);
        }
      })
      .catch((e) => {
        window.alert('e');
        console.log(e);
      });
  });

  // destroy いいね解除;
  $('.like__active-heart').on('click', (e) => {
    e.preventDefault();
    const dataset = $(e.currentTarget).data();
    const postId = dataset.postId;
    axios
      .delete(`/posts/${postId}/like`)
      .then((res) => {
        if (res.data.status === 'ok') {
          $(`#like__active-heart${postId}`).addClass('hidden');
          $(`#like__inactive-heart${postId}`).removeClass('hidden');
          // いいね数表示
          $(`#like-count-js${postId}`).text(res.data.likesCount);
        }
      })
      .catch((e) => {
        window.alert('e');
        console.log(e);
      });
  });
});
