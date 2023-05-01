let writeBlog = document.querySelector(".writeBlogButton");
let writeBlogContainer = document.querySelector(".writeBlog");
let closeBtn = document.querySelector(".closeBtn");


writeBlog.addEventListener("click",func3);
closeBtn.addEventListener("click",func4);

function func4(e){
	e.preventDefault();
	writeBlogContainer.style.display="none";
	document.body.style.overflow = "scroll";
}

function func3(){
	writeBlogContainer.style.display="flex";
	document.body.style.overflow = "hidden";
}






