var loadFile = function(event) {
  var output = document.getElementById('user_avatar');
  output.src = URL.createObjectURL(event.target.files[0]);
};
