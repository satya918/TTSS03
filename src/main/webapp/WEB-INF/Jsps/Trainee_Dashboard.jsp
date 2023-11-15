<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>TTSS</title>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

    
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" />

<!-- xlsx.full.min.js -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.17.3/xlsx.full.min.js"></script>

<!-- Bootstrap JavaScript with Popper.js -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/2.10.2/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>


</head>

<body>
    <div class="d-flex" id="wrapper">
        <!-- Sidebar-->
        <div class="border-end bg-white" id="sidebar-wrapper">
            <div class="sidebar-heading border-bottom bg-light">
                <img src="./assets/logo.png" width="30" height="30">
            </div>
            <div class="list-group list-group-flush">
                <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#!"
                    onclick="showTab('tab1')">Dashboard</a>
                <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#!"
                    onclick="showTab('tab2')">Apply Traning</a>
                <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#!"
                    onclick="showTab('tab3')">View Traning</a>
                <!-- Master Setup  menu -->
            </div>
        </div>
        <!-- Page content wrapper-->
        <div id="page-content-wrapper">
            <!-- Top navigation-->
            <nav class="navbar navbar-expand-lg navbar-light bg-light border-bottom">
                <div class="container-fluid">
                    <div id="sidebarToggle">
                        <div style="width: 35px; height: 5px; background-color: black; margin: 6px 0;"></div>
                        <div style="width: 35px; height: 5px; background-color: black; margin: 6px 0;"></div>
                        <div style="width: 35px; height: 5px; background-color: black; margin: 6px 0;"></div>
                    </div>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                        data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                        aria-expanded="false" aria-label="Toggle navigation"><span>
                            class="navbar-toggler-icon"></span></button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <a class="nav-link ms-auto text-center text-info" href="#!"> Teacher Traning Support System</a>
                        <ul class="navbar-nav ms-auto mt-2 mt-lg-0">

                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button"
                                    data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                        class="bi bi-person-circle" viewBox="0 0 16 16">
                                        <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z" />
                                        <path fill-rule="evenodd"
                                            d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z" />
                                    </svg>
                                </a>
                                <div class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                                    <a class="dropdown-item" href="#!">Profile</a>
                                    <a class="dropdown-item" href="#!">Setting</a>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item" href="#!">Logout</a>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
            <!-- Page content-->
            <!-- ######################### View Achedemic calender #################### -->
            <div class="container mt-2 tab-content" id="tab1">


                <div class=""><b>Dashboard</b>
                </div>
                <div class="container mt-5">
                    <div class="row">
                        <div class="col-md-6">
                            <a href="#" class="card-link">
                                <div class="card">
                                    <img src="../images/2.jpg" class="card-img-top" alt="Placeholder Image">
                                    <div class="card-body">
                                        <h5 class="card-title">Card 1</h5>
                                        <p class="card-text">Some quick example text for Card 1.</p>
                                    </div>
                                </div>
                            </a>
                        </div>
            
                        <div class="col-md-6">
                            <a href="#" class="card-link">
                                <div class="card">
                                    <img src="../images/3.jpg" class="card-img-top" alt="Placeholder Image">
                                    <div class="card-body">
                                        <h5 class="card-title">Card 2</h5>
                                        <p class="card-text">Some quick example text for Card 2.</p>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
            
                    <div class="row mt-3">
                        <div class="col-md-6">
                            <a href="#" class="card-link">
                                <div class="card">
                                    <img src="../images/1.jpg" class="card-img-top" alt="Placeholder Image">
                                    <div class="card-body">
                                        <h5 class="card-title">Card 3</h5>
                                        <p class="card-text">Some quick example text for Card 3.</p>
                                    </div>
                                </div>
                            </a>
                        </div>
            
                        <div class="col-md-6">
                            <a href="#" class="card-link">
                                <div class="card">
                                    <img src="../images/2.jpg" class="card-img-top" alt="Placeholder Image">
                                    <div class="card-body">
                                        <h5 class="card-title">Card 4</h5>
                                        <p class="card-text">Some quick example text for Card 4.</p>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>


                <div class="row mt-2">
                    <div class="col-sm-6">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title">Special title treatment</h5>
                                <p class="card-text">With supporting text below as a natural lead-in to additional
                                    content
                                    Lorem ipsum dolor sit, amet consectetur adipisicing elit. Provident rem laboriosam
                                    deserunt vel ex. Ipsum, perspiciatis. Nulla impedit animi inventore odit sit iure
                                    ex? Praesentium aspernatur ratione autem sint error..</p>
                                <a href="#" class="btn btn-primary">Go somewhere</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title">Special title treatment</h5>
                                <p class="card-text">With supporting text below as a natural lead-in to additional
                                    content.
                                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Ratione nisi, alias cum
                                    dolorum minus quidem eius ab placeat quod! Quibusdam saepe culpa accusamus, nam
                                    ratione voluptate vel? Minus, aliquid illum?
                                </p>
                                <a href="#" class="btn btn-primary">Go somewhere</a>
                            </div>
                        </div>
                    </div>
                </div>


            </div>


            <!-- Traning Schudule Form -->
