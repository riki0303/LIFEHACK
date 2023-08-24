import $, { data } from 'jquery';
import axios from 'axios';
import { csrfToken } from 'rails-ujs';

axios.defaults.headers.common['X-CSRF-Token'] = csrfToken();

document.addEventListener('DOMContentLoaded', () => {
  const dataset = $('#account-show').data();
  const userId = dataset.userId;
  axios.get(`/accounts/${userId}/follows`).then((res) => {
    const hasFollowed = res.data.hasFollowed;
    if (hasFollowed === true) {
      $('.profile__link--unfollow-js').removeClass('hidden');
    } else {
      $('.profile__link--follow-js').removeClass('hidden');
    }
  });
});
