<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <title>Teacher Training Support System</title>
    <link rel="stylesheet" href="path-to-bootstrap.min.css">
    <!-- Include jQuery library -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f7f7f7;
            margin: 0;
            padding: 0;
        }

        .container {
            background-color: #fff;
            border: 1px solid #ccc;
            border-radius: 5px;
            margin: 30px auto;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 80%;
            max-width: 700px;
        }

        h2 {
            text-align: center;
            color: #007bff;
            margin-bottom: 20px;
        }

        .form-group {
            margin-bottom: 15px;
        }

        label {
            font-weight: bold;
        }

        input[type="text"],
        input[type="email"],
        input[type="tel"],
        input[type="date"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        button[type="submit"] {
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            padding: 10px 20px;
            width: 100%;
        }
    </style>
</head>
<body>
  <div class="container">
    <h2>TEACHER TRAINING SUPPORT SYSTEM</h2>
    <form action="/schedule" method="get">
        <div class="form-group">
            <label for="trainingReferenceId">Training ReferenceId:</label>
            <input type="text" class="form-control" id="trainingReferenceId" name="ref_planner_id" placeholder="Enter Training ReferenceId..." required>
        </div>
        <div class="form-group">
            <button type="submit" class="btn-btn-primary" id="searchButton">Search</button>
        </div>
    </form>
  </div>

  <!-- Create a container for displaying the API response -->
  <div class="container" id="apiResponseContainer">
    <h2>API Response</h2>
    <pre id="apiResponse"></pre>
</div>

<script>
    // Define a function to make the AJAX request
    function makeAjaxRequest() {
        fetch('http://localhost:9090/api/schedule')
            .then(response => response.json())
            .then(data => {
                // Convert the JSON data to a JavaScript object
                const jsonData = JSON.parse(JSON.stringify(data));

                // Display the converted data on the console
                console.log(jsonData);

                // Optionally, you can display it on the page
                const apiResponseElement = document.getElementById('apiResponse');
                apiResponseElement.textContent = JSON.stringify(jsonData, null, 2);
            })
            .catch(error => {
                console.error('Error:', error);
            });
    }

    // Attach a click event handler to the "Search" button
    document.getElementById('searchButton').addEventListener('click', makeAjaxRequest);
</script>
</body>
</html>