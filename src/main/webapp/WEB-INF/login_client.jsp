<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Se connecter</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container">
        <h1 class="mt-5">Se connecter</h1>
        <form action="ClientServlet?action=login" method="POST" class="mt-4">
            <div class="mb-3">
                <label for="email" class="form-label">Email</label>
                <input type="email" name="email" id="email" class="form-control" placeholder="Votre email" required>
            </div>
            <div class="mb-3">
                <label for="motDePasse" class="form-label">Mot de Passe</label>
                <input type="password" name="motDePasse" id="motDePasse" class="form-control" placeholder="Votre mot de passe" required>
            </div>
            <button type="submit" class="btn btn-primary">Se connecter</button>
        </form>
        <a href="inscription.jsp" class="btn btn-link mt-3">Vous n'avez pas de compte ? S'inscrire</a>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
