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
    <form action="add_note_submit" method="post">
        <div class="mt-3">
            <label for="title" class="form-label"><b>Titlu:</b></label>
            <input type="text" class="form-control" id="title" name="title" value="">
        </div>
        <div class="mt-3">
            <label for="content" class="form-label"><b>Continut:</b></label>
            <textarea class="form-control" id="content" name="content" value="" rows="5"></textarea>
        </div>
        <div class="mt-3">
            <button class="btn btn btn-outline-dark add_checklist "><i class="bi bi-ui-checks me-2"></i>Caseta de selectare</button>
        </div>
        <div class="input_fields mt-3"></div>
        <div class="mt-3">
            <button class="btn btn-outline-dark add_field_button"><i class="bi bi-plus-circle me-2"></i>Adaugă opțiune</button>
        </div>
        <div class="d-grid mt-3 mb-3">
            <button type="submit" class="btn btn-dark btn-block">Salvează</button>
        </div>
    </form>
</div>
</body>
</html>
<script type="text/javascript">
    $(document).ready(function() {
        var x=0;
        var min_fields=1;
        var wrapper=$(".input_fields");
        var add_button=$(".add_field_button");
        var add_checklist=$(".add_checklist");

        $(add_button).hide();

        $(add_checklist).click(function(e){
            e.preventDefault();
            $(wrapper).show();
            $(add_checklist).hide();
            x++;
            $(wrapper).append('<div class="input-group mt-3"><input type="text" class="form-control" id="option"' +
                ' name="option[]" value=""/><span class="input-group-text remove_field">' +
                '<a href="#" class="link-dark"><i class="bi bi-dash-circle"></i></a></span></div>');
            $(add_button).show();
        });

        $(add_button).click(function(e){
            e.preventDefault();
            x++;
            $(wrapper).append('<div class="input-group mt-3"><input type="text" class="form-control" id="option"' +
                ' name="option[]" value=""/><span class="input-group-text remove_field">' +
                '<a href="#" class="link-dark"><i class="bi bi-dash-circle"></i></a></span></div>');
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