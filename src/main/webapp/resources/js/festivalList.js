// festivalList.js
function CheckboxChanged(e) {
  e.preventDefault();
  let inner = e.target.parentElement.querySelector('.flip-card-inner');
  inner.offsetHeight;
  if (e.target.checked) {
    inner.classList.add('flipcard'); /*앞부분*/
    inner.classList.remove('-flipcard'); /*뒷부분*/
  } else {
    inner.classList.add('-flipcard');
    inner.classList.remove('flipcard');
  }
}

window.onload = function initialize() {
  // 카드 전환
  Array.from(document.getElementsByClassName('btnControl'), item => {
    item.addEventListener('change', e => {
      CheckboxChanged(e);
    });
  });
};









