document.addEventListener('turbolinks:load', () =>{
  let newAdForm = document.getElementById('newAdForm');
  let saveDraftAdButton = document.getElementById('saveDraftAdButton');
  let saveNewAdButton = document.getElementById('saveNewAdButton');

  saveNewAdButton.addEventListener('click', (event) => {
    event.preventDefault();
    newAdForm.querySelector('input[name="ad[state]"]').value = 'new';
    saveDraftAdButton.click();
  });
});
