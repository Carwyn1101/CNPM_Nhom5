<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<body>
	<style>
	
	.main__paginator-list {
    display: flex;
    justify-content: center;
    align-items: center;
    list-style: none;
    padding: 0;
    gap: 0px;
}

.main__paginator-list li {
    padding: 0px 0px;
    
    
    background: #1a191f;
    cursor: pointer;
}

.main__paginator-list li.paginator__item--active {
    background: #1a191f;
    color: #fff;
}

.main__paginator-list li:hover {
    background: #1a191f;
}
	
	
	
	.sign__selectjs {
    width: 716%;  /* Đảm bảo thẻ select chiếm đủ không gian của container */
    max-width: 1540px; /* Bạn có thể điều chỉnh max-width để thẻ rộng hơn */
}
	.search__keyword {
	width: 1500%;
    max-width: 450px; /* Thay đổi giá trị này để điều chỉnh độ dài */
}
	.main__title-form {
	width: 100%;
    max-width: 300px; /* Thay đổi giá trị này để điều chỉnh độ dài */
}
			
	
	</style>
	<!-- main content -->
	<main class="container-fluid">
		
		<div class="container-fluid">
			<div class="row">
			
				<!-- main title -->
				<div class="col-12">
					<div class="main__title">
						<h2>Movie</h2>

							<span class="main__title-stat">Total Movies :
								${noOfRecords}</span>
						<div class="main__title-wrap">		
							<!-- search -->
							<a
							href="${pageContext.request.contextPath}/admin/addMovie"
							class="main__title-link main__title-link--wrap">Add Movie</a>
						</div>			

					</div>
				</div>
				<div class="container-fluid">
				    <div class="row">
				        <!-- Form tìm kiếm -->
					<form action="${pageContext.request.contextPath}/admin/searchMovie" method="get">
					    <!-- Nhập từ khóa tìm kiếm -->
					    <div class="main__title-form">
					        <input type="text" class="sign__selectjs" name="keyword" 
					               placeholder="Find Movie by name.............." 
					               value="${keyword != null ? keyword : ''}">
					        <button type="submit">
					            <i class="ti ti-search"></i>
					        </button>
					    </div>
					
					    <!-- Chọn danh mục (multiple) -->
					    <select name="category" class="sign__selectjs" id="sign__genre" multiple>
					        <option value="All" <c:if test="${fn:contains(category, 'All') || empty category}">selected</c:if>>All Categories</option>
					        <option value="Action" <c:if test="${fn:contains(category, 'Action')}">selected</c:if>>Action</option>
					        <option value="Animation" <c:if test="${fn:contains(category, 'Animation')}">selected</c:if>>Animation</option>
					        <option value="Comedy" <c:if test="${fn:contains(category, 'Comedy')}">selected</c:if>>Comedy</option>
					        <option value="Crime" <c:if test="${fn:contains(category, 'Crime')}">selected</c:if>>Crime</option>
					        <option value="Drama" <c:if test="${fn:contains(category, 'Drama')}">selected</c:if>>Drama</option>
					        <option value="Fantasy" <c:if test="${fn:contains(category, 'Fantasy')}">selected</c:if>>Fantasy</option>
					        <option value="Historical" <c:if test="${fn:contains(category, 'Historical')}">selected</c:if>>Historical</option>
					        <option value="Horror" <c:if test="${fn:contains(category, 'Horror')}">selected</c:if>>Horror</option>
					        <option value="Romance" <c:if test="${fn:contains(category, 'Romance')}">selected</c:if>>Romance</option>
					        <option value="Science-fiction" <c:if test="${fn:contains(category, 'Science-fiction')}">selected</c:if>>Science-fiction</option>
					        <option value="Thriller" <c:if test="${fn:contains(category, 'Thriller')}">selected</c:if>>Thriller</option>
					        <option value="Western" <c:if test="${fn:contains(category, 'Western')}">selected</c:if>>Western</option>
					        <option value="Other" <c:if test="${fn:contains(category, 'Other')}">selected</c:if>>Other</option>
					    </select>
					
					    <!-- Duy trì giá trị recordsPerPage -->
					     <input type="hidden" name="soluong" value="${recordsPerPage}" />
					</form>
				    </div>
				</div>

				<!-- end main title -->

				<!-- items -->
				<div class="col-12">
					<div class="catalog catalog--1">
						<table class="catalog__table">
							<thead>
								<tr>
									<th>ID</th>
									<th>MovieName</th>
									<th>Category</th>
									<th>Image</th>
									<th>MovieDuration</th>									
									<th>Release Date</th>
									<th>Status</th>
									<th>Action</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="movie" items="${movies}">
									<tr>
										<td><div class="catalog__text">${movie.movieID}</div></td>
										<td><div class="catalog__text">${movie.movieName}</div></td>
										<td><div class="catalog__text">${movie.category}</div></td>
										<td><c:choose>
												<c:when test="${movie.image.substring(0,5) != 'https'}">
													<c:url value="/image?fname=${movie.image}" var="imgUrl" />
												</c:when>
												<c:otherwise>
													<c:set var="imgUrl" value="${movie.image}" />
												</c:otherwise>
											</c:choose>
											<div class="catalog__text">
												<img src="${imgUrl}" alt="${movie.image}" width="150"
													height="150" />
											</div></td>
										<td><div class="catalog__text">${movie.movieDuration}</div></td>
										
										
										<td>
    										<div class="catalog__text">
										        <fmt:formatDate value="${movie.releaseDay}" pattern="MM-dd-yyyy"/>
										    </div>
										</td>
										
										<td><div
												class="catalog__text ${movie.status ? 'catalog__text--green' : 'catalog__text--red'}">${movie.status ? 'Active' : 'Inactive'}</div></td>



										<td>
											<div class="catalog__btns">
												<a
													href="${pageContext.request.contextPath}/admin/editMovie?id=${movie.movieID}"
													class="catalog__btn catalog__btn--edit"> <i
													class="ti ti-edit"></i>
												</a>
												<button type="button" data-bs-toggle="modal"
													class="catalog__btn catalog__btn--delete"
													data-bs-target="#modal-delete"
													data-movie-id="${movie.movieID}">
													<i class="ti ti-trash"></i>
												</button>
												<a
													href="${pageContext.request.contextPath}/adminReview?movieID=${movie.movieID}"
													class="catalog__btn catalog__btn--view"> <i
													class="ti ti-eye"></i>
												</a>
											</div>
										</td>
									</tr>
								</c:forEach>
							</tbody>

						</table>
					</div>
				</div>
				<!-- end items -->

