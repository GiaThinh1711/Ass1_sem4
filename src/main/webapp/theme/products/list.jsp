<%@ page import="java.util.List" %>
<%@ page import="com.example.demo123.enity.Product" %>
<%
    List<Product> list = (List<Product>)request.getAttribute("listObj");

%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
          integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <title>List Product</title>
    <style>
        nav{
            /*position: fixed;*/
            top: 0;
            left: 0;
            width: 100%;
            height: 100px;
            padding: 10px 90px;
            box-sizing: border-box;
            background-color: rgba(0,0,0,0.6);
            border-bottom: 1px solid #ffffff;
        }
        nav .logo{
            padding: 22px 20px;
            height: 80px;
            float: left;
            font-size: 22px;
            font-weight: bold;
        }
        ul{
            display: flex;
            margin-top: 27px;
            text-align: center;
            list-style: none;
        }
    </style>
</head>
<body>
<nav>
    <div class="logo col-md-2">
        <video src="https://www.canva.com/design/DAE9r2iojF8/AbTD2CU6WKniwuL2z-I8bw/watch?utm_content=DAE9r2iojF8&utm_campaign=share_your_design&utm_medium=link&utm_source=shareyourdesignpanel"></video>
    </div>
    <div class="option col-md-10">
        <ul>
            <li class="col-md-2"><a href="#">Home</a></li>
            <li class="col-md-2"><a href="#">Create</a></li>
            <li class="col-md-2"><a href="#">Login</a></li>
            <li class="col-md-2"><a href=""><i class="fa-solid fa-arrow-right-from-bracket"></i></a></li>
        </ul>
    </div>

</nav>
<table class="table">
    <h1 style="text-align:center">List Product</h1>
    <thead class="thead-light">
    <tr>
        <th scope="col">Id</th>
        <th scope="col">Food Code</th>
        <th scope="col">Name</th>
        <th scope="col">Category Id</th>
        <th scope="col">Description</th>
        <th scope="col">Avatar</th>
        <th scope="col">Price</th>
        <th scope="col">Created At</th>
        <th scope="col">Updated At</th>
        <th scope="col">Status</th>
        <th scope="col"></th>
    </tr>
    </thead>
    <tbody>
    <%
        for (int i =0; i < list.size(); i++){
            Product pr = list.get(i);

    %>
    <tr>
        <td><%=pr.getId()%></td>
        <td><%=pr.getFood_code()%></td>
        <td><%=pr.getName()%></td>
        <td><%=pr.getCategory_id()%></td>
        <td><%=pr.getDescription()%></td>
        <td><img src="<%=pr.getAvatar()%>" style="object-fit: contain; width: 150px; "></td>
        <td><%=pr.getPrice()%></td>
        <td><%=pr.getCreatedAt()%></td>
        <td><%=pr.getUpdatedAt()%></td>
        <td><%=pr.getStatus()%></td>
        <td><a href="/foods/delete?id=<%=pr.getId()%>"><button >Delete</button></a> |
            <a href="/foods/update?id=<%=pr.getId()%>"><button >Update</button></a> |
        </td>
    </tr>
    <%}%>
    </tbody>
</table>
<a href="/foods/create">Create</a>
<script src="https://kit.fontawesome.com/103cc0b0bf.js" crossorigin="anonymous"></script>
</body>
</html>