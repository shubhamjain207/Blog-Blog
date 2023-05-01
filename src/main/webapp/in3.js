let editProfile = document.querySelector(".editProfile");
let editProfileView = document.querySelector("#editProfileView");
let profileView = document.querySelector("#profileView");

editProfile.addEventListener("click",func1);

function func1(){
	editProfileView.style.display = "flex";
	profileView.style.display = "none";
}