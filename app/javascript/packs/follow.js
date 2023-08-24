import $, { data } from 'jquery';
import axios from 'axios';
import { csrfToken } from 'rails-ujs';

axios.defaults.headers.common['X-CSRF-Token'] = csrfToken();

const handleFollowDisplay = (hasFollowed) => {
  if (hasFollowed === true) {
    $('.profile__link--unfollow-js').removeClass('hidden');
  } else {
    $('.profile__link--follow-js').removeClass('hidden');
  }
};

document.addEventListener('DOMContentLoaded', () => {
  const dataset = $('#account-show').data();
  const userId = dataset.userId;
  axios.get(`/accounts/${userId}/follow`).then((res) => {
    const hasFollowed = res.data.hasFollowed;
    handleFollowDisplay(hasFollowed);
  });

  // フォローする
  $('.profile__link--follow-js').on('click', () => {
    axios
      .post(`/accounts/${userId}/follow`)
      .then((res) => {
        if (res.data.status === 'ok') {
          $('.profile__link--unfollow-js').removeClass('hidden');
          $('.profile__link--follow-js').addClass('hidden');
          $('.profile__parameter-number-js').text(res.data.followersCount);
        }
      })
      .catch((e) => {
        window.alert(e);
        console.log(e);
      });
  });

  // フォロー解除
  $('.profile__link--unfollow-js').on('click', () => {
    if (window.confirm('フォロー解除して宜しいですか？'))
      axios
        .post(`/accounts/${userId}/unfollow`)
        .then((res) => {
          if (res.data.status === 'ok') {
            $('.profile__link--follow-js').removeClass('hidden');
            $('.profile__link--unfollow-js').addClass('hidden');
            $('.profile__parameter-number-js').text(res.data.followersCount);
          }
        })
        .catch((e) => {
          window.alert(e);
          console.log(e);
        });
  });
});
