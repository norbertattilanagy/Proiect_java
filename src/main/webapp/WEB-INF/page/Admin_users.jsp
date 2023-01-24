<%@ page import="net.codejava.test.model.User" %>
<%@ page import="java.util.List" %>
<%@ page import="org.springframework.beans.factory.annotation.Autowired" %>
<%@ page import="net.codejava.test.services.UserServices" %>
<%@ page import="net.codejava.test.controler.UserControler" %>
<%@ page import="net.codejava.test.VarStore" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <title>Proiect</title>
</head>
<body>
<jsp:include page="element/Navbar.jsp"></jsp:include>
<div class="mx-5 mt-3">
    <form action="search_users" method="post">
        <div class="input-group">
            <input class="form-control me-2" id="search" name="search" type="search" placeholder="Cautare"
                   value="<%=VarStore.userSearch%>" aria-label="Search">
            <button type="submit" class="input-group-text btn-primary"><i class="bi bi-search me-2"></i> Cautare
            </button>
        </div>
    </form>
    <table class="table mt-3">
        <thead>
        <tr>
            <th scope="col">No.</th>
            <th scope="col">Name</th>
            <th scope="col">Email</th>
            <th>Admin</th>
        </tr>
        </thead>
        <tbody>
        <% for (int i = 0; i < VarStore.allUsers.size(); i++) {
            if (VarStore.allUsers.get(i).getName().contains(VarStore.userSearch) || VarStore.allUsers.get(i).getEmail().contains(VarStore.userSearch)) { %>
        <tr>
            <% String link = "admin_user/" + i; %>
            <th scope="row"><%=i + 1%></th>
            <td><%=VarStore.allUsers.get(i).getName()%></td>
            <td><%=VarStore.allUsers.get(i).getEmail()%></td>
            <% if(VarStore.allUsers.get(i).getAdmin()){ %>
            <td><a href="<%=link%>" style="color: black"><i class="bi bi-toggle-on" style="font-size:20px"></i></a></td>
            <% } else {%>
            <td><a href="<%=link%>" style="color: black"><i class="bi bi-toggle-off" style="font-size:20px"></i></a></td>
            <% } %>
        </tr>
        <% } } %>
        </tbody>
    </table>
</div>
</body>
</html>