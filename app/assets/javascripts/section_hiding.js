var ready;
ready = function() {

	var bioLink = document.getElementById("bio-link");
	var portfolioLink = document.getElementById("portfolio-link");

	bioLink.style.border="2px solid white"
	$("#bio-section").show();

	bioLink.onclick = function() {
		if($("#bio-section").is(":hidden"))
		{	
			$("#portfolio-section").hide();
			$("#bio-section").show();
			bioLink.style.border="2px solid white"
			portfolioLink.style.border=""
		}
		return false;
	}

	portfolioLink.onclick = function() {
		if($("#portfolio-section").is(":hidden"))
		{
			$("#bio-section").hide();
			$("#portfolio-section").show();
			portfolioLink.style.border="2px solid white"
			bioLink.style.border=""
		}
		return false;
	}
};

$(document).ready(ready);
$(document).on('page:load', ready);