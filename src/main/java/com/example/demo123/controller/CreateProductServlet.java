package com.example.demo123.controller;

import com.example.demo123.enity.Product;
import com.example.demo123.model.ProductModel;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDateTime;

public class CreateProductServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/theme/products/form.jsp").forward(req, resp);
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String food_code = req.getParameter("food_code");

        String name = req.getParameter("name");

        String category_id = req.getParameter("category_id");

        String description = req.getParameter("description");

        String avatar = req.getParameter("avatar");

        double price = Double.parseDouble(req.getParameter("price"));

        String createdAt = LocalDateTime.now().toString();

        String updatedAt = LocalDateTime.now().toString();

        String status = req.getParameter("status");

        Product product = new Product(food_code, name, category_id, description, avatar, price, createdAt, updatedAt, status);
        System.out.println(product);
        if (!product.isValid()) {
            req.setAttribute("errors", product.getErrors());
            req.getRequestDispatcher("/theme/products/form.jsp").forward(req, resp);
            return;
        }
        ProductModel productModel = new ProductModel();
        productModel.save(product);
        resp.sendRedirect("/foods/list");
    }
}
