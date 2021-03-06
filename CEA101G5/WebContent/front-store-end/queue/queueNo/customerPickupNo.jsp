<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.queueno.model.*"%>
<%@ page import="com.queueperiod.model.*"%>
<%@ page import="com.restaurant.model.*"%>
<%@ page import="com.queuetable.model.*"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	List<QueTableVO> queTableVO = new ArrayList<QueTableVO>();
	queTableVO = (List<QueTableVO>) session.getAttribute("queTableVO");
	pageContext.setAttribute("queTableVO", queTableVO);
	
	List<QuePeriodVO> list = new ArrayList<QuePeriodVO>();
	list = (List<QuePeriodVO>) session.getAttribute("quePeriodVO"); // 取得server送來之list
	pageContext.setAttribute("list", list);
	Integer pickupNo = (Integer) session.getAttribute("pickupNo");
%>
<html>
<head>
<title>customerpickup</title>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/front-store-end/bootstrap-4.5.3-dist/css/bootstrap-grid.min.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/front-store-end/bootstrap-4.5.3-dist/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/front-store-end/bootstrap-4.5.3-dist/css/bootstrap-reboot.min.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/front-store-end/bootstrap-4.5.3-dist/css/customerPickupNo.css" />
<style>
.header {
	position: fixed;
	background-color: #FA7E23;
	height: 120px;
	width: 100%;
	z-index: 2;
	opacity: 85%;
	margin-top: -30;
}

img {
	position: fixed;
	z-index: 4;
	margin-top: 10;
}
.pickup{
	background-color: #FA7E23; 
	border-color: #FA7E23;
}
</style>
</head>
<div class="header">
		<!-- Just an image -->
		<nav class="navbar navbar-light bg-light">
			<a class="navbar-brand"
				href="<%=request.getContextPath() %>/front-customer-end/front/front.jsp">
				<img src="../img/LOGO/Logo3(2).png" width="180" height="100" alt=""
				loading="lazy">
			</a>
		</nav>
		<a class="icon"
			href="<%=request.getContextPath() %>/front-customer-end/front/front.jsp"></a>
	</div>

<body>
	<div class="container">
	
		<div class="row reserve"></div>
		<div class="row reserve"></div>
		<div class="row reserve"><div class="col-sm-4"></div>
			<div id="display">
				<div id="nowTime"></div>
			</div>
		</div>
		<div class="row form">
			<form>
<div class="row">
					<div class="col-sm-2"></div>
					<label for="queueperiodid" class="col-sm-2 col-form-label">時段選擇</label>
					<div class="col-sm-6">
					<c:if test="${!empty quePeriodVO }">
						<select class="form-control" name="queueperiodid"
							id="queueperiodid" onclick="getNoCurrent();">
							<c:forEach var="quePeriodVO" items="${list}">
							<c:choose>
							<c:when test="${quePeriodVO.queuest==1 }">
										<option value="${quePeriodVO.queueperiodid}"><fmt:formatDate value="${quePeriodVO.queuestarttime}" pattern="HH:mm"/> ~ <fmt:formatDate value="${quePeriodVO.queueendtime}" pattern="HH:mm"/></option>
							</c:when>
							</c:choose>
							</c:forEach>
						</select>
						</c:if>
								<c:if test="${empty quePeriodVO }">
								<select class="form-control" name="queueperiodid"
									id="queueperiodid" style="width: 275px" required >
								<option value="999"><c:out value="取號時段已結束"></c:out></option></select>
								</c:if>
					</div>
				</div>
				<div class="row reserve1"></div>
				<div class="form-group row">
					<div class="col-sm-2"></div>
					<label for="inlineRadioOptions" class="col-sm-2 col-form-label">用餐人數</label>
					<div class="col-sm-6">
					<div class="show form-check form-check-inline" >
							<c:forEach var="queTableVO" items="${queTableVO}">
								<c:choose>
								<c:when test="${queTableVO.queuetableid==1 }">
							<input class="form-check-input fortable" type="radio" onchange="getNoCall();" name="inlineRadioOptions"
								id="inlineRadio1" value="${queTableVO.queuetableid }"> 
								<label class="form-check-label" for="inlineRadio1">1~2人</label>
								</c:when></c:choose>
								<c:choose>
								<c:when test="${queTableVO.queuetableid==2 }">
							<input class="form-check-input fortable" type="radio" checked onchange="getNoCall();" name="inlineRadioOptions"
								id="inlineRadio1" value="${queTableVO.queuetableid }"> 
								<label class="form-check-label" for="inlineRadio1">3~4人</label>
								</c:when></c:choose>
								<c:choose>
								<c:when test="${queTableVO.queuetableid==3 }">
							<input class="form-check-input fortable" type="radio" onchange="getNoCall();" name="inlineRadioOptions"
								id="inlineRadio1" value="${queTableVO.queuetableid }"> 
								<label class="form-check-label" for="inlineRadio1">5~8人</label>
								</c:when></c:choose>
								<c:choose>
								<c:when test="${queTableVO.queuetableid==4 }">
							<input class="form-check-input fortable" type="radio" onchange="getNoCall();" name="inlineRadioOptions"
								id="inlineRadio1" value="${queTableVO.queuetableid }"> 
								<label class="form-check-label" for="inlineRadio1">10人</label>
								</c:when></c:choose>
							</c:forEach>
						</div>
					</div>
