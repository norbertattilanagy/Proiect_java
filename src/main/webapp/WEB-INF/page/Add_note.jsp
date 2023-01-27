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
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>
<body>
<jsp:include page="element/Navbar.jsp"></jsp:include>
<div class="mt-3 mx-5">
    <% if(VarStore.editNote){ %>
        <div class="mt-3">
            <button type="button" class="btn btn-outline-danger" data-bs-toggle="modal" data-bs-target="#Delete_note"><i class="bi bi-trash -fill me-2"></i>Sterge nota</button>
        </div>
    <% }
        int x=0;
        String title="";
        String content="";
        String link = "add_note_submit";
        if(VarStore.editNote){
            title = VarStore.allNote.get(VarStore.noteIndex).getTitle();
            content = VarStore.allNote.get(VarStore.noteIndex).getContent();
            link = "edit_note_submit";
            System.out.println(content);
            x=VarStore.checkOptions.size();
        } %>
    <form action="<%=link%>" method="post">
        <div class="mt-3">
            <label for="title" class="form-label"><b>Titlu:</b></label>
            <input type="text" class="form-control" id="title" name="title" value="<%=title%>">
        </div>
        <div class="mt-3">
            <label for="content" class="form-label"><b>Continut:</b></label>
            <textarea class="form-control" id="content" name="content" rows="5"><%=content%></textarea>
        </div>
        <div class="mt-3">
            <button class="btn btn btn-outline-dark add_checklist "><i class="bi bi-ui-checks me-2"></i>Caseta de selectare</button>
        </div>
        <div class="input_fields mt-3">
            <% if(VarStore.editNote){
                for(int i=0;i<VarStore.checkOptions.size();i++){ %>
            <div class="input-group mt-3">
                <input type="text" class="form-control" id="option" name="option[]" value="<%=VarStore.checkOptions.get(i).getOption()%>"/>
                <span class="input-group-text remove_field">
                    <a href="#" class="link-dark">
                        <i class="bi bi-dash-circle"></i>
                    </a>
                </span>
            </div>
            <% } } %>
        </div>
        <div class="mt-3">
            <button class="btn btn-outline-dark add_field_button"><i class="bi bi-plus-circle me-2"></i>Adaugă opțiune</button>
        </div>
        <div class="d-grid mt-3 mb-3">
            <button type="submit" class="btn btn-dark btn-block">Salvează</button>
        </div>
    </form>
</div>

<!--Modal--Delete-account--->
<div class="modal fade" id="Delete_note">
    <div class="modal-dialog">
        <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">Șterge Notă</h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal" data-bs-target="#Delete_note"></button>
            </div>
            <!-- Modal body -->
            <div class="modal-body">
                <div class="d-flex justify-content-center">
                    <p>Sunteși sigur că vreți să ștergeți nota?</p>
                </div>
                <div class="d-flex justify-content-around">
                    <div class="d-grid gap-1 col-4">
                        <a href="delete_account" class="btn btn-danger">Da</a>
                    </div>
                    <div class="d-grid gap-1 col-4">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" data-bs-target="#Delete_note">Nu</button>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>

</body>
</html>
<script type="text/javascript">
    $(document).ready(function() {
        var x=<%=x%>;
        var min_fields=1;
        var wrapper=$(".input_fields");
        var add_button=$(".add_field_button");
        var add_checklist=$(".add_checklist");

        if (x==0)
            $(add_button).hide();
        else
            $(add_checklist).hide();

        $(add_checklist).click(function(e){
            e.preventDefault();
            $(wrapper).show();
            $(add_checklist).hide();
            x++;
            $(wrapper).append('<div class="input-group mt-3"><input type="text" class="form-control" id="option"' +
                ' name="option[]" value=""/><span class="input-group-text remove_field">' +
                '<a href="" class="link-dark"><i class="bi bi-dash-circle"></i></a></span></div>');
            $(add_button).show();
        });

        $(add_button).click(function(e){
            e.preventDefault();
            x++;
            $(wrapper).append('<div class="input-group mt-3"><input type="text" class="form-control" id="option"' +
                ' name="option[]" value=""/><span class="input-group-text remove_field">' +
                '<a href="" class="link-dark"><i class="bi bi-dash-circle"></i></a></span></div>');
        });

        $(wrapper).on("click",".remove_field", function(e){ //user click on remove text
            e.preventDefault();
            if(x > min_fields){
                $(this).parent('div').remove();
                x--;
            }
            else{
                $(this).parent('div').remove();
                x--;
                $(add_checklist).show();
                $(add_button).hide();
            }
        })
    });
</script>