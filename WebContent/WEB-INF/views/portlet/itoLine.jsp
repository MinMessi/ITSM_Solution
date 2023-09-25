<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" pageEncoding="utf-8" %>

<!-- c3 Charts -->
<link href="${imageServer}/css/plugins/c3/c3.min.css" rel="stylesheet">

<div style="height:300px;">
	<div id="slineChart_PTID_" ></div>
</div>

<!-- d3 and c3 charts -->
<script src="${imageServer}/js/plugins/d3/d3.min.js"></script>
<script src="${imageServer}/js/plugins/c3/c3.min.js"></script>

<script>
	$(function() {
		c3.generate({
            bindto: '#slineChart_PTID_',
            data:{
                columns: [
                    ['data1', 252, 220, 220, 275, 260],
                    ['data2', 5, 32, 0, 12, 15]
                ],
                names: {"data1":"외주인력","data2":"철수인력"},
                colors:{
                    data1: '#1ab394',
                    data2: '#BABABA'
                },
                type: 'spline'
            },
            axis : {
		    	x : {
		    		type : 'category',
		    		categories: ["2017-09","2017-10","2017-11","2017-12", "2017-01"]
		    	}
		    }
        });

	});
</script>



