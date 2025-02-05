package controller;

import dao.AdminDAO;
import model.Admin;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/admin")
public class AdminController extends HttpServlet {

    private AdminDAO adminDAO = new AdminDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("login".equals(action)) {
            String username = request.getParameter("user");
            String password = request.getParameter("pass");

            Admin admin = adminDAO.getAdminByUsernameAndPassword(username, password);

            if (admin != null) {
                HttpSession session = request.getSession();
                session.setAttribute("admin", admin.getUsername());
                response.sendRedirect("admin_dashboard.jsp");
            } else {
                request.setAttribute("errorMessage", "Invalid admin credentials");
                request.getRequestDispatcher("admin_login.jsp").forward(request, response);
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("logout".equals(action)) {
            HttpSession session = request.getSession();
            session.invalidate();
            response.sendRedirect("admin_login.jsp");
        }
    }
}
