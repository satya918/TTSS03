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
    <form id="myForm" action="/test" method="post">
        <div class="form-group">
            <label for="VenueId">Venue Id:</label>
            <input type="text" id="venueid" name="vid" placeholder="Enter Venue Id..." required>
        </div>

        <div class="form-group">
            <label for="trainingMonth">Training Month:</label>
            <input type="text" id="trainingMonth" name="tmonth" placeholder="Enter Training Month..." required>
        </div>

        <div class="form-group">
            <label for="Training Year">Training Year:</label>
            <input type="text" id="trainingYear" name="tyear" placeholder="Enter Training Year..." required>
        </div>

        <div class="form-group">
            <label for="Training Name">Training Name:</label>
            <input type="text" id="trainingName" name="tname" placeholder="Enter Training Name..." required>
        </div>

        <div class="form-group">
            <label for="Module">Module:</label>
            <input type="text" id="module" name="tdescription" placeholder="Enter Module..." required>
        </div>
        
        <button type="submit" id="submit">Submit</button>
    </form>
  </div>

  <div id="responseContainer">
  </div>

  <script>
    $(document).ready(function() {
        $("#submit").click(function () {
            var venueId = $("#venueid").val();
            var trainingMonth = $("#trainingMonth").val();
            var trainingYear = $("#trainingYear").val();
            var trainingName = $("#trainingName").val();
            var module = $("#module").val();

            var jsonData = {
                vid: venueId,
                tmonth: trainingMonth,
                tyear: trainingYear,
                tname: trainingName,
                tdescription: module
            };

            $.ajax({
                type: "POST",
                url: "/test",
                dataType: "json",
                contentType: "application/json", 
                data: JSON.stringify(jsonData),
                success: function(data) {
                    console.log(data);
                    $("#responseContainer").html("POST Request Successful");
                },
                error: function(xhr, status, error) {
                    console.error(error);
                }
            });
        });
    });
  </script>
</body>
</html>
