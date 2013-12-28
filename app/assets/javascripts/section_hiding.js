var ready;
ready = function() {

	var bioLink = document.getElementById("bio-link");
	var portfolioLink = document.getElementById("portfolio-link");


	bioLink.onclick = function() {
		if($("#bio-section").is(":hidden"))
		{	
			$("#portfolio-section").slideUp();
			$("#bio-section").slideDown();
			bioLink.style.border="2px solid white"
			portfolioLink.style.border=""
		}
		return false;
	}

	portfolioLink.onclick = function() {
		if($("#portfolio-section").is(":hidden"))
		{
			$("#bio-section").slideUp();
			$("#portfolio-section").slideDown();
			portfolioLink.style.border="2px solid white"
			bioLink.style.border=""
		}
		return false;
	}
};

$(document).ready(ready);
$(document).on('page:load', ready);