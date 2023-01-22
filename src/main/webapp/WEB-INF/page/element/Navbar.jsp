<%@ page import="net.codejava.test.VarStore" %>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="/">Notepad</a>
        <div class="collapse navbar-collapse" id="navbar">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="#">Home</a>
                </li>
            </ul>
            <ul class="navbar-nav justify-content-end">
                <% if (VarStore.userAdmin){ %>
                    <li class="nav-item">
                        <a class="nav-link" aria-current="page" href="users">Utilizatori</a>
                    </li>
                <% } %>
                <li class="nav-item">
                    <a class="nav-link" aria-current="page" href="my_account">Contul meul</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" aria-current="page" href="#">Deconectare</a>
                </li>
            </ul>
        </div>
    </div>
</nav>