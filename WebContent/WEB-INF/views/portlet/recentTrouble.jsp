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
		        	  ["cmplt",12,27,2,7],
		        	  ["inbox",2,1,0,0],
		        	  ["ing",1,5,0,1]
		        	],
		          names: {"inbox":"접수","cmplt":"처리완료","ing":"처리중"},
		          type: 'bar',
		          groups: [["cmplt","inbox","ing"]]
		      },
		      axis : {
			    	x : {
			    		type : 'category',
			    		categories: ["응용시스템","소프트웨어","네트워크","하드웨어"]
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

