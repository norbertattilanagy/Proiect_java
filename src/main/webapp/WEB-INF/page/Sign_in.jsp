<%@ page import="net.codejava.test.VarStore" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>Sign in</title>
    <!--Bootsrtrap-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<% if (VarStore.verifySessionExist(request)){
    if ((Boolean) session.getAttribute("incorectSignIn")){ %>
    <div class="alert alert-danger" role="alert">
        <div class="d-flex justify-content-center">
            <i class="bi bi-exclamation-triangle-fill me-2"></i>
            Email sau parola invalida
        </div>
    </div>
<%    } session.setAttribute("incorectSignIn",false); } %>
<div class="col-lg-4 col-md-3"></div>
<div class="container my-3 col-lg-4 col-md-6">
    <div class="row d-flex justify-content-center align-items-center">
        <h1 style="text-align: center">Autentificare</h1>
        <form action="sign_in_submit" class="needs-validation" name="sign_in" method="post" novalidate>
            <div class="mb-3 mt-3">
                <label for="email">Email:</label>
                <input type="email" class="form-control" placeholder="Email" name="email" id="email" required>
                <div class="invalid-feedback">Introduceti adresa de Email</div>
            </div>
            <div class="mb-3 mt-3">
                <label for="password">Parola:</label>
                <input type="password" class="form-control" placeholder="Parola" name="password" id="password" required>
                <div class="invalid-feedback password">Introduceti parola</div>
            </div>
            <div class="form-check mb-3">
                <label class="form-check-label">
                    <input class="form-check-input" type="checkbox" name="show_password" onclick="myFunction()"> Arată parola
                </label>
            </div>
            <div class="d-grid">
                <button type="submit" class="btn btn-dark btn-block">Autentificare</button>
            </div>
            <div class="text-center">
                <br><a href="create_account">Creare cont</a>
            </div>
        </form>
    </div>
    <script>
        function myFunction() {
            var x = document.getElementById("password");
            if (x.type === "password") {
                x.type = "text";
            } else {
                x.type = "password";
            }
        }
    </script>
    <script>
        (function () {
            var forms = document.querySelectorAll('.needs-validation')
            Array.prototype.slice.call(forms).forEach(function (form) {

                form.addEventListener('submit', function (event)
                {
                    if (!form.checkValidity())
                    {
                        event.preventDefault()
                        event.stopPropagation()
                    }
                    form.classList.add('was-validated')
                }, false)
            })
        })()
    </script>
</div>
</body>
</html>