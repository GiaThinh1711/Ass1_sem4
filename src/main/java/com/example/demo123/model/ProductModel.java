package com.example.demo123.model;

import com.example.demo123.enity.Product;
import com.example.demo123.util.ConnectionHelper;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductModel {
    public boolean save(Product obj) {
        try {
            Connection connection = ConnectionHelper.getConnection();
            PreparedStatement prepareStatement = connection.prepareStatement("insert into foods (food_code, name,category_id,description,avatar,price,createdAt,updatedAt,status) values (?, ?, ?, ?, ?, ?, ?, ?, ?)");
            prepareStatement.setString(1,obj.getFood_code());
            prepareStatement.setString(2,obj.getName());
            prepareStatement.setString(3,obj.getCategory_id());
            prepareStatement.setString(4,obj.getDescription());
            prepareStatement.setString(5,obj.getAvatar());
            prepareStatement.setDouble(6,obj.getPrice());
            prepareStatement.setString(7,obj.getCreatedAt());
            prepareStatement.setString(8,obj.getUpdatedAt());
            prepareStatement.setString(9,obj.getStatus());
            prepareStatement.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return false;
    }

    public List<Product> findAll() {
        List<Product> listObj = new ArrayList<>();
        ConnectionHelper connectionHelper = new ConnectionHelper();
        try {
            Connection connection = connectionHelper.getConnection();
            String sqlSelect = "select * from foods";
            PreparedStatement prepareStatement = connection.prepareStatement(sqlSelect);
            ResultSet rs = prepareStatement.executeQuery(sqlSelect);
            while (rs.next()) {
                int id = rs.getInt("id");
                String food_code = rs.getString("food_code");
                String name = rs.getString("name");
                String category_id = rs.getString("category_id");
                String description = rs.getString("description");
                String avatar = rs.getString("avatar");
                double price = rs.getDouble("price");
                String createdAt = rs.getString("createdAt");
                String updatedAt = rs.getString("updatedAt");
                String status = rs.getString("status");
                Product obj = new Product(food_code,name,category_id,description,avatar,price,createdAt,updatedAt,status);
                obj.setId(id);
                listObj.add(obj);

            }
        } catch (Exception e) {

        }
        return listObj;
    }
    public Product findById(int id) {
        System.out.println(id);
        Product obj = null;
        try {
            Connection connection = ConnectionHelper.getConnection();
            PreparedStatement statement = connection.prepareStatement("select * from foods where id = ?") ;
            statement.setInt(1, id);
            System.out.println(statement);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                String food_code = rs.getString("food_code");
                String name = rs.getString("name");
                String category_id = rs.getString("category_id");
                String description = rs.getString("description");
                String avatar = rs.getString("avatar");
                double price = rs.getDouble("price");
                String createdAt = rs.getString("createdAt");
                String updatedAt = rs.getString("updatedAt");
                String status = rs.getString("status");
                obj = new Product(food_code,name,category_id,description,avatar,price,createdAt,updatedAt,status);
                obj.setId(id);
            }
        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
        return  obj;
    }
    public boolean update(int id, Product updateProduct) {
        ConnectionHelper connectionHelper = new ConnectionHelper();
        try {
            Connection connection = connectionHelper.getConnection();
            Statement statement = connection.createStatement();
            String sqlStatement =
                    String.format("update foods set food_code = '%s',name = '%s', category_id = '%s', description = '%s', avatar = '%s', price = %f," +
                                    " createdAt  = '%s',updatedAt = '%s', status = '%s' where id = %d",
                            updateProduct.getFood_code(), updateProduct.getName(), updateProduct.getCategory_id(), updateProduct.getDescription(),updateProduct.getAvatar(),
                            updateProduct.getPrice(), updateProduct.getCreatedAt(), updateProduct.getUpdatedAt(), updateProduct.getStatus(), id);
            statement.execute(sqlStatement);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return false;
    }
    public boolean delete(int id){
        ConnectionHelper connectionHelper = new ConnectionHelper();
        try {
            Connection connection = connectionHelper.getConnection();
            Statement statement = connection.createStatement();
            String sqlStatement =
                    String.format("delete from foods where id =%d", id);
            statement.execute(sqlStatement);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return false;
    }
}
