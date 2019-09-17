document.addEventListener('turbolinks:load', () => {

  let searchGroup = document.getElementById('searchGroup');

  let input = searchGroup.querySelector('input');
  let link = searchGroup.querySelector('a');

  link.addEventListener('click', (event) => {
    if (input.value !== '') {
      link.href = '/?q=' + input.value;
    }
  });
});