<!-- 					<div class="col-sm-6"> -->
<!-- 						<div class="show form-check form-check-inline" > -->
<!-- 							<input class="form-check-input" type="radio" -->
<!-- 								onchange="getNoCall();" name="inlineRadioOptions" -->
<!-- 								id="inlineRadio1" value="option1"> <label -->
<!-- 								class="form-check-label" for="inlineRadio1">1~2人</label> -->
<!-- 						</div> -->
<!-- 						<div class="show form-check form-check-inline"> -->
<!-- 							<input class="form-check-input" checked type="radio" -->
<!-- 								onchange="getNoCall();" name="inlineRadioOptions" -->
<!-- 								id="inlineRadio2" value="option2"> <label -->
<!-- 								class="form-check-label" for="inlineRadio2">3~4人</label> -->
<!-- 						</div> -->
<!-- 						<div class="show form-check form-check-inline"> -->
<!-- 							<input class="form-check-input" type="radio" -->
<!-- 								onchange="getNoCall();" name="inlineRadioOptions" -->
<!-- 								id="inlineRadio3" value="option3"> <label -->
<!-- 								class="form-check-label" for="inlineRadio3">5~8人 </label> -->
<!-- 						</div> -->
						
<!-- 					</div> -->
				</div>

				<div class="row">
					<div class="col-sm-2"></div>
					<div class="col-sm-4">
						<div class="input-group mb-3">
							<div class="input-group-prepend">
								<span class="input-group-text table">已為您分配</span>
							</div>
							<input type="text" class="form-control" name="party" id="party"
								value="4" aria-label="Amount (to the nearest dollar)"
								readonly="readonly" />
							<div class="input-group-append">
								<span class="input-group-text table">人桌</span>
							</div>
						</div>
					</div>
					<div class="col-sm-4">
						<div class="input-group mb-3">
							<div class="input-group-prepend">
								<span class="input-group-text table">您的號碼</span>
							</div>
							<input name="queuenum" type="text" class="form-control" id="queuenum"
								value="<%=pickupNo%>"
								aria-label="Amount (to the nearest dollar)" readonly="readonly" />
							<div class="input-group-append">
								<span class="input-group-text table">號</span>
							</div>
						</div>
					</div>
				</div>

				<div class="form-group row">
					<div class="col-sm-2"></div>
					<label for="validationServer01" class="col-sm-2 col-form-label">您的大名</label>
					<div class="col-sm-6">
						<input name="memberName" type="text" class="form-control <%-- is-(in)valid --%>"
							minlength="1" maxlength="10" id="memberName" placeholder="王大明" value="${memLogin.memName}"
							required>
					</div>
				</div>
				<div class="form-group row">
					<div class="col-sm-2"></div>
					<label for="inputPassword3" class="col-sm-2 col-form-label">您的手機</label>
					<div class="col-sm-6">
						<input id="memphone" name="memphone" type="tel"
							class="form-control" placeholder="請輸入手機號碼：如 0987654321" value="${memLogin.memPhone}"
							minlength="10" maxlength="10"
							 required />
					</div>
				</div>
