let btn = document.querySelector("#editProfile");
let btn1 = document.querySelector(".writeBlogButton");
let editProfileView = document.querySelector("#editProfileView");
let profileView = document.querySelector("#profileView");


btn.addEventListener("click",func);

btn.addEventListener("click",func2);

function func2(){
	
	alert("fahlkdsfk");
	
}


function func(){
	profileView.style.display = "none";
	editProfileView.style.display = "block";
	
}