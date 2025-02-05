<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Connexion Admin</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h2>Connexion Administrateur</h2>
        
        <% 
            String errorMessage = (String) request.getAttribute("errorMessage");
            if (errorMessage != null) {
        %>
            <div class="alert alert-danger">
                <%= errorMessage %>
            </div>
        <% 
            }
        %>

        <form action="admin?action=login" method="POST">
            <div class="mb-3">
                <label for="email" class="form-label">Nom d'utilisateur</label>
                <input type="text" class="form-control" id="email" name="user" required>
            </div>
            <div class="mb-3">
                <label for="password" class="form-label">Mot de passe</label>
                <input type="password" class="form-control" id="password" name="pass" required>
            </div>
            <button type="submit" class="btn btn-primary">Se connecter</button>
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
