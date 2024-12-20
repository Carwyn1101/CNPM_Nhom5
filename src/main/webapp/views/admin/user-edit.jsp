<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- Mirrored from hotflix.volkovdesign.com/admin/users.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 03 Nov 2024 07:09:40 GMT -->

<c:if test="${not empty error}">
    <div class="alert alert-danger">
        ${error}
    </div>
</c:if>
<main class="container-fluid">
	<div class="container-fluid">
	<div class="main__title">

			<div class="main__title-wrap">
				<!-- search -->
				<!-- end search -->
			</div>
		</div>
		<!-- user modal -->
		<form action="${pageContext.request.contextPath}/admin/users/update?userId=${user.perID }" method="post" class="modal__form" style="margin-top: 20px;">
			
			<h4 class="modal__title">Edit User</h4>

			<div class="row">
				<div class="col-12" style="width: 50%; margin: 0 auto;">
					<div class="sign__group">
						<label class="sign__label" for="email2">Email</label> <input
							id="email2" type="email" name="email" class="sign__input"
							placeholder="email@email.com" value="${user.email}" required>
					</div>
				</div>
				<div class="col-12" style="width: 50%; margin: 0 auto;">
					<div class="sign__group">
						<label class="sign__label" for="fname">Name</label> <input
							id="fname" type="text" name="fname" class="sign__input"
							placeholder="Your name" value="${user.fullName}" required>
					</div>
				</div>

				<div class="col-12" style="width: 50%; margin: 0 auto;">
					<div class="sign__group">
						<label class="sign__label" for="password">Password</label> <input
							id="password" type="password" name="password" class="sign__input"
							value="${user.password}" required>
					</div>
				</div>
				<div class="col-12" style="width: 50%; margin: 0 auto;">
					<div class="sign__group">
						<label class="sign__label" for="phone">Phone</label> <input
							id="phone" type="tel" name="phone" class="sign__input"
							placeholder="Your phone" value="${user.phone}" required pattern="^[0-9]{10}$" title="So dien thoai phai co 10 chu so">
					</div>
				</div>
				<!-- Định dạng ngày sử dụng JSTL -->
				<fmt:formatDate value="${user.birthDate}" pattern="yyyy-MM-dd"
					var="formattedDate" />

				<div class="col-12" style="width: 50%; margin: 0 auto;">
					<div class="sign__group">
						<label class="sign__label" for="birthDate">BirthDate</label> <input
							id="birthDate" type="date" name="birthDate" class="sign__input"
							value="${formattedDate}" required >
					</div>
				</div>
				<div class="col-12" style="width: 50%; margin: 0 auto;">
					<div class="sign__group">
						<label class="sign__label" for="gender">Gender</label> <select
							class="sign__select" id="gender" name="gender"
							value="${user.gender}">
							<option value="1" ${user.gender == 1 ? 'selected' : ''}>Male</option>
							<option value="0" ${user.gender == 0 ? 'selected' : ''}>Female</option>
						</select>
					</div>
				</div>
				<div class="col-12" style="width: 50%; margin: 0; text-align: left;">
					<div class="sign__group">
						<label class="sign__label" for="rights">Rights</label> <select
							class="sign__select" id="rights" name="rights"
							value="${user.role}">
							<option value="User">User</option>
						</select>
					</div>
				</div>
			</div>
			<div class="col-12"
				style="display: flex; justify-content: center; gap: 100px;">
				<button type="submit" class="sign__btn sign__btn--modal" style="width: 150px;">Update</button>
				<a href="${pageContext.request.contextPath}/admin/users"
					class="sign__btn sign__btn--modal"
					style="width: 150px; height: 50px; font-size: 16px; text-align: center; display: flex; align-items: center; justify-content: center;">Back</a>
			</div>
	</form>
	<!-- end user modal -->
	</div>
</main>