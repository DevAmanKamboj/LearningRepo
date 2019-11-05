
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- To fetch the request url -->
<c:set var="req"
	value="${requestScope['javax.servlet.forward.request_uri']}" />
<c:set var="baseURL" value="${fn:split(req,'/')}" />
<link href="<%=request.getContextPath()%>/resources/css/Validation.css"
	rel="stylesheet">
<script
	src="<%=request.getContextPath()%>/resources/js/ccvalidate-tapan.min.js"></script>

<div class="right-container" id="right-container">
	<div class="container-fluid">



		<div class="Flexi_deposit">

			<div class="header_customer">
				<h3>
					<spring:message code="label.viewWithdrawPenalty" />

				</h3>
			</div>
			<div class="Success_msg">
				<div class="successMsg" style="text-align: center; color: red;">
					<h2 id="error">${error }</h2>

					<%-- <c:if test = "${not empty error}">
				 			${error}
     				 </c:if>
					 --%>

				</div>
				
				<div class="successMsg" style="text-align: center; color: green;">
					<h2 id="error" style="font-size: 21px;font-family: none">${sucess}</h2>
				</div>
			</div>
			<div class="flexi_table">
				<form:form class="form-horizontal" autocomplete="off"
					id="wthdrawPenaltyForm" commandName="wthdrawPenaltyForm">
					<div class="fd-list-table">

						<c:choose>
							<c:when test="${effectiveDateList!=null}">
								<div class="col-md-4" style="margin-left: -30px;">
<label>Date</label>
									<form:select id="effectiveDateList" path="effectiveDate"
										class="myform-control" onchange="dateByProductId(this.value)">
										<option value="">
											<spring:message code="label.select" />
										</option>
										<c:forEach var="item" items="${effectiveDateList}">
											<option value="${item}"<%-- <c:if test="${item}"><spring:message code="label.selectedSmall"/></c:if> --%>>
												<fmt:formatDate pattern="yyyy-MM-dd" value="${item}" />
											</option>
										</c:forEach>
									</form:select>
									<label>Product</label>
									<form:select id="productConfigurationSelector" path="productConfigurationId"
										class="myform-control">
										<option value="">
											<spring:message code="label.select" />
										</option>
									</form:select>


								</div>
							</c:when>
							<c:otherwise>
								<form:select id="effectiveDateList" path="effectiveDate"
									class="myform-control">
									<form:option value="select"></form:option>

								</form:select>

							</c:otherwise>
						</c:choose>

						<input type="hidden" id="hdnEffectiveDate"
							value="${effectiveDate}" />

					</div>
					<div class="col-md-4" style="margin-top: 12px;">
									<input type="radio" name="isPrematureWithdraw" id="isWithdrawPart" value = "0" checked="true"/>  Part Withdraw   
									<input type="radio" name="isPrematureWithdraw" id="isPrematureWithdraw" value = "1"/>  Premature Withdraw
								
								</div>
					<div class="form-group col-md-2"
						style="margin-top: 29px; margin-left: 15px;">
						<input type="button" class="btn btn-info add-row" value="Get Rate"
							onclick="getPenaltyRates()">
					</div>
					<div style="clear: both;"></div>





					<div class="form-group col-md-12">


						<div style="clear: both; height: 5px;"></div>


						<table id="penaltyRateTable" style="margin-left: 15px;">

							<tbody>
								<tr>

									<th>Amount Sign</th>
									<th>Amount</th>
									<th>Tenure Sign</th>
									<th>Tenure</th>
									<th><spring:message code="label.penaltyRate" /></th>
									<th><spring:message code="label.penaltyFlatAmount" /></th>
									<th>Action</th>

								</tr>
							</tbody>
						</table>

					</div>
			</div>
			</form:form>
		</div>

	</div>


