package com.example.demo123.enity;


import java.util.HashMap;

public class Product {
    private int id;
    private String food_code;
    private String name;
    private String category_id;
    private String description;
    private String avatar;
    private double price;
    private String createdAt;
    private String updatedAt;
    private String status;

    public Product() {
    }

    public Product(int id, String food_code, String name, String category_id, String description, String avatar, double price, String createdAt, String updatedAt, String status) {
        this.id = id;
        this.food_code = food_code;
        this.name = name;
        this.category_id = category_id;
        this.description = description;
        this.avatar = avatar;
        this.price = price;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
        this.status = status;
    }

    public Product(String food_code, String name, String category_id, String description, String avatar, double price, String createdAt, String updatedAt, String status) {
        this.food_code = food_code;
        this.name = name;
        this.category_id = category_id;
        this.description = description;
        this.avatar = avatar;
        this.price = price;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFood_code() {
        return food_code;
    }

    public void setFood_code(String food_code) {
        this.food_code = food_code;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCategory_id() {
        return category_id;
    }

    public void setCategory_id(String category_id) {
        this.category_id = category_id;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(String createdAt) {
        this.createdAt = createdAt;
    }

    public String getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(String updatedAt) {
        this.updatedAt = updatedAt;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    private HashMap<String,String> error;
    private void checkValid(){
        this.error = new HashMap<>();
        if (this.food_code == null || this.food_code.length() == 0){
            this.error.put("food_code","Food code is required!");
        }
        if (this.name == null || this.name.length() == 0){
            this.error.put("name","Name is required!");
        }
        if (this.category_id == null || this.category_id.length() == 0){
            this.error.put("category_id","Category Id is required!");
        }
        if (this.description == null || this.description.length() == 0){
            this.error.put("description","Description is required!");
        }
        if (this.avatar == null || this.avatar.length() == 0){
            this.error.put("avatar","Avatar is required!");
        }
        if (this.price == 0 ){
            this.error.put("price","Price is required!");
        }
        if (this.createdAt == null || this.createdAt.length() == 0){
            this.error.put("createdAt","This is required!");
        }
        if (this.updatedAt == null || this.updatedAt.length() == 0){
            this.error.put("updatedAt","This is required!");
        }
        if (this.status == null || this.updatedAt.length() == 0){
            this.error.put("status","Status is required!");
        }
    }

    public HashMap<String,String> getErrors() {
        checkValid();
        return error;
    }
    public boolean isValid() {
        checkValid();
        System.out.println(error.size());
        return error == null || error.size() == 0;
    }

    @Override
    public String toString() {
        return "Product{" +
                "id=" + id +
                ", food_code='" + food_code + '\'' +
                ", name='" + name + '\'' +
                ", category_id='" + category_id + '\'' +
                ", description='" + description + '\'' +
                ", avatar='" + avatar + '\'' +
                ", price=" + price +
                ", createdAt='" + createdAt + '\'' +
                ", updatedAt='" + updatedAt + '\'' +
                ", status=" + status +
                ", error=" + error +
                '}';
    }
}
