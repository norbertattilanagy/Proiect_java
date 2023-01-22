<%@ page import="net.codejava.test.VarStore" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Utilizatori</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
    <script src="assets\js\bootstrap.bundle.min.js"></script>
</head>
<body>
    <jsp:include page="element/Navbar.jsp"></jsp:include>
    <div class="card" style="width: 60%; margin: auto;">
        <div class="card-body">
            <h3 class="card-title">Informatii cont</h3>
            <h5><b>Nume:</b> <%=VarStore.allUsers.get(VarStore.myUserIndex).getName()%></h5>
            <h5><b>Email:</b> <%=VarStore.allUsers.get(VarStore.myUserIndex).getEmail()%></h5>
            <div class="d-grid mt-3">
                <button type="button" class="btn btn-primary btn-block" data-bs-toggle="modal" data-bs-target="#Edit_profile_data">Editeză datele</button>
            </div>
            <div class="d-grid mt-3">
                <button type="button" class="btn btn-primary btn-block" data-bs-toggle="modal" data-bs-target="#Change_password">Schimbă parola</button>
            </div>
            <div class="d-grid mt-3">
                <button type="button" class="btn btn-danger btn-block" data-bs-toggle="modal" data-bs-target="#Delete_account">Șterge contul</button>
            </div>
        </div>
    </div>

    <!--Modal--Edit-profile-data-->
    <div class="modal fade" id="Edit_profile_data">
        <div class="modal-dialog">
            <div class="modal-content">
                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">Editează datele</h4>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" data-bs-target="#Edit_profile_data"></button>
                </div>
                <!-- Modal body -->
                <div class="modal-body">
                    <form action="edit_user_data" class="needs-validation" method="post" novalidate>
                        <div class="mb-3">
                            <label for="name">Nume:</label>
                            <input type="text" class="form-control" id="name" name="name" value="<%=VarStore.allUsers.get(VarStore.myUserIndex).getName()%>" onClick="this.select();" required>
                            <div class="invalid-feedback">Introduceți numele</div>
                        </div>
                        <div class="mb-3">
                            <label for="email">Email:</label>
                            <input type="email" class="form-control" id="email" name="email" value="<%=VarStore.allUsers.get(VarStore.myUserIndex).getEmail()%>" onClick="this.select();" required>
                            <div class="invalid-feedback">Introduceți email-ul</div>
                        </div>
                        <div class="d-grid">
                            <button type="submit" class="btn btn-secondary btn-block mt-3">Salvează</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!--Modal--Change-password-->
    <div class="modal fade" id="Change_password">
        <div class="modal-dialog">
            <div class="modal-content">
                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">Schimbă parola</h4>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" data-bs-target="#Change_password"></button>
                </div>
                <!-- Modal body -->
                <div class="modal-body">
                    <form action="edit_user_password" class="needs-validation" method="post" novalidate>
                        <div class="mb-3">
                            <label for="old_password">Parolă veche:</label>
                            <input type="password" class="form-control" id="old_password" name="old_password" required>
                            <div class="invalid-feedback old_password"><p id="op">Introduceți parola veche</p></div>
                        </div>
                        <div class="mb-3">
                            <label for="new_password1">Parolă nouă:</label>
                            <input type="password" class="form-control" id="new_password1" name="new_password1" required>
                            <div class="invalid-feedback new_password1"><p id="np1">Introduceți o parolă nouă</p></div>
                        </div>
                        <div class="mb-3">
                            <label for="new_password2">Confirmare parolă:</label>
                            <input type="password" class="form-control" id="new_password2" name="new_password2" required>
                            <div class="invalid-feedback new_password2"><p id="np2">Introduceți o parolă nouă</p></div>
                        </div>
                        <div class="d-grid">
                            <button type="submit" class="btn btn-secondary btn-block mt-3">Salvează</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>



</body>
</html>

<script type="text/javascript">//form verification
var correct_old_password=<%=VarStore.allUsers.get(VarStore.myUserIndex).getPassword()%>;
var old_password=document.getElementById("old_password");
var new_password1=document.getElementById("new_password1");
var new_password2=document.getElementById("new_password2");
(function () {

    var forms = document.querySelectorAll('.needs-validation')
    Array.prototype.slice.call(forms).forEach(function (form) {

        form.addEventListener('submit', function (event)
        {
            if (!form.checkValidity())
            {
                validateOld_password();
                event.preventDefault()
                event.stopPropagation()
            }
            form.classList.add('was-validated')
        }, false)
    })
})()

function validatePassword(){
    if(new_password1.value=="")
    {
        $("#np1").remove();
        $(".new_password1").append(`<p id="np1">Introduceți o parolă</p>`);
    }
    if(new_password2.value=="")
    {
        $("#np2").remove();
        $(".new_password2").append(`<p id="np2">Introduceți o parolă</p>`);
    }
    if(new_password1.value!=new_password2.value) {
        $("#np1").remove();
        $("#np2").remove();
        $(".new_password1").append(`<p id="np1">Parola nu coincide</p>`);
        $(".new_password2").append(`<p id="np2">Parola nu coincide</p>`);

        new_password1.setCustomValidity(' ');
        new_password2.setCustomValidity(' ');
    } else {
        new_password1.setCustomValidity('');
        new_password2.setCustomValidity('');
    }
}
new_password1.onchange = validatePassword;
new_password2.onkeyup = validatePassword;

function validateOld_password(){
    if(old_password.value=="")
    {
        $("#op").remove();
        $(".old_password").append(`<p id="op">Introduceți parola veche</p>`);
    }
    if(old_password.value!=correct_old_password && old_password.value!=""){
        $("#op").remove();
        $(".old_password").append(`<p id="op">Parolă incorectă</p>`);
        old_password.setCustomValidity(' ');
    } else {
        old_password.setCustomValidity('');
    }
}
old_password.onchange = validateOld_password;
</script>