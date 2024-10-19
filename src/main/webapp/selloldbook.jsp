<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Sell Old Book</title>
</head>
<style>
    body {
        margin: 0;
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
    }

    .main {
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }

    .container {
        background-color: white;
        padding: 30px;
        border-radius: 10px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        font-size: 0.9rem; /* Smaller text */
        width: 50%; /* Larger form */
        max-width: 600px;
    }

    .form-group {
        display: flex;
        align-items: center;
        justify-content: space-between;
        margin-bottom: 15px;
    }

    label {
        width: 30%;
        text-align: right;
        margin-right: 10px;
    }

    input[type="text"],
    input[type="number"] {
        width: 65%;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
        box-sizing: border-box;
    }

    input[type="submit"] {
        background-color: #28a745;
        color: white;
        padding: 12px 20px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-size: 1rem;
        width: 100%;
    }

    input[type="submit"]:hover {
        background-color: #218838;
    }
    .head{
        font-size: 20px;
        display: flex;
        justify-content: center;
    }
</style>

<body>
    <div class="main">
        <div class="container">
            <div class="head">
                <label for="head">Sell Oldbook...</label>
            </div>
               
                <input type="hidden" value="soumyaranjan@gmail.com" name="email"><br>

                <div class="form-group">
                    <label for="Bookname">Book Name*</label>
                    <input type="text" name="bname" placeholder="Book Name" required>
                </div>

                <div class="form-group">
                    <label for="Authorname">Author Name*</label>
                    <input type="text" name="authorname" placeholder="Author Name" required>
                </div>

                <div class="form-group">
                    <label for="Price">Price*</label>
                    <input type="number" name="price" required placeholder="Price">
                </div>

                <input type="submit" value="Sell">
            </form>
        </div>
    </div>
</body>

</html>