<div class="container">

	<!-- Trigger the modal with a button -->


	<!-- Modal -->
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h3 class="header_customer">EDIT WITHDRAW PENALTY</h3>
				</div>
				<div class="modal-body">

					<form:form class="form-horizontal" autocomplete="off"
						id="wthdrawPenaltyFormEdit" commandName="wthdrawPenaltyForm"
						action="wthdrawPenaltyFormEdit" method="post">
						<form:input path="id" id="id" type="hidden"
							class="input form-control" />
						<form:input id="effectiveDateTempDate" path="tempDate"
							type="hidden" class="input form-control" />
						<form:input id="effectiveDateHidden" path="effectiveDate"
							type="hidden" class="input form-control" />
						<br>
						<div class="">
							<label>Amount Sign</label>
							<form:input path="amountSign" id="amountSign"
								class="input form-control" />
							<br>
						</div>
						<div class="">
							<label>Amount </lable> <form:input
									id="amount" path="amount" class="input form-control" /><br>
						</div>
						<div class="">
							<label>Tenure Sign</label>
							<form:input path="tenureSign" id="tenureSign"
								class="input form-control" />
							<br>
						</div>
						<div class="">
							<label>Tenure </lable> <form:input
									id="tenure" path="tenure" class="input form-control" /><br>
						</div>
						<div class="">
							<label><spring:message code="label.penaltyRate" /></label>

							<form:input path="penaltyRate" id="pltyRate"
								class="input form-control" />
							<br>
						</div>
						<div class="">
							<lable> <spring:message code="label.penaltyFlatAmount" /></lable>
							<form:input path="penaltyFlatAmount" id="pltyFlatAmt"
								class="input form-control" />
							<br>
						</div>


						<input type="submit" onclick="modelSubmit(event)"
							class="btn btn-info add-row" style="" />
					</form:form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
				</div>
			</div>

		</div>
	</div>

</div>


</div>
</div>

<style type="text/css">
form {
	margin: 20px 0;
}

form input, button {
	padding: 5px;
}

table {
	width: 100%;
	margin-bottom: 20px;
	border-collapse: collapse;
}

table, th, td {
	border: 1px solid #cdcdcd;
}

table th, table td {
	padding: 10px;
	text-align: left;
}

input[type=checkbox], input[type=radio] {
	margin: 4px 1px 0px;
	margin-top: 1px\9;
	line-height: normal;
	zoom: 1.0;
}

.form-horizontal .control-label {
	padding-top: 0;
}
</style>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript">

$( document ).ready(function() {
    error();
});


function dateByProductId(date_) {
	 var dataString = 'effectiveDate='+ date_;
	$.ajax({  
	    type: "GET",  
	    url: "<%=request.getContextPath()%>/common/dataByProductId",
				contentType : "application/json",
				dataType : "json",
				data : dataString,
				async : false,
				success : function(response) {

					var trHTML = '';
					for (i = 0; i < response.length; ++i) {
						debugger
						var productConfiguration = response[i];
						trHTML += "<option value='"+productConfiguration.id+"'>"+productConfiguration.productCode+'-'+productConfiguration.productName+"</option>";
				
					}
					
					$('#productConfigurationSelector').html(trHTML);

				},

				error : function(e) {
					console.log(e);
					$('#error').html("Error occured!!");

				}
			});

	
}

