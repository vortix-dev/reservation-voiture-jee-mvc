package controller;

import dao.ReservationDAO;
import model.Reservation;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Date;
import java.util.List;

@WebServlet("/reservation")
public class ReservationController extends HttpServlet {

    private ReservationDAO reservationDAO = new ReservationDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("add".equals(action)) {
            int idClient = Integer.parseInt(request.getParameter("idClient"));
            int idVoiture = Integer.parseInt(request.getParameter("idVoiture"));
            Date dateReservation = Date.valueOf(request.getParameter("dateReservation"));
            String statut = request.getParameter("statut");

            Reservation reservation = new Reservation(idClient, idVoiture, dateReservation, statut);
            reservationDAO.addReservation(reservation);
            response.sendRedirect("mes_reservations.jsp");
        }
        if ("update".equals(action)) {
            int idReservation = Integer.parseInt(request.getParameter("idReservation"));
            String statut = request.getParameter("statut");

            reservationDAO.updateReservationStatus(idReservation, statut);
            response.sendRedirect("gerer_reservation.jsp");
        }

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("list".equals(action)) {
            List<Reservation> reservations = reservationDAO.getAllReservations();
            request.setAttribute("reservations", reservations);
            request.getRequestDispatcher("reservations_list.jsp").forward(request, response);
        } else if ("delete".equals(action)) {
            int idReservation = Integer.parseInt(request.getParameter("idReservation"));
            reservationDAO.deleteReservation(idReservation);
            response.sendRedirect("admin_dashboard.jsp");
        }
    }
}