<div class="container tab-content" id="tab2" style="display: none;">
    <button id="applyTrainingButton" class="btn btn-primary">Click here For apply trainings</button>

    <!-- Form Start  -->
    <div class="mt-1"><b>Apply Training</b></div>
    <div class="card mt-2">
       <table class="table table-hover" id="trainingTable">
    <thead>
        <tr>
            <th scope="col">Training Name</th>
            <th scope="col">Training Mode</th>
            <th scope="col">Training description</th>
            <th scope="col">App start to end</th>
            <th scope="col">Venue Details</th>
            <th scope="col">Co-ordinater Details</th>
            <th scope="col">Action</th>
        </tr>
    </thead>
</table>
                </div>
            </div>
   <script>
    $(document).ready(function() {
        $("#applyTrainingButton").click(function () {
            $.ajax({
                type: "GET",
                url: "/TTSS03/api/scheduledTrainings",
                dataType: "json",
                success: function(data) {
                	console.log(data);
                    displayTrainingData(data);
                },
                error: function(xhr, status, error) {
                    console.error("API request error: " + error);
                }
            });
        });

        function displayTrainingData(data) {
            var trainings = data;
            console.log(trainings);
            var table = document.getElementById("trainingTable");

            // Clear existing rows
            table.innerHTML = "<tr><th>Training Name</th><th>Training Mode</th><th>Description</th><th>App start to end</th><th>Map Location</th><th>Co-ordinater Details</th><th>Action</th></tr>";

            for (var i = 0; i < trainings.length; i++) {
    var training = trainings[i];
    var row = table.insertRow(i + 1);
    
    row.insertCell(0).innerHTML = training.tname;  // Corrected index
    row.insertCell(1).innerHTML = training.tmode;
    row.insertCell(2).innerHTML = training.tdescription;
    row.insertCell(3).innerHTML = training.apply_start_dt;
    row.insertCell(4).innerHTML = training.location;
    row.insertCell(5).innerHTML = training.coordinatorname;
    
        
    
    var applyNowButton = document.createElement("button");
    applyNowButton.textContent = "Apply Now";
    applyNowButton.className = "btn btn-success";
    applyNowButton.onclick = function () {
        var requestData = {
            tname: training.tname,
            tmode: training.tmode,
            description: training.tdescription,
            apply_start_to_end_date: training.apply_start_dt,
            maplocation: training.location,
            coordinator_details: training.coordinatorname
        };

        $.ajax({
            type: "POST",
            url: "/TTSS03/api/savetrainings",
            contentType: "application/json", 
            data: JSON.stringify(requestData), 
            success: function (response) {
                console.log("Apply Now successful:", response);
                
                window.location.href = "./apply_traning.html";



            },
            error: function (xhr, status, error) {
                console.error("Apply Now request error: ", error);
            }
        });
    };

    var actionCell = row.insertCell(6);
    actionCell.appendChild(applyNowButton);
}
        }
    });
</script>
			

            <!-- ################view Tranning  ######################### -->
            <div class="container mt-2 tab-content" id="tab3" style="display: none;">

                <div class="card mt-2">
                    <div class="card-header"><b>View Traning</b></div>
                    <div class="card-body">
                        <div id="viewTraning"></div>
                    </div>
                </div>
            </div>
            <script>
                // Replace 'example.xlsx' with the path to your Excel file
                var excelFileURL = './file.xlsx';

                fetch(excelFileURL)
                    .then(function (response) {
                        return response.arrayBuffer();
                    })
                    .then(function (data) {
                        var workbook = XLSX.read(data, { type: 'array' });

                        // Assuming you want to display the first sheet's data
                        var firstSheetName = workbook.SheetNames[0];
                        var worksheet = workbook.Sheets[firstSheetName];
                        var excelData = XLSX.utils.sheet_to_json(worksheet, { header: 1 });

                        // Display the Excel data
                        var tableHTML = '<table class="table table-striped table-bordered">';
                        for (var i = 0; i < excelData.length; i++) {
                            tableHTML += '<tr>';
                            for (var j = 0; j < excelData[i].length; j++) {
                                tableHTML += '<td>' + excelData[i][j] + '</td>';
                            }
                            tableHTML += '</tr>';
                        }
                        tableHTML += '</table>';

                        document.getElementById('viewTraning').innerHTML = tableHTML;
                    })
                    .catch(function (error) {
                        console.error('Error loading Excel file:', error);
                    });
            </script>

            <!--  script for show hide-->
            <script>
                function showTab(tabId) {
                    var tabs = document.querySelectorAll('.tab-content');
                    for (var i = 0; i < tabs.length; i++) {
                        tabs[i].style.display = 'none';
                    }

                    var tabToShow = document.getElementById(tabId);
                    if (tabToShow) {
                        tabToShow.style.display = 'block';
                    }
                }
            </script>


            <!-- Bootstrap core JS-->
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
            <!-- Core theme JS-->
            <script src="js/scripts.js"></script>
</body>

</html>