<#-- @ftlvariable name="bookList" type="com.iggy_huo.freebooks.book.BookList" -->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Free Books</title>
</head>
<body>
    Hello World!<br>
    <#list bookList.books as book>
        <a href="${book.url}">${book.name}</a><br>
    </#list>
</body>
</html>