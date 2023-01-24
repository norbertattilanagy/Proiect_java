<%@ page import="net.codejava.test.VarStore" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Utilizatori</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
    <style type="text/css">
        a{
            text-decoration: none;
            color: black;
        }
        a:hover {
            color: black;
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <jsp:include page="element/Navbar.jsp"></jsp:include>
    <div class="mt-3 mx-5">
        <a href="add_note" class="btn btn-dark" role="button"><i class="bi bi-plus-circle me-2"></i>Nota noua</a>
        <div class="row">
            <% for(int i=0;i< VarStore.allNote.size();i++){ %>
                <% String link = "note/" + i; %>
                <div class="col-md-4 mt-3">
                    <a href=<%=link%>>
                        <div class="card" >
                            <div class="card-header">
                                <%=VarStore.allNote.get(i).getTitle()%>
                            </div>
                            <div class="card-body">
                                <% System.out.println(VarStore.allNote.get(i).getContent().length());
                                    if (VarStore.allNote.get(i).getContent().length()<=35) { %>
                                    <p class="card-text"><%=VarStore.allNote.get(i).getContent()%></p>
                                <% } else { %>
                                    <p class="card-text"><%=VarStore.allNote.get(i).getContent().substring(0,33) + "..."%></p>
                                <% } %>
                            </div>
                        </div>
                    </a>
                </div>
            <% } %>
        </div>
    </div>
</body>
</html>