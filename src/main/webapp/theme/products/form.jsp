<%@ page import="java.util.HashMap" %>
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
    <title>Create Products</title>
</head>
<body>
<form style="margin:auto" class="col-md-6" action="/foods/create" method="post">
    <h2 style="text-align:center">Create Products Here</h2>
    <div class="form-group">
        <label>Food Code</label>
        <input type="text" name="food_code" class="form-control" >
        <%
        if (errors.containsKey("food_code")){%>
        <span style="color:red"><%=errors.get("food_code")%></span>
        <%}%>
    </div>
    <div class="form-group">
        <label>Name</label>
        <input type="text" name="name" class="form-control" >
        <%
            if (errors.containsKey("name")){%>
        <span style="color:red"><%=errors.get("name")%></span>
        <%}%>
    </div>
    <div class="form-group">
        <label>Category Id</label>
        <input type="text" name="category_id" value="" class="form-control" >
        <%
            if (errors.containsKey("category_id")){%>
        <span style="color:red"><%=errors.get("category_id")%></span>
        <%}%>
    </div>
    <div class="form-group">
        <label>Description</label>
        <input type="text" name="description" value="" class="form-control" >
        <%
            if (errors.containsKey("description")){%>
        <span style="color:red"><%=errors.get("description")%></span>
        <%}%>
    </div>
    <div class="form-group">
        <label>Avatar</label>
        <input type="text" name="avatar" value="" class="form-control" >
        <%
            if (errors.containsKey("avatar")){%>
        <span style="color:red"><%=errors.get("avatar")%></span>
        <%}%>
    </div>
    <div class="form-group">
        <label>Price</label>
        <input type="number" name="price" value="0" class="form-control" >
        <%
            if (errors.containsKey("price")){%>
        <span style="color:red"><%=errors.get("price")%></span>
        <%}%>
    </div>

    <div class="form-group">
        <lable>Status</lable>
        <select name="status" class="form-select" aria-label="Default select example">
            <option selected>In stock</option>
            <option value="1">Out stock</option>
        </select>

    </div>
    <button type="submit" class="btn btn-primary">Submit</button>
    <button type="reset" class="btn btn-primary">Reset</button>
</form>
<button id="upload_widget" class="cloudinary-button">Upload files</button>

<script src="https://upload-widget.cloudinary.com/global/all.js" type="text/javascript"></script>

<script type="text/javascript">
    var myWidget = cloudinary.createUploadWidget({
            cloudName: 'dkzdudlih',
            uploadPreset: 'Ass1_sem4'}, (error, result) => {
            if (!error && result && result.event === "success") {
                console.log('Done! Here is the image info: ', result.info);
            }
        }
    )

    document.getElementById("upload_widget").addEventListener("click", function(){
        myWidget.open();
    }, false);
</script>
</body>
</html>