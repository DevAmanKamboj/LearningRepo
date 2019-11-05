<%@include file="taglib_includes.jsp"%>
<div class="right-container" id="right-container">
        <div class="container-fluid">
  
<script src="<%=request.getContextPath()%>/resources/js/bootstrap.min.js"></script>
<div class="edit-am-profile">

		<div class="p_content">
			<form:form action="confirmEditVPProfile" name="editProfile"
				autocomplete="off" commandName="endUserForm"
				onsubmit="return val();">
				<div class="Pro_img1" style="text-align: center;">
				 <c:if test="${! empty endUserForm.imageName}">
        <img src="${endUserForm.imageName}" class="img_pro">
        </c:if>
       <c:if test="${empty endUserForm.imageName}">
        <img class="img_pro">
        </c:if>
					<div id="drop" style="margin-top: 15px;">

						<a href="#" id='modal-launcher' data-toggle="modal"
							data-target="#login-modal" data-id="${endUserForm.id}"
							class="open-dialog btn btn-primary" id="cancel"><spring:message
								code="label.uploadPhoto" /></a>


					</div>
				</div>
				<div class="col-sm-12 col-md-12 col-lg-12">&nbsp;</div>
				<div class="form_page">
					<form:hidden path="id" />
					<form:hidden path="transactionId" />
					<table style="margin:0px auto;" width="600">


						<tr>
							<td><label for=""><spring:message
										code="label.userName" /></label></td>
							<td><form:input path="userName"
									class="myform-control" id="userName" autocomplete="off"
									readonly="true"></form:input></td>
						</tr>
						<tr>
							<td><label for=""><spring:message
										code="label.displayName" /></label></td>
							<td><form:input path="displayName"
									class="myform-control" id="displayName"
									placeholder="Enter DispalyName" autocomplete="off"></form:input></td>
						</tr>
						<tr>
							<td><label for=""><spring:message
										code="label.email" /></label></td>
							<td><form:input path="email"
									placeholder="Enter Email" class="myform-control" id="email"
									autocomplete="off"></form:input>
								<div id="EmailError" class="error col-sm-12"
									style="display: none;">
									<font color="red"><spring:message
											code="label.validation" /></font>
								</div></td>
						</tr>
						<tr>
							<td><label for=""><spring:message
										code="label.altEmail" /></label></td>
							<td><form:input path="altEmail"
									class="myform-control" id="altEmail"
									placeholder="Enter Alternate Email" autocomplete="off"></form:input>
								<div id="altEmailError" class="error col-sm-12"
									style="display: none;">
									<font color="red"><spring:message
											code="label.validation" /></font>
								</div></td>
						</tr>
						<tr>
							<td><label for=""><spring:message
										code="label.contactNumber" /></label></td>
							<td><form:input path="contactNo"
									class="myform-control" id="contactNo"
									placeholder="Enter Contact Number" autocomplete="off"></form:input>
								<div id="contactNoError" class="error col-sm-12"
									style="display: none;">
									<font color="red"><spring:message
											code="label.validation" /></font>
								</div></td>
						</tr>
						<tr>
							<td><label for=""><spring:message
										code="label.altContactNo" /></label></td>
							<td><form:input path="altContactNo"
									class="myform-control" id="altContactNo"
									placeholder="Enter Alternate ContactNumber" autocomplete="off"></form:input>
								<div id="altContactNoError" class="error col-sm-12"
									style="display: none;">
									<font color="red"><spring:message
											code="label.validation" /></font>
								</div></td>
						</tr>

						<tr><td>&nbsp;</td></tr>
						<tr>
							<td><a
								href="editVPPWD?id=${model.user.id}" style="color: #f89406;"><spring:message
										code="label.changePassword" /></a></td>
							<td><a style="display:none;" href="apprMng"
								class="btn btn-success"><spring:message code="label.back" /></a> <input type="submit"
								value="<spring:message code="label.confirm"/>"
								class="btn btn-primary"> </td>
						</tr>
					</table>
				</div>
			</form:form>
		</div>
</div>
<section>
	<div class="container">
		<div class="modal fade" id="login-modal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header login_modal_header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h3 class="modal-title" id="myModalLabel">
							<spring:message code="label.uploadImage" />
						</h3>
					</div>
					<div class="modal-body login-modal">
						<div class="clearfix"></div>
						<div id='social-icons-conatainer'>
							<div class='modal-body-left'>
								<form:form action="updateImageForProfile"
									commandName="endUserForm" enctype="multipart/form-data">
									<div class="form-group">
										<form:hidden path="id" value="" id="id" />

										<form:input path="file" type="file"
											onchange="checkfile(this);" id="imageFile" />
									</div>

									<input type="submit" class="btn btn-primary" value="Upload">
									<button class="btn" data-dismiss="modal" aria-hidden="true">
										<spring:message code="label.close" />
									</button>
								</form:form>
							</div>
						</div>
						<div class="clearfix"></div>
					</div>

				</div>
			</div>
		</div>
	</div>
</section>

<script>
	
		function checkfile(sender) {
			var validExts = new Array(".bmp", ".dib", ".JPG", ".jpg", ".jpeg",
					".jpe", ".jfif", ".gif", ".tif", ".tiff", ".png");
			var fileExt = sender.value;
			fileExt = fileExt.substring(fileExt.lastIndexOf('.'));
			if (validExts.indexOf(fileExt) < 0) {
				alert("Invalid file selected, valid files are of "
						+ validExts.toString() + " types.");
				var fld = document.getElementById("imageFile");

				fld.form.reset();
				fld.focus();
			}
		}

		$(document).on("click", ".open-dialog", function() {
			$(".modal-body #id").val($(this).data('id'));

		});
	</script>
<script>
			
				
	function val() {

		var phoneNum = /^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$/;
		var reg = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;

		var altContactNo = document.getElementById('altContactNo').value;
		var contactNo = document.getElementById('contactNo').value;
		var canSubmit = true;

		if (altContactNo
				.match(/^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$/)
				|| (altContactNo == '')) {

			document.getElementById('altContactNoError').style.display = 'none';

		} else {
			document.getElementById('altContactNoError').style.display = 'block';
			canSubmit = false;
		}

		if (altEmail.value
				.match(/^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/)
				|| (document.getElementById('altEmail').value == '')) {

			document.getElementById('altEmailError').style.display = 'none';

		} else {
			document.getElementById('altEmailError').style.display = 'block';
			canSubmit = false;
		}

		if (email.value
				.match(/^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/)
				&& !(document.getElementById('email').value == '')) {

			document.getElementById('EmailError').style.display = 'none';

		} else {
			document.getElementById('EmailError').style.display = 'block';
			canSubmit = false;
		}

		if (contactNo
				.match(/^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$/)
				&& !(contactNo == '')) {

			document.getElementById('contactNoError').style.display = 'none';

		} else {
			document.getElementById('contactNoError').style.display = 'block';
			canSubmit = false;
		}

		if (canSubmit == false) {
			return false;
		}
	}
</script>
