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

const handleHeartDisplay = (hasLiked) => {
  if (hasLiked) {
    $('.like__active-heart').removeClass('hidden');
  } else {
    $('.like__inactive-heart').removeClass('hidden');
  }
};

// 画面ロード後
document.addEventListener('DOMContentLoaded', () => {
  const dataset = $('#post-show').data();
  const postId = dataset.postId;

  // いいねの表示
  axios.get(`/posts/${postId}/like`).then((res) => {
    const hasLiked = res.data.hasLiked;
    handleHeartDisplay(hasLiked);
  });

  // いいねする
  $('.like__inactive-heart').on('click', () => {
    axios
      .post(`/posts/${postId}/like`)
      .then((res) => {
        if (res.data.status === 'ok') {
          $('.like__active-heart').removeClass('hidden');
          $('.like__inactive-heart').addClass('hidden');
          // いいね数表示
          $('.like-count-js').text(res.data.likesCount);
        }
      })
      .catch((e) => {
        window.alert('e');
      });
  });

  // いいね解除;
  $('.like__active-heart').on('click', () => {
    axios
      .delete(`/posts/${postId}/like`)
      .then((res) => {
        if (res.data.status === 'ok') {
          $('.like__active-heart').addClass('hidden');
          $('.like__inactive-heart').removeClass('hidden');
          // いいね数表示
          $('.like-count-js').text(res.data.likesCount);
        }
      })
      .catch((e) => {
        window.alert('e');
      });
  });
});
