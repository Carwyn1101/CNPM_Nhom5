<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<%@ taglib prefix="fn" uri="jakarta.tags.functions"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Movie List</title>
    <!-- Owl Carousel CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/${pageContext.request.contextPath}/assets/owl.carousel.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/${pageContext.request.contextPath}/assets/owl.theme.default.min.css">
    <!-- FontAwesome for Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>
<style>
    /* Wrapper for the carousel */
    .owl-carousel-wrapper {
        position: relative;
    }

    /* Navigation buttons */
    .owl-controls .owl-buttons .owl-prev,
    .owl-controls .owl-buttons .owl-next {
        font-size: 50px;
        position: absolute;
        top: 50%;
        transform: translateY(-50%);
        color: #ffffff;
        cursor: pointer;
    }

    .owl-controls .owl-buttons .owl-prev {
        left: -50px;
    }

    .owl-controls .owl-buttons .owl-next {
        right: -50px;
    }

    .owl-controls .owl-buttons .owl-prev:hover,
    .owl-controls .owl-buttons .owl-next:hover {
        color: #ff0000; /* Red hover effect */
    }

    /* Movie item styles */
  .movie-grid {
    display: flex;
    flex-direction: column;
    background-color: #192a56; /* Màu nền của toàn bộ thẻ */
    border-radius: 10px; /* Bo góc toàn bộ khung */
    overflow: hidden; /* Đảm bảo nội dung không tràn ra ngoài */
    padding: 0; /* Xóa khoảng cách bên trong */
    margin: 0; /* Xóa khoảng cách bên ngoài */
}
   .movie-thumb {
    width: 100%; /* Chiều rộng toàn bộ vùng chứa */
    height: 300px; /* Đặt chiều cao của khung theo ý muốn (tùy chỉnh số này) */
    overflow: hidden; /* Ẩn phần hình ảnh vượt ngoài khung */
}

.movie-thumb img {
    width: 100%; /* Hình ảnh chiếm toàn bộ chiều rộng */
    height: 100%; /* Hình ảnh chiếm toàn bộ chiều cao */
    object-fit: cover; /* Lấp đầy khung mà không méo hình */
    display: block; /* Loại bỏ khoảng trống không mong muốn dưới hình ảnh */
}

    .movie-thumb img:hover {
        transform: scale(1.05);
    }

    .movie-content {
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: space-between;
         margin: 0; /* Loại bỏ khoảng cách bên ngoài */
    padding: 0; /* Loại bỏ khoảng cách bên trong */
    border-top-left-radius: 0; /* Không bo góc trên (nếu có) */
    border-top-right-radius: 0; /* Không bo góc trên (nếu có) */
    }

    .movie-title {
        font-size: 16px;
        font-weight: bold;
        margin-top: 10px;
    }

    .movie-category,
    .movie-duration {
        font-size: 14px;
        color: #555;
    }

    /* Section header styles */
    .section-header {
        text-align: center;
        margin-bottom: 20px;
    }

    .section-header h2 {
        font-size: 32px;
        font-weight: bold;
        color: #ffffff;
        margin-bottom: 10px;
        text-transform: uppercase;
        position: relative;
    }

    .section-header h2::after {
        content: '';
        display: block;
        width: 60px;
        height: 3px;
        background-color: #fbc531;
        margin: 8px auto 0;
        border-radius: 2px;
    }


.movie-title {
    text-transform: uppercase; /* Viết hoa tiêu đề */
    letter-spacing: 1px; /* Giãn cách chữ để dễ đọc hơn */
}

.movie-content span {
    line-height: 1.5; /* Tăng chiều cao dòng để dễ đọc */
}

</style>

<section class="banner-section">
    <div class="banner-bg bg_img bg-fixed" data-background="${pageContext.request.contextPath}/assets/images/banner/banner01.jpg"></div>
    <div class="container">
        <div class="banner-content">
            <h1 class="title cd-headline clip">
                <span class="d-block">book your</span> tickets for
                <span class="color-theme cd-words-wrapper p-0 m-0">
                    <b class="is-visible">Movie</b>
                </span>
            </h1>
            <p>Safe, secure, reliable ticketing. Your ticket to live entertainment!</p>
        </div>
    </div>
</section>

