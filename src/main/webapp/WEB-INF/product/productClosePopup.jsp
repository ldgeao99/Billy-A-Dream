<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
    	$(function(){
    		var referrer = $('#url').val();
    		opener.parent.location.href=referrer;
    		window.close();
    	})
    
    </script>

<input type="hidden" id="url" value="${ BuyUrl}">

안녕
