<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Connexion</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">
    <style>
        .card-form {
            max-width: 450px;
        }
       .form-control:focus {
            border-color: #198754;
            box-shadow: 0 0 5px rgba(25, 135, 84, 0.5);
        }
        .btn-success:hover {
            background-color: #157347;
        }
    </style>
</head>
<body class="bg-light">

    <!-- Navbar -->
    <nav class="navbar navbar-light bg-white shadow-sm">
        <div class="container">
            <a class="navbar-brand text-primary fw-bold" href="index.jsp">Car Rental</a>
        </div>
    </nav>

    <div class="container d-flex justify-content-center align-items-center vh-100">
        <div class="col-md-6 bg-white p-4 rounded shadow-sm card-form">
            <h2 class="text-center text-primary mb-4">Connexion</h2>

            <!-- Affichage du message d'erreur -->
            <% String errorMessage = (String) request.getAttribute("errorMessage"); %>
            <% if (errorMessage != null) { %>
                <div class="alert alert-danger text-center" role="alert">
                    <%= errorMessage %>
                </div>
            <% } %>

            <form action="ClientServlet?action=login" method="POST">
                <div class="mb-3">
                    <label for="email" class="form-label">Email</label>
                    <div class="input-group">
                        <span class="input-group-text"><i class="bi bi-envelope"></i></span>
                        <input type="email" name="email" id="email" class="form-control form-control-lg" placeholder="Votre email" required>
                    </div>
                </div>
                <div class="mb-3">
                    <label for="motDePasse" class="form-label">Mot de Passe</label>
                    <div class="input-group">
                        <span class="input-group-text"><i class="bi bi-lock"></i></span>
                        <input type="password" name="motDePasse" id="motDePasse" class="form-control form-control-lg" placeholder="Votre mot de passe" required>
                    </div>
                </div>
                <button type="submit" class="btn btn-primary w-100">Se connecter</button>
            </form>

            <p class="text-center mt-3">Vous n'avez pas de compte ? <a href="inscription.jsp" class="text-danger">S'inscrire</a></p>
            <div class="text-center">
                <a href="index.jsp" class="btn btn-link mt-2">Retour à l'accueil</a>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

