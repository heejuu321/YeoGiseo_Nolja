<%@page import="dto.Reserve"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/layout/header.jsp" %>
<% Reserve reserve = (Reserve) request.getAttribute("reserve"); %>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">

<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>



<style type="text/css">

#bookinginfo{ 
	margin-left : 18%;
	margin-top: -5%;
	text-align: left; 
	float: left;
	width: 30%;
	font-family: 'Jua', sans-serif;
	
	
}

.right {
	padding: 2%;
	margin-left: 51%;
	width: 300px;
	background-color: #FFF0F0;
	border: 0;
	border-radius: 10px;
	font-family: 'Jua', sans-serif;

}

#username {
	width: 300px; 
	height: 30px;
    font-size: 13px;
    padding-left: 10px; 
    border-radius: 5px;
	border: 1px solid #ffefea; 
	background-color: #fff0f0;
}

#userphone {
	width: 300px; 
	height: 30px;
    font-size: 13px;
    padding-left: 10px; 
    border-radius: 5px;
	border: 1px solid #ffefea;  
	background-color: #fff0f0;
}


#payBtn{
	width: 300px; 
	height: 40px; 
	margin: 10px; 
	border: 0; 
	cursor: pointer;
	border-radius: 5px; 
    font-size: 18px;
    font-weight: bold; 
    color: #fff; 
    background: #F59696;
    font-family: 'Jua', sans-serif;
    letter-spacing: 1.5px;

 
}

.btn {
	margin-left: 49.5%;
	margin-top: -3%;
	float: left;
}

.form-control {
	width: 150px;
	outline: black;
}

input[type='checkbox'] {

    width:20px;
    height:20px;
    background:white;
    border-radius:5px;
    border:2px solid #555;
    margin-top: 1%;
}

 input[id="a"] {
    position: relative;
    top: 5px;
}

.checkk {
float: left;
}


</style>

<script type="text/javascript">
function selectAll(selectAll)  {
	  const checkboxes 
	       = document.getElementsByName('info');
	  
	  checkboxes.forEach((checkbox) => {
	    checkbox.checked = selectAll.checked;
	  })
	}
	
function payCheck() {
  	
	var payCheck = document.getElementById("a");

	if( payCheck.checked == false ) {  
		 alert("???????????? ??????????????? ?????? ??????????????????."); 
		 return false; 
	}
} 	
</script>




<form action="/payment" method="post">
<div id="bookinginfo">
		<h2>?????? ??????</h2>
			<hr>
		<h4>???????????????</h4>
			<input type="text" name="username" id="username" class="input" placeholder="<%=reserve.getUser_name() %>" readonly /><br>
		<h4>????????? ??????</h4>
			<input type="text" name="userphone" id="userphone" class="input" placeholder="<%=reserve.getUser_phone() %>" readonly /><br>
		<hr>
		<h3><b>?????? : <%=reserve.getRoom_price() %></b></h3>
			<hr>
		<h4><b>?????? ??????</b></h4>
		<select class="form-control" name="paykind">
 			<option value="????????????" selected>????????????</option>
 			<option value="??????/????????????">??????/????????????</option>
  			<option value="???????????????">???????????????</option>
		</select><br> 
		
			<input type='checkbox' name='info' id="a" value='selectall'onclick='selectAll(this)' /> <b>????????????</b><br /> 
			<input type='checkbox' name='info' id="a" value='info' /> [??????] ??? 14??? ?????? ?????? ??????<br />
			<input type='checkbox' name='info' id="a" value='info' /> [??????] ???????????? ?????? ??? ?????? ??????<br /> 
			<input type='checkbox' name='info' id="a" value='info' /> [??????] ???????????? ??? 3??? ?????? ??????<br /> 
			<input type='checkbox' name='info' id="a" value='info' /> [??????] ?????????????????? ??? ??????/???????????? ??????<br />
</div>

		<div class="right">
			<div>
			<h5>?????????</h5>
			<h3><%=reserve.getHotel_name() %></h3>
			<h5>?????????</h5>
			<h3><%=reserve.getRoom_type() %></h3>
			<h5>????????? ??????</h5>
			<h3><%=reserve.getHotel_in() %>, <%=reserve.getHotel_intime() %></h3>
			<h5>???????????? ??????</h5>
			<h3><%=reserve.getHotel_out() %>, <%=reserve.getHotel_outtime() %></h3>
			<h5>??? ????????????(VAT??????)</h5>
			<h3><%=reserve.getRoom_price() %>???</h3>
			</div>
		</div>	
			<div class="btn">
			<input type="hidden" name="booking_no" value="<%=reserve.getBooking_no() %>">
			<input type="hidden" name="user_no" value="<%=reserve.getUser_no() %>">
			<input type="hidden" name="room_no" value="<%=reserve.getRoom_no() %>">
			<input type="hidden" name="hotel_no" value="<%=reserve.getHotel_no() %>">
			<input type="hidden" name="room_price" value="<%=reserve.getRoom_price() %>">
			<button id="payBtn" onclick="return payCheck();">????????????</button>
		</div>
</form>


<%@ include file="/layout/footer.jsp" %>
