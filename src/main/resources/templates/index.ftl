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
    </style>
</head>
<body>
    <div class="shelf w-100">
        <div class="row">
            <#list bookShelf.boxList as box>
                <div class="col col-12 col-sm-6 col-md-4 col-lg-3 bg-light">
                    <div class="books books-${box.bookSkew} w-100 h-100 d-flex flex-row align-items-end">
                        <#list box.bookList as book>
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

    <script src="/js/jquery-3.3.1.slim.js"></script>
    <script src="/js/popper.js"></script>
    <script src="/js/bootstrap.js"></script>
    <script src="/js/all.js"></script>
</body>
</html>