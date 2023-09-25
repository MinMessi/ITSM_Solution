<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<html>
	<head>
		<meta charset="utf-8">
		<title>Welcome</title>
		<!-- jQuery -->
		<script src="${imageServer}/js/jquery-2.1.1.js"></script>
		
		<style>
			li {
				cursor:pointer;
			}
			
			.hidden {
				display:none;
			}
		</style>
	</head> 
	<body>
		<ul>
			<li>
				카테고리 생성
				<div class="hidden">
					<ul>
						
					</ul>
				</div>
			</li>
		</ul>
	</body>
	
	
	<script>
		$(function() {
			$('li').click(function() {
				$(this).find('div').toggle();
			});
		});
	</script>
</html>
