<%@ page import="java.util.HashMap" %>
<%@ page import="com.example.demo123.enity.Product" %>
<% Product obj = (Product)request.getAttribute("obj");%>
<% HashMap<String, String> errors = (HashMap<String, String>) request.getAttribute("errors");
    if (errors == null){
        errors = new HashMap<>();
    }
%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
          integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <title>Update Products</title>
</head>
<body>
<form style="margin:auto" class="col-md-6" action="/foods/update" method="post">
    <h2 style="text-align:center">Create Products Here</h2>
    <input type="hidden" name="id" class="form-control" value="<%=obj.getId()%>">
    <div class="form-group">
        <label>Food Code</label>
        <input value="<%=obj.getFood_code()%>" type="text" name="food_code" class="form-control" >
        <%
            if (errors.containsKey("food_code")){%>
        <span style="color:red"><%=errors.get("food_code")%></span>
        <%}%>
    </div>
    <div class="form-group">
        <label>Name</label>
        <input value="<%=obj.getName()%>" type="text" name="name" class="form-control" >
        <%
            if (errors.containsKey("name")){%>
        <span style="color:red"><%=errors.get("name")%></span>
        <%}%>
    </div>
    <div class="form-group">
        <label>Category Id</label>
        <input value="<%=obj.getCategory_id()%>" type="text" name="category_id" value="" class="form-control" >
        <%
            if (errors.containsKey("category_id")){%>
        <span style="color:red"><%=errors.get("category_id")%></span>
        <%}%>
    </div>
    <div class="form-group">
        <label>Description</label>
        <input value="<%=obj.getDescription()%>" type="text" name="description" value="" class="form-control" >
        <%
            if (errors.containsKey("description")){%>
        <span style="color:red"><%=errors.get("description")%></span>
        <%}%>
    </div>
    <div class="form-group">
        <label>Avatar</label>
        <input value="<%=obj.getAvatar()%>" type="text" name="avatar" value="" class="form-control" >
        <%
            if (errors.containsKey("avatar")){%>
        <span style="color:red"><%=errors.get("avatar")%></span>
        <%}%>
    </div>
    <div class="form-group">
        <label>Price</label>
        <input value="<%=obj.getPrice()%>" type="number" name="price" value="0" class="form-control" >
        <%
            if (errors.containsKey("price")){%>
        <span style="color:red"><%=errors.get("price")%></span>
        <%}%>
    </div>
    <div class="form-group">
        <input value="<%=obj.getCreatedAt()%>" type="hidden" name="createdAt" value="" class="form-control" >
    </div>

    <div class="form-group">
        <lable>Status</lable>
        <select value="<%=obj.getStatus()%>" name="status" class="form-select" aria-label="Default select example">
            <option selected>In stock</option>
            <option>Out stock</option>
        </select>

    </div>
    <button type="submit" class="btn btn-primary">Submit</button>
    <button type="reset" class="btn btn-primary">Reset</button>
</form>
</body>
</html>