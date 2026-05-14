package javaclass;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/RemoveBookServlet")

public class RemoveBookServlet extends HttpServlet {

    @Override
	protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        int id =
                Integer.parseInt(
                        request.getParameter("id")
                );

        try {

            Connection con =
                    DatabaseConnection.getConnection();

            String sql =
                    "DELETE FROM books WHERE id=?";

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ps.setInt(1, id);

            ps.executeUpdate();

            response.sendRedirect(
                    "success.jsp"
            );

        } catch (Exception e) {

            e.printStackTrace();
        }
    }
}