document.addEventListener('DOMContentLoaded', () => {
  const createImageHTML = (blob) => {
    const imageElement = document.getElementById('form__new-image');

    const blobImage = document.createElement('img');
    blobImage.setAttribute('class', 'form__new-image');
    blobImage.setAttribute('src', blob);

    imageElement.appendChild(blobImage);
  };

  // 投稿画像を選択した時
  document.getElementById('profile_avatar').addEventListener('change', (e) => {
    const imageContent = document.querySelector('img');

    if (imageContent) {
      imageContent.remove();
    }

    const file = e.target.files[0];
    const blob = window.URL.createObjectURL(file);
    createImageHTML(blob);
  });
});
