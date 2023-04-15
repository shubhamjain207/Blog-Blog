let btn = document.querySelector("#editProfile");
let editProfileView = document.querySelector("#editProfileView");
let profileView = document.querySelector("#profileView");


btn.addEventListener("click",func);


function func(){
	profileView.style.display = "none";
	editProfileView.style.display = "block";
	
}