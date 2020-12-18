
  document.body.addEventListener('keyup', function (event) {
    if (event.target.className === 'Search') {
        if (event.key == 'Enter') {
         event.preventDefault();
         document.getElementById("CompareComicDB").click();
        }
    }
}, false);