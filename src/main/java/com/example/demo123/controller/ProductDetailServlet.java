package com.example.demo123.controller;

import com.example.demo123.enity.Product;
import com.example.demo123.model.ProductModel;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashSet;

public class ProductDetailServlet extends HttpServlet {
    private ProductModel model = new ProductModel();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        Product obj = model.findById(id);
        if (obj == null){
            resp.setStatus(404);
            resp.getWriter().println("Not found");

        }else {
            HttpSession session = req.getSession();
            HashSet<Product> recentViewProduct
                    = (HashSet<Product>) session.getAttribute("recentViewProduct");
            boolean existing = false;
            if(recentViewProduct == null){
                recentViewProduct = new HashSet<>();
            }
            recentViewProduct.add(obj);
            session.setAttribute("obj",obj);
            req.setAttribute("obj",obj);
            req.getRequestDispatcher("/admin/products/detail.jsp").forward(req, resp);
        }
    }
}
