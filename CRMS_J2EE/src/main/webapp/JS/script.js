/*document.getElementById("ham").addEventListener("click", function(){
    navBar = document.querySelector(".nav-bar");
    navBar.classList.toggle("active");
});*/

const body = document.body;
let lastScroll = 0;

window.addEventListener('scroll', () => {
    
    let currentScroll = window.pageYOffset;

    if(currentScroll <= 0)
    {
        body.classList.remove("scroll-up");
    }

    if(currentScroll > lastScroll && !body.classList.contains("scroll-down"))
    {
        body.classList.remove("scroll-up");
        body.classList.add("scroll-down");
    }
            
    if(currentScroll < lastScroll && body.classList.contains("scroll-down"))
    {
        body.classList.remove("scroll-down");
        body.classList.add("scroll-up");
    }

    lastScroll = currentScroll;
})

//Search Function JS
function searchCar() {
  	var input = document.getElementById("srch");
  	var filter = input.value.toLowerCase();
  	var nodes = document.getElementsByClassName('car_box');
  		
  	for (i = 0; i < nodes.length; i++) {
    	if (nodes[i].innerText.toLowerCase().includes(filter)) {
      		nodes[i].style.display = "block";
    	} else {
      		nodes[i].style.display = "none";
    	}
  	}
}