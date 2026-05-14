package javaclass;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/AddBookServlet")

public class AddBookServlet extends HttpServlet {

    @Override
	protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String title =
                request.getParameter("title");

        String author =
                request.getParameter("author");

        double price =
                Double.parseDouble(
                        request.getParameter("price")
                );

        String image =
                request.getParameter("image");

        try {

            Connection con =
                    DatabaseConnection.getConnection();

            String sql =
                    "INSERT INTO books(title,author,price,image) VALUES(?,?,?,?)";

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ps.setString(1, title);
            ps.setString(2, author);
            ps.setDouble(3, price);
            ps.setString(4, image);

            ps.executeUpdate();

            response.sendRedirect(
                    "success.jsp"
            );

        } catch (Exception e) {

            e.printStackTrace();
        }
    }
}