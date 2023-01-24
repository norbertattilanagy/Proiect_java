<%@ page import="net.codejava.test.VarStore" %>
<%@ page import="java.util.List" %>
<%@ page import="net.codejava.test.model.CheckOption" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Utilizatori</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>
<body>
<jsp:include page="element/Navbar.jsp"></jsp:include>
<div class="mt-3 mx-5">
    <div class="my-3">
        <a href="edit_note" class="btn btn-outline-secondary btn-sm">Editeaza</a>
    </div>
    <h4><%=VarStore.allNote.get(VarStore.noteIndex).getTitle()%></h4>
    <p style="white-space: pre-wrap;"><%=VarStore.allNote.get(VarStore.noteIndex).getContent()%></p>
    <form action="submit_note_checkbox" id="checkform" name="checkform" method="post">
        <div class="ms-3">
            <% for(int i=0;i<VarStore.checkOptions.size();i++){ %>
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" value="" id="option" name="option[]" checked hidden>
                    <% if(VarStore.checkOptions.get(i).getChecked()){ %>
                        <input class="form-check-input" type="checkbox" value="<%=VarStore.checkOptions.get(i).getId()%>" id="option" name="option[]" checked>
                    <% } else { %>
                        <input class="form-check-input" type="checkbox" value="<%=VarStore.checkOptions.get(i).getId()%>" id="option" name="option[]">
                    <% } %>
                    <label class="form-check-label" for="option">
                        <%=VarStore.checkOptions.get(i).getOption()%>
                    </label>
                </div>
            <% } %>
        </div>
        <div class="mt-3">
            <button type="submit" class="btn btn-outline-secondary btn-sm">Salveaza</button>
        </div>
    </form>

</div>

</body>
</html>
