package javaclass;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/Loginservlet")
public class Loginservlet extends HttpServlet {

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");

        PrintWriter out =
        response.getWriter();

        String username =
        request.getParameter("username");

        String password =
        request.getParameter("password");

        try {

            Connection con =
            DatabaseConnection.getConnection();

            String query =
            "SELECT * FROM users WHERE username=? AND password=?";

            PreparedStatement ps =
            con.prepareStatement(query);

            ps.setString(1, username);
            ps.setString(2, password);

            ResultSet rs =
            ps.executeQuery();

            if(rs.next()) {

                HttpSession session =
                request.getSession();

                session.setAttribute(
                "username",
                rs.getString("username"));

                session.setAttribute(
                "role",
                rs.getString("role"));

                response.sendRedirect(
                "success.jsp");

            } else {

                out.println(
                "Invalid Username or Password");

            }

            con.close();

        } catch(Exception e) {

            out.println(e);

        }
    }
}