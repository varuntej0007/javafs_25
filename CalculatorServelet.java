package CalculatorServlet;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/CalculatorServlet")
public class CalculatorServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String input = request.getParameter("display");
        double result = 0;

        try {
            if (input != null && !input.isEmpty()) {
                result = evaluateExpression(input);
            }
            request.setAttribute("result", result);
        } catch (Exception e) {
            request.setAttribute("result", "Error");
        }

        request.getRequestDispatcher("calculator.jsp").forward(request, response);
    }

    private double evaluateExpression(String input) throws Exception {
        input = input.replaceAll("\\s+", ""); // Remove spaces

        if (input.contains("+")) {
            String[] parts = input.split("\\+");
            return Double.parseDouble(parts[0]) + Double.parseDouble(parts[1]);
        } else if (input.contains("-")) {
            String[] parts = input.split("(?<=\\d)-(?=\\d)"); // Handle negative numbers
            return Double.parseDouble(parts[0]) - Double.parseDouble(parts[1]);
        } else if (input.contains("*")) {
            String[] parts = input.split("\\*");
            return Double.parseDouble(parts[0]) * Double.parseDouble(parts[1]);
        } else if (input.contains("/")) {
            String[] parts = input.split("/");
            double num1 = Double.parseDouble(parts[0]);
            double num2 = Double.parseDouble(parts[1]);
            if (num2 == 0) throw new ArithmeticException("Cannot divide by zero");
            return num1 / num2;
        } else {
            throw new Exception("Invalid expression");
        }
    }
}