<!-- 				<div class="form-group row"> -->
<!-- 					<div class="col-sm-2"></div> -->
<!-- 					<label for="inputPassword3" class="col-sm-2 col-form-label">密碼設定</label> -->
<!-- 					<div class="col-sm-3"> -->
<!-- 						<input id="psw" type="password" class="form-control" value="enak" -->
<!-- 							readonly minlength="4" maxlength="8" /> -->
<!-- 					</div> -->
<!-- 					<div class="col-sm-1"> -->
<!-- 						<button id="reset" type="button" class="btn btn-outline-primary">reset</button> -->
<!-- 					</div> -->
<!-- 					<div class="col-sm-2"> -->
<!-- 						<small id="passwordHelpInline" class="text-muted"> -->
<!-- 							預設密碼為：enak </small> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 				<div class="form-group row" id="showPswCheck" -->
<!-- 					style="visibility: hidden"> -->
<!-- 					<div class="col-sm-2"></div> -->
<!-- 					<label for="inputPassword3" class="col-sm-2 col-form-label">密碼確認</label> -->
<!-- 					<div class="col-sm-3"> -->
<!-- 						<input type="password" id="pswCheck" class="form-control" -->
<!-- 							value="enak"> -->
<!-- 					</div> -->
<!-- 				</div> -->


				<div class="form-group row">
					<div class="col-sm-1"></div>
					<div class="col-sm-5">
<!-- 					<span class="badge badge-secondary">預設密碼:Enak1234</span> -->
					</div>
					<div class="col-sm-2">
						<a class="btn btn-light" href="<%=request.getContextPath() %>/front-customer-end/front/front.jsp" role="button">放棄取號</a>
					</div>
					<div class="col-sm-2">
						<input type="hidden" id="queuetableid" name="queuetableid"
							value="2"> <input type="hidden" id="queuelineno"
							name="queuelineno" value="2"> <input type="hidden"
							id="queuenotime" name="queuenotime" class="quenotime"> <input
							type="hidden" id="storeid" name="storeid" value="${storeid}">
						<input type="hidden" name="action" value="insert">
						<button id="submit" type="submit" class="pickup btn btn-primary"
							value="送出新增">確認取號</button>
					</div>
				</div>
			</form>
		</div>
		<div class="row reserve1"></div>
		<div class="row">
			<div class="col-sm-2"></div>
			<div class="col-sm-3">
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text">目前取號</span>
					</div>
					<div class="form-control" id="nocurrent"
						aria-label="Amount (to the nearest dollar)" /></div>
					<div class="input-group-append">
						<span class="input-group-text">號</span>
					</div>
				</div>
			</div>

			<div class="col-sm-1"></div>
			<div class="col-sm-3">
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text">目前叫號</span>
					</div>
					<div class="form-control" id="nocall"
						aria-label="Amount (to the nearest dollar)" /></div>
					<div class="input-group-append">
						<span class="input-group-text">號</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<script
		src="<%=request.getContextPath()%>/front-store-end/bootstrap-4.5.3-dist/js/jquery-3.4.1.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/front-store-end/bootstrap-4.5.3-dist/js/bootstrap.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/front-store-end/bootstrap-4.5.3-dist/js/popper.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/front-store-end/bootstrap-4.5.3-dist/js/customerPickupNo.js"></script>


	<script>
	$(".fortable").change(function(){
		switch($(this).val()){
		case "1":
			$("#party").attr("value", "2");
			$("[name='queuetableid']").attr("value", "1");
			$("[name='queuelineno']").attr("value", "1");
			break;
		case "2":
			$("#party").val(4);
			$("[name='queuetableid']").attr("value", "2");
			$("[name='queuelineno']").attr("value", "2");
			break;
		case "3":
			$("#party").val(8);
			$("[name='queuetableid']").attr("value", "3");
			$("[name='queuelineno']").attr("value", "3");
			break;
		case "4":
			$("#party").val(10);
			$("[name='queuetableid']").attr("value", "4");
			$("[name='queuelineno']").attr("value", "4");
			break;
		}
	});
	</script>
	<!-- 		顯示動態時間 -->
	<script type="text/javascript">
		let now = new Date();

		function fillZero(value) {
			if (value < 10) {
				value = '0' + value;
			}
			return value;
		}

		function timeFormat(now) {
			let hours;
			let AMPM;
			if (now.getHours() >= 12) {
				AMPM = 'PM';
				hours = fillZero(now.getHours() - 12);
			} else {
				AMPM = 'AM';
				hours = fillZero(now.getHours());
			}

			return now.getFullYear() + '/' + (now.getMonth() + 1) + '/'
					+ now.getDate() + ' ' + hours + ':'
					+ fillZero(now.getMinutes()) + ':'
					+ fillZero(now.getSeconds()) + ' ' + AMPM;
		}
		console.log('現在時間：' + timeFormat(now));
		let nowTime = document.getElementById('nowTime');
		nowTime.innerText = timeFormat(now);

		setInterval(function() {
			time = new Date();
			nowTime.innerText = timeFormat(time);
		}, 1000)
	</script>

	<!-- 	插入動態最新取號 -->
	<script>
		var xhr = null;

		function showNoCurrent(jsonStr) {
			//剖析json字串,將其轉成jsob物件
			let noCurrent = JSON.parse(jsonStr);
			let html;
			if (noCurrent.queuenocurrent === undefined) {
				html = "<center>0</center>"
			} else {
				html = "<div>" + noCurrent.queuenocurrent + "</div>";
			}
			document.getElementById("nocurrent").innerHTML = html;
		}
		function getNoCurrent() {
			var xhr = new XMLHttpRequest();
			//設定好回呼函數   
			xhr.onload = function() {
				if (xhr.status == 200) {
					showNoCurrent(xhr.responseText);
					//showEmployee(xhr.responseText);
				} else {
					alert(xhr.status);
				}//xhr.status == 200
			};//onload 

			//建立好Get連接
			var url = "getCurrentNo.jsp?storeid="
					+ document.getElementById("storeid").value
					+ "&queueperiodid="
					+ document.getElementById("queueperiodid").value
					+ "&queuenum="
					+ document.getElementById("queuenum").value
			xhr.open("Get", url, true);
			//送出請求 
			xhr.send(null);
		}
	</script>

	<!-- 	插入動態最新叫號 -->
	<script>
		var xhr = null;

		function showNoCall(jsonStr) {
			//剖析json字串,將其轉成jsob物件
			let noCall = JSON.parse(jsonStr);
			let html;
			if (noCall.queuenocall === undefined) {
				html = "<center>0</center>"
			} else {
				html = "<div>" + noCall.queuenocall + "</div>";
			}
			document.getElementById("nocall").innerHTML = html;
		}
		function getNoCall() {
			var xhr = new XMLHttpRequest();
			//設定好回呼函數   
			xhr.onload = function() {
				if (xhr.status == 200) {
					showNoCall(xhr.responseText);
				} else {
					alert(xhr.status);
				}//xhr.status == 200
			};//onload 
			//建立好Get連接
			var url = "getNoCall.jsp?storeid="
					+ document.getElementById("storeid").value
					+ "&queuetableid="
					+ document.getElementById("queuetableid").value
					+ "&queuelineno="
					+ document.getElementById("queuelineno").value;
			xhr.open("Get", url, true);
			//送出請求 
			xhr.send(null);
		}
	</script>

