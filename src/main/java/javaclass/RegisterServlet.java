package javaclass;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {

    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String username =
        request.getParameter("username");

        String name =
        request.getParameter("name");

        String email =
        request.getParameter("email");

        String password =
        request.getParameter("password");

        String phone =
        request.getParameter("phone");

        try {

            Connection con =
            DatabaseConnection.getConnection();

            String sql =
            "INSERT INTO users(username,name,email,password,role,phone) VALUES(?,?,?,?,?,?)";

            PreparedStatement ps =
            con.prepareStatement(sql);

            ps.setString(1, username);
            ps.setString(2, name);
            ps.setString(3, email);
            ps.setString(4, password);
            ps.setString(5, "user");
            ps.setString(6, phone);
            

            int i =
            ps.executeUpdate();

            if(i > 0) {

                response.sendRedirect(
                "Login.jsp");

            } else {

                response.getWriter().println(
                "Registration Failed");

            }

            con.close();

        } catch(Exception e) {

            e.printStackTrace();

        }
    }
}