package com.example.demo123.controller;

import com.example.demo123.enity.Product;
import com.example.demo123.model.ProductModel;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDateTime;

public class UpdateProductServlet extends HttpServlet {
    ProductModel model = new ProductModel();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        System.out.println(id);
        Product obj = model.findById(id);
        if (obj == null){
            resp.setStatus(404);
            resp.getWriter().println("Not found");
        }else{
            req.setAttribute("obj",obj);
            req.getRequestDispatcher("/theme/products/edit.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        System.out.println(id);
        Product obj = model.findById(id);
        if (obj == null){
            resp.setStatus(404);
            resp.getWriter().println("Not found");
        }else{
            String food_code = req.getParameter("food_code");
            String name =req.getParameter("name");
            String category_id = req.getParameter("category_id");
            String description = req.getParameter("description");
            String avatar = req.getParameter("avatar");
            double price = Double.parseDouble(req.getParameter("price"));
            String createdAt = req.getParameter("createdAt");
            String updatedAt = LocalDateTime.now().toString();
            String status = req.getParameter("status");
            obj.setFood_code(food_code);
            obj.setName(name);
            obj.setCategory_id(category_id);
            obj.setDescription(description);
            obj.setAvatar(avatar);
            obj.setPrice(price);
            obj.setCreatedAt(createdAt);
            obj.setUpdatedAt(updatedAt);
            obj.setStatus(status);
            model.update(id, obj);
            resp.sendRedirect("/foods/list");
        }
    }
}
