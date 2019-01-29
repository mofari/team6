<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
 
<!DOCTYPE HTML>
<html>
<head>
<script type="text/javascript">
window.onload = function () {
  
var chart = new CanvasJS.Chart("chartContainer", {
	theme: "light2", // "light2", "dark1", "dark2"
	animationEnabled: true, // change to true		
	title:{
		text: "상품 만족도" 
	},
	axisY:{
		title:"인원(명)"
	},
	data: [
	{
		// Change type to "bar", "area", "spline", "pie",etc.
		type: "column",
		dataPoints: [
			{ label: "★",  y: ${product_grade0}  },
			{ label: "★★", y: ${product_grade1}  },
			{ label: "★★★", y: ${product_grade2}  },
			{ label: "★★★★",  y:${product_grade3}  },
			{ label: "★★★★★",  y: ${product_grade4}  }
		]
	} 
	]
});
chart.render();

}


</script>

</head>
<body>
<div id="chartContainer" style="height: 370px; width: 100%;"></div>
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"> </script>
</body>
</html>