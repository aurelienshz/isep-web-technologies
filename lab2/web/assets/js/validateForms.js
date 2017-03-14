function appendErrors(form, errorsArray) {
  for (var i = 0; i < form.childNodes.length; i++) {
    if (form.childNodes[i].classList && form.childNodes[i].classList.contains("form-errors-block")) {
      form.removeChild(form.childNodes[i]);
    }
  }
  var ul = document.createElement('ul');
  ul.className = "form-errors-block";
  form.appendChild(ul);

  for (var j = 0; j < errorsArray.length; j++) {
    var li = document.createElement('li');
    li.textContent = errorsArray[j];
    ul.appendChild(li);
  }
}

for (var i = 0; i < document.forms.length; i++) {
  var form = document.forms[i];
  form.addEventListener('submit', function (event) {
    event.preventDefault();
    var errorText = [];

    for (var fieldIndex in event.target) {
      if (event.target.hasOwnProperty(fieldIndex)) {
        var field = event.target[fieldIndex];
        if (field.dataset && field.dataset.validateNotEmpty !== undefined) {
          if (field.value === "") {
            var fieldName = field.dataset.fieldName || "Input field";
            errorText.push(fieldName + " should not be empty");
          }
        }
      }
    }


    if(errorText.length === 0) {
      // Dispatch event so it can be catched by other listeners :
      // Clear errors list
      appendErrors(event.target, []);
      // Submit form only if it is not an AJAX form :
      if (event.target.dataset && event.target.dataset.ajaxFormSubmit !== undefined) {
        return;
      } else {
        event.target.submit();
      }
    } else {
      appendErrors(event.target, errorText);
    }
  });
}
