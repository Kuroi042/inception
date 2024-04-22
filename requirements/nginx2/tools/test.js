//document.querySelector('h1').style.color = 'red';
//document.addEventListener('DOMContentLoaded', function();
//h1Elements.forEach(function(element) {
//    element.style.color = 'red';});
////document.querySelectorAll('h1').style.color = 'red'
//document.write("<h1>TTTTT</h1>");
//document.write("<h1>GOROSEAI<h1>");
//console.log("dasdasda");


document.addEventListener('DOMContentLoaded', function() 
{
	document.querySelectorAll('h1').forEach(function(element) 
	{
	  element.style.color = 'black';
	});

	var anotherH1 = document.createElement('h1');
	anotherH1.textContent = 'GOROSEAI';
	document.body.appendChild(anotherH1);

	console.log("dasdasda");
});