function error() {
	debugger
		if("${effectiveDate}" != ""){
			var ff = new Date("${effectiveDate}");
			$("#effectiveDateList").val("${getEffectiveDate}").change();
			getPenaltyRates(ff);
			
		
	}
}


	function getPenaltyRates(ff) {
		debugger;
		var effectiveDate;
		var productConfiguratioId_ = document.getElementById('productConfigurationSelector').value;
		var isPrematureWithdraw=0;
		if($("#isWithdrawPart").prop('checked')){
			isPrematureWithdraw = 0;
		}else{
			isPrematureWithdraw = 1;
		}
		
		if(ff==undefined){
	    effectiveDate = document.getElementById('effectiveDateList').value;
		}
		else {
			var newDate=new Date(ff);
			var day = newDate.getDate();
			if(day<10){day="0"+day;}
			var month = newDate.getMonth()+1;
			if(month<10){month="0"+month;}
			var year = newDate.getFullYear();
			effectiveDate=year+"-"+day+"-"+month+" 00:00:00.0";
			$('#effectiveDateList').val(effectiveDate).change();
		}
		var dateParse = new Date(effectiveDate);
		var day = dateParse.getDate();
		var month = dateParse.getMonth()+1;
		var year = dateParse.getFullYear();
		var fullDate  = day + "/" + month + "/" + year;
		
		$("#effectiveDateHidden").val(fullDate);
		$("#effectiveDateTempDate").val(effectiveDate);
	    
	    if(effectiveDate == "" || productConfiguratioId_ == ""){
	     document.getElementById('errorMsg').style.display='block';
	     document.getElementById('errorMsg').value="Please select effective date and product *.";
	     event.preventDefault();
	     return false;
	    }
	    else
	    {   

	    	// data string
		    var dataString = 'effectiveDate='+ effectiveDate+"&productConfigurationId="+productConfiguratioId_+"&isPremature="+isPrematureWithdraw;
		                   
				// delete all rows except the first row from the table
			$("#penaltyRateTable").find("tr:gt(0)").remove();

			
			  $.ajax({  
			    type: "GET",  
			    url: "<%=request.getContextPath()%>/common/getWithdrawPenaltyList",
						contentType : "application/json",
						dataType : "json",
						data : dataString,
						async : false,
						success : function(response) {
							debugger;
							var trHTML = '';
							for (i = 0; i < response.length; ++i) {
								var data = response[i];
								trHTML += '<tr><td>'
										+ data.amountSign
										+ '</td><td>'
										+ data.amount
										+ '</td><td>'
										+ data.tenureSign
										+ '</td><td>'
										+ data.tenure
										+ '</td><td>'
										+ (data.penaltyRate == null ? ""
												: data.penaltyRate)
										+ '</td><td>'
										+ (data.penaltyFlatAmount == null ? ""
												: data.penaltyFlatAmount)
										+ '</td><td> <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal" onclick="editValue('
										+ data.id + "," + data.amountSign + ","
										+ data.amount + ","
										+ data.tenureSign + ","
										+ data.tenure + ","
										+ data.penaltyRate + ","
										+ data.penaltyFlatAmount
										+ ')">Edit</button></td></tr>';

							}
							$('#penaltyRateTable').append(trHTML);

						},

						error : function(e) {
							console.log(e);
							$('#error').html("Error occured!!");

						}
					});

		}

	}

	// 	$(document).ready(function() {
	// 		alert("Loading..");
	// 	});
	function modelSubmit(e) {
		debugger;

		/* if ($('#amtSign').val() == "" || $('#amt').val() == "") {
			alert("Amount range can not be empty");
			e.preventDefault();
			return false;

		}
		if (parseInt($('#amtFROM').val()) > parseInt($('#amtTO').val())) {
			alert("Amount From can not be greater than or equal to Amount To");
			e.preventDefault();
			return false;

		} */
		
		if ($('#amount').val() == "" ) {
			alert("Amount can not be empty");
			e.preventDefault();
			return false;

		}
		if ($('#tenure').val() == "" ) {
			alert("Tenure can not be empty");
			e.preventDefault();
			return false;

		}
		if ($('#pltyRate').val() == "" && $('#pltyFlatAmt').val() == "") {
			alert("Fill atleast one penalty rate");
			e.preventDefault();
			return false;

		}
		debugger;
		$("#wthdrawPenaltyFormEdit").attr('action', "wthdrawPenaltyFormEdit")
				.submit();

	}

	function editValue(id, amountSign, amount, tenureSign, tenure, penaltyRate, penaltyFlatAmount) {
		$("#id").val(id);
		$("#amountSign").val(amountSign);
		$("#amount").val(amount);
		$("#tenureSign").val(tenureSign);
		$("#tenure").val(tenure);
		$("#pltyRate").val(penaltyRate);
		$("#pltyFlatAmt").val(penaltyFlatAmount);
	}
</script>