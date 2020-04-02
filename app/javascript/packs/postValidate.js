 let form = document.getElementById('bugForm');
 let errorMessage = document.getElementById('errorMessage'); 

 form.addEventListener('submit', (event) => {
	let titleText = document.getElementsByName('bug[title]')[0].value;
	let descriptionText = document.getElementsByName('bug[description]')[0].value;
   
	if (titleText.length == 0 || descriptionText.length == 0) {
   		errorMessage.innerHTML = "Please Enter a Title and Description!";
		event.preventDefault();
	}
	else{
   		errorMessage.innerHTML = '';
	}
 });