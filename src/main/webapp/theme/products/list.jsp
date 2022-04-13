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
            background-color: rgba(255, 255, 255, 0.6);
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
        a{
            text-decoration:none;
            color: black;
        }
    </style>
</head>
<body>
<nav>
    <div class="option col-md-10">
        <ul>
            <li class="col-md-2"><img style="width:200px; position:absolute;top: -44px; text-align: center;right: -600px" src="https://arts.homeup.vn/images/LOGO.png" alt=""></li>
        </ul>
    </div>

</nav>
<table class="table">
    <h1 style="text-align:center;margin-top: 40px">List Product</h1>
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
            <a href="/foods/update?id=<%=pr.getId()%>"><button >Update</button></a>
        </td>
    </tr>
    <%}%>
    </tbody>
</table>
<div style="text-align:center"><a style="text-decoration:none;text-align:center" href="/foods/create"><button>Create</button></a>
</div>
<script src="https://kit.fontawesome.com/103cc0b0bf.js" crossorigin="anonymous"></script>
</body>
</html>