<div class="col-12">
    <div class="main__paginator">
        <!-- Hiển thị số trang hiện tại và tổng số trang -->
        <span class="main__paginator-pages">Page ${currentPage} of ${noOfPages}</span>
        
        <div class="col-1">
            <div class="sign__group">
                <label class="sign__label">Items Per Page</label>
                <form action="${pageContext.request.contextPath}/admin/searchMovie" method="get">
                    <!-- Select số lượng bản ghi -->
                    <select class="sign__select" name="soluong" id="soluong" onchange="this.form.submit()">
                        <option value="5" <c:if test="${recordsPerPage == 5}">selected</c:if>>5 items</option>
                        <option value="10" <c:if test="${recordsPerPage == 10}">selected</c:if>>10 items</option>
                        <option value="20" <c:if test="${recordsPerPage == 20}">selected</c:if>>20 items</option>
                        <option value="50" <c:if test="${recordsPerPage == 50}">selected</c:if>>50 items</option>
                    </select>

                    <!-- Hidden fields để giữ lại thông tin tìm kiếm -->
                    <input type="hidden" name="keyword" value="${keyword}" />
                    <c:forEach var="cat" items="${category}">
                        <input type="hidden" name="category" value="${cat}" />
                    </c:forEach>

                    <!-- Hidden field để giữ giá trị trang hiện tại -->
                    <input type="hidden" name="page" value="${currentPage}">
                </form>
            </div>
        </div>

        <ul class="main__paginator-list">
            <!-- Nút Previous -->
            <li class="paginator__item paginator__item--prev ${currentPage == 1 ? 'disabled' : ''}">
                <a href="<c:url value='/admin/searchMovie'>
                    <c:param name='keyword' value='${keyword}'/>
                    <c:forEach var="cat" items="${category}">
                        <c:param name="category" value="${cat}"/>
                    </c:forEach>
                    <c:param name="page" value="${currentPage > 1 ? currentPage - 1 : 1}"/>
                    <c:param name="soluong" value="${recordsPerPage}"/>
                </c:url>">
                    <i class="ti ti-chevron-left"></i>
                </a>
            </li>

            <!-- Hiển thị trang đầu nếu cần -->
            <c:if test="${currentPage > 3}">
                <li class="paginator__item">
                    <a href="<c:url value='/admin/searchMovie'>
                        <c:param name='keyword' value='${keyword}'/>
                        <c:forEach var="cat" items="${category}">
                            <c:param name="category" value="${cat}"/>
                        </c:forEach>
                        <c:param name='page' value='1'/>
                        <c:param name='soluong' value='${recordsPerPage}'/>
                    </c:url>">1</a>
                </li>
                <li class="paginator__item">...</li>
            </c:if>

            <!-- Các trang xung quanh trang hiện tại -->
            <c:set var="startPage" value="${currentPage - 2 > 1 ? currentPage - 2 : 1}" />
            <c:set var="endPage" value="${currentPage + 2 < noOfPages ? currentPage + 2 : noOfPages}" />
            <c:forEach begin="${startPage}" end="${endPage}" var="pageNumber">
                <li class="paginator__item ${pageNumber == currentPage ? 'paginator__item--active' : ''}">
                    <a href="<c:url value='/admin/searchMovie'>
                        <c:param name='keyword' value='${keyword}'/>
                        <c:forEach var="cat" items="${category}">
                            <c:param name="category" value="${cat}"/>
                        </c:forEach>
                        <c:param name='page' value='${pageNumber}'/>
                        <c:param name='soluong' value='${recordsPerPage}'/>
                    </c:url>">${pageNumber}</a>
                </li>
            </c:forEach>

            <!-- Hiển thị trang cuối nếu cần -->
            <c:if test="${currentPage < noOfPages - 2}">
                <li class="paginator__item">...</li>
                <li class="paginator__item">
                    <a href="<c:url value='/admin/searchMovie'>
                        <c:param name='keyword' value='${keyword}'/>
                        <c:forEach var="cat" items="${category}">
                            <c:param name="category" value="${cat}"/>
                        </c:forEach>
                        <c:param name='page' value='${noOfPages}'/>
                        <c:param name='soluong' value='${recordsPerPage}'/>
                    </c:url>">${noOfPages}</a>
                </li>
            </c:if>

            <!-- Nút Next -->
            <li class="paginator__item paginator__item--next ${currentPage == noOfPages ? 'disabled' : ''}">
                <a href="<c:url value='/admin/searchMovie'>
                    <c:param name='keyword' value='${keyword}'/>
                    <c:forEach var="cat" items="${category}">
                        <c:param name="category" value="${cat}"/>
                    </c:forEach>
                    <c:param name='page' value='${currentPage < noOfPages ? currentPage + 1 : noOfPages}'/>
                    <c:param name='soluong' value='${recordsPerPage}'/>
                </c:url>">
                    <i class="ti ti-chevron-right"></i>
                </a>
            </li>
        </ul>
    </div>
