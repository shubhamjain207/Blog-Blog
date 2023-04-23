let btn = document.querySelector(".writeBlogButton");
let writeBlog = document.querySelector(".writeBlog");
let closeBtn = document.querySelector(".closeBtn");

btn.addEventListener("click",func);
closeBtn.addEventListener("click",func2);



function func2(e){
	e.preventDefault();
	writeBlog.style.display="none";
	
}


function func(){
	
	document.body.style.overflowY = "hidden";
	writeBlog.style.display = "flex";
	
}