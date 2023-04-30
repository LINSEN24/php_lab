const form = document.querySelector('.login_form form');

form.addEventListener('submit', function(event) {
  // Prevent the form from submitting
  event.preventDefault();

  // Validate the form fields
  const account = document.querySelector('input[name="account"]').value;
  let password = document.querySelector('input[name="password"]').value;
  const errorDiv = document.querySelector('.login_error');
  errorDiv.innerHTML = '';
  if (account === '' || password === '') {
    alert('Please enter a account and password.');
    return;
  }

  axios.post('../php/service/userLogin.php', {
    account: account,
    password: password
  })
  .then((response) => {
    // Handle the JSON response here
    if (response.data.success) {
      // Redirect to the dashboard page
      window.location.href = '../php/service/homepage.php';
    } else {
      // Display an error message
      errorDiv.innerHTML = 'Invalid account or password.';
    }
  })
  .catch((error) => {
    // Handle errors here
    console.error(error);
  }); 
});
