package javaclass;

import java.io.IOException;
import java.util.ArrayList;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/AddToCartServlet")

public class AddToCartServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        int id =
        Integer.parseInt(
        request.getParameter("id"));

        HttpSession session =
        request.getSession();

        ArrayList<Integer> cart =
        (ArrayList<Integer>)
        session.getAttribute("cart");

        if(cart == null){

            cart =
            new ArrayList<Integer>();

        }

        cart.add(id);

        session.setAttribute(
        "cart",
        cart);

        response.sendRedirect(
        "success.jsp");
    }
}