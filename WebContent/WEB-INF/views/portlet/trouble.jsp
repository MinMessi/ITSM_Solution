<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" pageEncoding="utf-8" %>

<div id="div_PTID_" style="height:300px;">
	<div id="stocked_chart_PTID_" style="height:100%;"></div>
</div>

<!-- d3 and c3 charts -->
<script src="${imageServer}/js/plugins/d3/d3.min.js"></script>
<script src="${imageServer}/js/plugins/c3/c3.min.js"></script>

<script>
	$(function() {
		var max = 0;
		c3.generate({
		      bindto: '#stocked_chart_PTID_',
		      data:{
		          columns: [
		        	  ["data", 36, 27, 4, 5]
		        	],
		          names: {"data":"건수"},
		          type: 'bar',
		          groups: [["data"]]
		      },
		      axis : {
			    	x : {
			    		type : 'category',
			    		categories: ["장애", "처리완료", "처리중", "보류"]
			    	},
			    	y : {
			    		tick: {
			    			count: 5,
			    			format: function(y) {
			    				var y = parseInt(y);
			    				if ( y > max ) max = y;
			    				return y;
			    			}
			    		}
			    	}
			    }
		  });
	});
</script>

