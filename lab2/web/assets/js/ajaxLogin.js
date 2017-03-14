var loginForm = document.forms.loginForm;
loginForm.addEventListener('submit', function (event) {
  event.preventDefault();

  var data = new URLSearchParams();

  data.append('login', loginForm.login.value);
  data.append('password', loginForm.password.value);

  axios.post('/login', data)
    .then(function(response) {
      alert('Login success');
    })
    .catch(function (error) {
      if (error.response.status === 401) {
        alert('Login failed');
      } else {
        alert('Internal server error');
      }
    })
});
