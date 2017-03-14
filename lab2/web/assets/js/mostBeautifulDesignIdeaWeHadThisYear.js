var greet = document.getElementById('greet');
document.forms.personForm.addEventListener('change', function() {
  if(document.forms.personForm.gender.value === 'F') {
    greet.textContent = "Hello Madam !";
    greet.style.color = 'aqua';
    greet.style.fontFamily = 'Griffy';
  } else {
    greet.textContent = "Hello Sir !";
    greet.style.color = 'bisque';
    greet.style.fontFamily = 'Indie lFlower';
  }
});