<!-- Movies Showing Section -->
<section class="movie-section padding-top padding-bottom">
    <div class="container">
        <div class="section-header">
            <h2 class="title">Movies Showing</h2>
        </div>
        <div class="owl-carousel-wrapper">
            <ul id="movies-showing-carousel" class="owl-carousel owl-theme">
                <c:forEach var="movie" items="${moviesShowing}">
                    <div class="movie-grid">
                        <div class="movie-thumb c-thumb">
                            <a href="${pageContext.request.contextPath}/review?movieID=${movie.movieID}">
                                <c:if test="${movie.image != null}">
                                    <c:choose>
                                        <c:when test="${movie.image.substring(0, 5) == 'https'}">
                                            <img src="${movie.image}" class="card-img-top" alt="${movie.movieName}">
                                        </c:when>
                                        <c:otherwise>
                                            <c:url value="/image?fname=${movie.image}" var="movieImgUrl"></c:url>
                                            <img src="${movieImgUrl}" class="card-img-top" alt="${movie.movieName}">
                                        </c:otherwise>
                                    </c:choose>
                                </c:if>
                            </a>
                        </div>
                        <div class="movie-content bg-one">
                            <h5 class="movie-title">
                                <a href="${pageContext.request.contextPath}/review?movieID=${movie.movieID}">${movie.movieName}</a>
                            </h5>
                            <ul class="movie-rating-percent">
                                 <li>
                                        <div class="thumb">
                                            <img src="${pageContext.request.contextPath}/assets/images/movie/tomato.png" alt="rating">
                                        </div>
                                        <span class="content">Category: ${movie.category}</span>
                                    </li>
                                    <li>
                                        <div class="thumb">
                                            <img src="${pageContext.request.contextPath}/assets/images/movie/cake.png" alt="duration">
                                        </div>
                                        <span class="content">Duration: ${movie.movieDuration}</span>
                                    </li>
                            </ul>
                        </div>
                    </div>
                </c:forEach>
            </ul>
            <div class="owl-controls clickable">
                <div class="owl-buttons">
                    <div class="owl-prev movies-showing-prev"><i class="fa fa-caret-left"></i></div>
                    <div class="owl-next movies-showing-next"><i class="fa fa-caret-right"></i></div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Movies Coming Soon Section -->
<section class="movie-section padding-top padding-bottom">
    <div class="container">
        <div class="section-header">
            <h2 class="title">Movies Coming Soon</h2>
        </div>
        <div class="owl-carousel-wrapper">
            <ul id="movies-coming-carousel" class="owl-carousel owl-theme">
                <c:forEach var="movie" items="${moviesComingSoon}">
                    <div class="movie-grid">
                        <div class="movie-thumb c-thumb">
                            <a href="${pageContext.request.contextPath}/review?movieID=${movie.movieID}">
                                <c:if test="${movie.image != null}">
                                    <c:choose>
                                        <c:when test="${movie.image.substring(0, 5) == 'https'}">
                                            <img src="${movie.image}" class="card-img-top" alt="${movie.movieName}">
                                        </c:when>
                                        <c:otherwise>
                                            <c:url value="/image?fname=${movie.image}" var="movieImgUrl"></c:url>
                                            <img src="${movieImgUrl}" class="card-img-top" alt="${movie.movieName}">
                                        </c:otherwise>
                                    </c:choose>
                                </c:if>
                            </a>
                        </div>
                        <div class="movie-content bg-one">
                            <h5 class="movie-title">
                                <a href="${pageContext.request.contextPath}/review?movieID=${movie.movieID}">${movie.movieName}</a>
                            </h5>
                            <ul class="movie-rating-percent">
                                <li>
                                        <div class="thumb">
                                            <img src="${pageContext.request.contextPath}/assets/images/movie/tomato.png" alt="rating">
                                        </div>
                                        <span class="content">Category: ${movie.category}</span>
                                    </li>
                                    <li>
                                        <div class="thumb">
                                            <img src="${pageContext.request.contextPath}/assets/images/movie/cake.png" alt="duration">
                                        </div>
                                        <span class="content">Duration: ${movie.movieDuration}</span>
                                    </li>
                            </ul>
                        </div>
                    </div>
                </c:forEach>
            </ul>
            <div class="owl-controls clickable">
                <div class="owl-buttons">
                    <div class="owl-prev movies-coming-prev"><i class="fa fa-caret-left"></i></div>
                    <div class="owl-next movies-coming-next"><i class="fa fa-caret-right"></i></div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Scripts -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
<script>
    function setEqualHeight(container) {
        let maxHeight = 0;
        $(container).each(function() {
            const thisHeight = $(this).outerHeight();
            if (thisHeight > maxHeight) {
                maxHeight = thisHeight;
            }
        });
        $(container).height(maxHeight);
    }

    $(document).ready(function() {
        // Movies Showing Carousel
        
        $('#movies-showing-carousel').owlCarousel({
            items: 4,
            loop: true,
            margin: 20,
            nav: false,
            dots: false
        });

        $('.movies-showing-prev').click(function() {
            $('#movies-showing-carousel').trigger('prev.owl.carousel');
        });

        $('.movies-showing-next').click(function() {
            $('#movies-showing-carousel').trigger('next.owl.carousel');
        });

        // Movies Coming Soon Carousel
        $('#movies-coming-carousel').owlCarousel({
            items: 4,
            loop: true,
            margin: 20,
            nav: false,
            dots: false
        });

        $('.movies-coming-prev').click(function() {
            $('#movies-coming-carousel').trigger('prev.owl.carousel');
        });

        $('.movies-coming-next').click(function() {
            $('#movies-coming-carousel').trigger('next.owl.carousel');
        });

        // Set equal heights for movie grids
        setEqualHeight('#movies-showing-carousel .movie-grid');
        setEqualHeight('#movies-coming-carousel .movie-grid');
    });
</script>
</body>
</html>