</div>



			</div>
			<!-- end items -->
		</div>
	</main>
	<!-- end main content -->
	<!-- delete modal -->
	<div class="modal fade" id="modal-delete" tabindex="-1"
		aria-labelledby="modal-delete" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal__content">
					<form action="${pageContext.request.contextPath}/admin/deleteMovie"
						class="modal__form">
						<h4 class="modal__title">Delete Movie</h4>

						<p class="modal__text">Are you sure to permanently delete this
							Movie?</p>
						<input type="hidden" name="id" id="deleteMovieId">
						<div class="modal__btns">
							<button class="modal__btn modal__btn--apply" type="submit">
								<span>Delete</span>
							</button>
							<button class="modal__btn modal__btn--dismiss" type="button"
								data-bs-dismiss="modal" aria-label="Close">
								<span>Dismiss</span>
							</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- end delete modal -->
	<!-- Add Item Modal -->
	<!-- add cinema modal -->
	<div class="modal fade" id="modal-add-movie" tabindex="-1"
		aria-labelledby="modal-add-movie" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered modal-xl">
			<div class="modal-content">
				<form action="${pageContext.request.contextPath}/admin/addMovie"
					method="POST" class="sign__form sign__form--add">
					<h4 class="modal__title">Add Movie</h4>
					<div class="row">
						<div class="col-12">
							<label class="sign__label" for="movie_name">Movie Name</label>
							<div class="sign__group">
								<input type="text" class="sign__input" name="movie_name"
									placeholder="Movie Name" required>
							</div>
						</div>
						<div class="col-12">
							<label class="sign__label" for="movie_name">Category</label>
							<div class="sign__group">
								<input type="text" class="sign__input" name="category"
									placeholder="Category" required>
							</div>
						</div>
						<div class="col-12">
							<label class="sign__label" for="movie_name">Movie Duration</label>
							<div class="sign__group">
								<input type="text" class="sign__input" name="movie_duration"
									placeholder="Example: 1h 30m" required>
							</div>
						</div>
						<div class="col-12">
							<label class="sign__label" for="address">Description</label>
							<div class="sign__group">
								<input type="text" class="sign__input" name="description"
									placeholder="Description" required>
							</div>
						</div>

						<div class="col-12">
							<label class="sign__label" for="location">Release Day</label>
							<div class="sign__group">
								<input type="text" class="sign__input" name="release_day"
									placeholder="Release Day" required>
							</div>
						</div>


						<div class="col-12">
							<label class="sign__label" for="status">Status</label>
							<div class="sign__group">
								<select class="sign__selectjs" name="status" id="sign__status"
									required>
									<option value="true">Active</option>
									<option value="false">Inactive</option>
								</select>
							</div>
						</div>
						<div class="col-12">
							<div class="sign__group">
								<div class="sign__gallery">
									<label id="gallery1" for="sign__gallery-upload">Upload
										cover (240x340)</label> <input data-name="#gallery1"
										id="sign__gallery-upload" name="images"
										class="sign__gallery-upload" type="file"
										accept=".png, .jpg, .jpeg" style="display: none;"
										onchange="chooseFile(this)">
								</div>
							</div>

							<div class="col-12">
								<button type="submit" class="sign__btn sign__btn--small">
									<span>Insert</span>
								</button>
							</div>
						</div>
						<div class="col-12">
							<button type="submit" class="sign__btn sign__btn--small">
								<span>Save</span>
							</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- end add cinema modal -->

	<script>
    // JavaScript to assign the cinema ID to the hidden input field in the delete form
    document.querySelectorAll('.catalog__btn--delete').forEach(button => {
        button.addEventListener('click', function () {
            const movieId = this.getAttribute('data-movie-id');
            document.getElementById('deleteMovieId').value = movieId;
        });
    });
    
    function updatePageSize() {
        const soluong = document.getElementById('soluong').value;
        const url = new URL(window.location.href);

        // Cập nhật tham số `soluong` trong URL
        url.searchParams.set('soluong', soluong);
        url.searchParams.set('page', 1); // Reset về trang 1 để tránh lỗi
        window.location.href = url.toString();
    }

    
    document.addEventListener("DOMContentLoaded", function () {
        const categorySelect = document.getElementById("sign__genre");

        // Thêm sự kiện cho phép nhấn Enter để gửi form
        document.querySelector(".main__title-form input[name='keyword']").addEventListener("keypress", function (e) {
            if (e.key === "Enter") {
                e.preventDefault();
                e.target.form.submit();
            }
        });

        // Làm nổi bật danh mục đã chọn
        const selectedCategories = "${category}".split(",");
        Array.from(categorySelect.options).forEach(option => {
            if (selectedCategories.includes(option.value)) {
                option.selected = true;
            }
        });
    });
    
    
	</script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/js/select2.min.js"></script>
	




}
</body>