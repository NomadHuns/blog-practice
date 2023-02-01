<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
            <title>나만의 게시판</title>
        </head>

        <body>
            <h1>회원 가입 페이지</h1>
            <hr>
            <form action="/join" method="post" onsubmit="return vaild()">
                <input id="username" type="text" name="username" placeholder="Enter username" required><br>
                <button type="button" onclick="checkUsername()">중복체크</button><br>
                <input type="password" name="password" placeholder="Enter password" required><br>
                <input type="email" name="email" placeholder="Enter email" required><br>
                <button type="submit">회원가입</button>
            </form>

            <script>
                let check = false;

                function vaild() {
                    if (check) {
                        return true;
                    }
                    alert("아이디 중복체크 해주세요");
                    return false;
                }

                function checkUsername() {
                    let username = $('#username').val();
                    $.ajax({
                        type: "get",
                        url: "/checkUsernameForJoin?username=" + username,
                    })
                        .done((res) => {
                            console.log(res);
                            alert(res.msg);
                            if (res.data == true) {
                                check = true;
                            } else {
                                check = false;
                            }
                        })
                        .fail((err) => {
                            alert(err);
                        })
                }
            </script>
        </body>

        </html>