</body>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.css" />
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.js"></script>
<script
	src="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.full.js"></script>
<script>
	$.datetimepicker.setLocale('zh');
	$('.quenotime').datetimepicker({
		theme : '', //theme: 'dark',
		timepicker : true, //timepicker:true,
		step : 30, //step: 60 (這是timepicker的預設間隔60分鐘)
		format : 'Y/m/d H:i', //format:'Y-m-d H:i:s',
		value : new Date(),
	//disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // 去除特定不含
	//startDate:	            '2017/07/10',  // 起始日
	//minDate:               '-1970-01-01', // 去除今日(不含)之前
	//maxDate:               '+1970-01-01'  // 去除今日(不含)之後
	});
	window.onload = function() {
		getNoCall();
		getNoCurrent();
	}
</script>

<script>
//  電話驗證
$("#memphone").blur(
function() {
	var MobileReg = /^[0]{1}[9]{1}[0-9]{8}$/;
	console.log($(this).val());
	console.log($(this).val().match(MobileReg));
	
	if($(this).val().match(MobileReg)){
			$(this).addClass("is-valid").removeClass("is-invalid");
			$("#submit").prop("disabled", false);
	}else{
			$(this).addClass("is-invalid").removeClass("is-valid");
			$("#submit").prop("disabled", true);
	}		
});
</script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<c:if test="${check=='addNo' }">
	<script>
swal("新增成功", "ok", "success");
</script>
</c:if>
<c:if test="${check=='repeat' }">
	<script>
swal("已取過號，請確認", "fail", "error");

</script>
</c:if>
<c:if test="${check=='alert' }">
	<script>
swal("取號時段已結束", "回首頁", "error").then(function(){
	window.location.href = "<%=request.getContextPath()%>/front-customer-end/front/front.jsp"
})
</script>
</c:if>
</html>