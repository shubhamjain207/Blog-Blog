let writeBlog = document.querySelector(".writeBlogButton");
let writeBlogContainer = document.querySelector(".writeBlog");
let closeBtn = document.querySelector(".closeBtn");
let blogWriteArea = document.querySelector(".blogWriteArea");
let postBtn = document.querySelector(".postBtn");

postBtn.disabled = true;





writeBlog.addEventListener("click",func3);
closeBtn.addEventListener("click",func4);


document.addEventListener('keydown', (event) => {
  if(blogWriteArea.value.length > 10){
		postBtn.disabled = false;
  }
  else if(blogWriteArea.value.length <= 10){
	    postBtn.disabled = true;
  }
}, false);


function func4(e){
	e.preventDefault();
	writeBlogContainer.style.display="none";
	document.body.style.overflow = "scroll";
}

function func3(){
	writeBlogContainer.style.display="flex";
	document.body.style.overflow = "hidden";
}








