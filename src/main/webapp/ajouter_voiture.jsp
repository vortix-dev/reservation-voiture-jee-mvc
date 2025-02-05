<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%  if (session.getAttribute("admin") == null) {
        response.sendRedirect("admin_login.jsp");
    } %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ajouter une Voiture</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
   <div class="d-flex" id="wrapper">
        <!-- Sidebar -->
        <div class="bg-success text-white border-right" id="sidebar">
            <div class="sidebar-header text-center py-4">
                <h4>Gestion de Voitures</h4>
            </div>
            <div class="list-group list-group-flush">
                <a href="ajouter_voiture.jsp" class="list-group-item list-group-item-action text-white bg-success">Ajouter voiture</a>
                <a href="admin_dashboard.jsp" class="list-group-item list-group-item-action text-white bg-success">Gerer voiture</a>
                <a href="gerer_reservation.jsp" class="list-group-item list-group-item-action text-white bg-success">Gérer reservations</a>
                <a href="admin?action=logout" class="list-group-item list-group-item-action text-white bg-danger">Logout</a>
            </div>
        </div>

        <!-- Page Content -->
        <div id="page-content-wrapper">
            <nav class="navbar navbar-expand-lg navbar-light bg-success text-white">
                <button class="btn btn-light" id="menu-toggle">☰</button>
                <a class="navbar-brand mx-auto text-white" href="#">Admin Dashboard</a>
            </nav>

            <div class="container-fluid mt-5">
                <h1 class="text-success">Ajouter une Voiture</h1>
                <form action="voiture?action=add" method="POST">
                    <div class="mb-3">
                        <label for="img" class="form-label">Image de la Voiture</label>
                        <input type="text" name="img" id="img" class="form-control" placeholder="URL de l'image" required>
                    </div>
                    <div class="mb-3">
                        <label for="marque" class="form-label">Marque</label>
                        <input type="text" name="marque" id="marque" class="form-control" placeholder="Marque de la voiture" required>
                    </div>
                    <div class="mb-3">
                        <label for="modele" class="form-label">Modèle</label>
                        <input type="text" name="modele" id="modele" class="form-control" placeholder="Modèle de la voiture" required>
                    </div>
                    <div class="mb-3">
                        <label for="prix" class="form-label">Prix</label>
                        <input type="number" name="prix" id="prix" class="form-control" placeholder="Prix de la voiture" step="0.01" required>
                    </div>
                    <div class="mb-3">
                        <label for="disponible" class="form-label">Disponible</label>
                        <select name="disponible" id="disponible" class="form-control" required>
                            <option value="true">Disponible</option>
                            <option value="false">Indisponible</option>
                        </select>
                    </div>
                    <button type="submit" class="btn btn-success">Ajouter la Voiture</button>
                </form>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    
    <script>
        // Toggle Sidebar (Mobile version)
        document.getElementById('menu-toggle').addEventListener('click', function () {
            document.getElementById('sidebar').classList.toggle('toggled');
        });
    </script>

    <style>
        #wrapper {
            display: flex;
            width: 100%;
        }
        #sidebar {
            width: 250px;
            height: 100vh;
            position: fixed;
            left: 0;
            top: 0;
        }
        #page-content-wrapper {
            width: 100%;
            margin-left: 250px;
        }
        #sidebar.toggled {
            width: 0;
            display: none;
        }
        #menu-toggle {
            background: #198754;
            color: white;
            border: none;
            padding: 10px;
            font-size: 20px;
        }
    </style>
</body>
</html>