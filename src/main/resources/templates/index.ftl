<#-- @ftlvariable name="bookShelf" type="com.iggy_huo.freebooks.book.BookShelf" -->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Free Books</title>
    <link rel="stylesheet" href="/css/bootstrap.css"/>
    <link rel="stylesheet" href="/css/all.css"/>
    <style type="text/css">
        .banner {
            position: relative;
            width: 100%;
            height: 300px;
        }

        .banner-image {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .banner-overlay {
            background-color: orangered;
            width: 100%;
            height: 100%;
            position: absolute;
            top: 0;
            opacity: 0.4;
        }

        .banner-words {
            width: 80%;
            height: 100%;
            padding: 70px 30px;
            position: absolute;
            top: 0;
        }

        .lang-indep-category-bg {
            /*background-color: lightskyblue;*/
            background-image: url("/img/coding.jpeg");
            background-repeat: no-repeat;
            background-position: center;
            background-size: cover;
            opacity: 0.05;
            z-index: -1;
            position: absolute;
            top: 0;
        }

        .lang-dep-category-bg {
            /*background-color: lightgray;*/
            background-image: url("/img/language.jpg");
            background-repeat: no-repeat;
            background-position: center;
            background-size: cover;
            opacity: 0.05;
            z-index: -1;
            position: absolute;
            top: 0;
        }

        .shelf {
            border: 5px #9E5D08 solid;
        }

        .row {
            margin: 0;
        }

        .col {
            padding: 0;
            height: 200px;
            border: 5px #9E5D08 solid;
            overflow: hidden;
        }

        .books {
            border-top: 15px solid black;
            border-left: 10px solid black;
            padding-top: 10px;
        }

        .books-skew {
            padding-left: 26px;
        }

        .book {
            width: 40px;
            height: 100%;
            border: 1px #17a2b8 solid;
            writing-mode: vertical-rl;
            margin-right: 1px;
        }

        .book-skew {
            transform: rotate(-20deg);
        }

        .book-bg-orangered {
            background-color: orangered;
        }

        .book-bg-deepskyblue {
            background-color: deepskyblue;
        }

        .book-bg-purple {
            background-color: purple;
        }

        .book-bg-darkcyan {
            background-color: darkcyan;
        }

        .book-name {
            font-size: x-small;
            width: 100%;
            height: 90%;
            overflow: hidden;
        }

        .book-name a {
            width: 100%;
        }

        .anchor {
            position: absolute;
            top: 0;
            right: 0;
            z-index: 1;
        }

        .footer {
            height: 56px;
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="#">Free Books</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarToggler" aria-controls="navbarToggler" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
    
        <div class="collapse navbar-collapse" id="navbarToggler">
            <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
                <li class="nav-item active">
                    <a class="nav-link" href="#"><i class="fas fa-home mr-1"></i>Home <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="https://github.com/huoyijie/free-books"><i class="fas fa-star mr-1"></i>Star Project</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="https://github.com/huoyijie/"><i class="fab fa-github mr-1"></i>Github </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="https://huoyijie.github.io/"><i class="fas fa-blog mr-1"></i>Blog </a>
                </li>
            </ul>
        </div>
    </nav>
    <div class="banner">
        <img src="/img/books.jpg" class="banner-image" alt="banner image">
        <div class="banner-overlay"></div>
        <div class="banner-words h2 text-white text-uppercase"><strong>free, open source</strong> e-books & articles navigation</div>
    </div>
    <div class="w-100 row">
        <div class="lang-indep-category col-12 col-md-6 p-0">
            <div class="w-100 h-100 p-4">
                <#list bookShelf.lanIndepCategoryList as category>
                    <a href="#${category}" class="catalog btn btn-outline-info mb-1">${category}</a>
                </#list>
            </div>
            <div class="lang-indep-category-bg w-100 h-100"></div>
        </div>
        <div class="lang-dep-category col-12 col-md-6 p-0">
            <div class="w-100 h-100 p-4">
                <#list bookShelf.langDepCategoryList as category>
                    <a href="#${category}" class="catalog btn btn-outline-info mb-1">${category}</a>
                </#list>
            </div>
            <div class="lang-dep-category-bg w-100 h-100"></div>
        </div>
    </div>
    <div class="shelf w-100">
        <div class="row">
            <#list bookShelf.boxList as box>
                <div class="col col-12 col-sm-6 col-md-4 col-lg-3 bg-light">
                    <div class="books books-${box.bookSkew} w-100 h-100 d-flex flex-row align-items-end">
                        <#list box.bookList as book>
                            <#list box.anchorBookNameList as anchor>
                                <#if anchor == book.name>
                                    <a name="${book.category}" id="anchor-${book.category}" class="anchor h1 font-weight-bold text-warning p-4"></a>
                                </#if>
                            </#list>
                            <div class="book book-bg-${box.bookBgColor} book-${box.bookSkew}">
                                <div class="book-name text-center my-auto text-nowrap">
                                    <a href="${book.url}" class="d-block px-2 text-white">${book.name}</a>
                                </div>
                            </div>
                        </#list>
                    </div>
                </div>
            </#list>
        </div>
    </div>
    <div class="footer bg-light w-100">
        <div class="text-center text-muted p-4">
            @ 2018 huoyijie. 内容来源于<mark><a href="https://github.com/EbookFoundation/free-programming-books">free-programming-books</a></mark><br>
            <a class="nav-link" href="https://github.com/huoyijie/free-books"><i class="fas fa-star mr-1"></i>Star Project</a>
        </div>
    </div>

    <script type="text/javascript">
        (function() {
            var hm = document.createElement("script");
            hm.src = "//tajs.qq.com/stats?sId=66145128";
            var s = document.getElementsByTagName("script")[0];
            s.parentNode.insertBefore(hm, s);
        })();
    </script>
    <script src="/js/jquery-3.3.1.slim.js"></script>
    <script src="/js/popper.js"></script>
    <script src="/js/bootstrap.js"></script>
    <script src="/js/all.js"></script>
    <script type="text/javascript">
        (function() {
            $('.catalog').click(function (e){
                var category = e.target.innerText;
                var $anchor = $('#anchor-' + category);
                $anchor.append(category);
                setTimeout(function () {
                    $anchor.text('');
                }, 3000);
            });
        })();
    </script>
</body>
</html>