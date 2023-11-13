<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <!-- Core theme CSS (includes Bootstrap)-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.17.3/xlsx.full.min.js"></script>
    <link href="css/styles.css" rel="stylesheet" />
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
                    onclick="showTab('tab1')">Achademic Calender</a>
                <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#!"
                    onclick="showTab('tab2')">Schedule Traning</a>
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
                    <div  id="sidebarToggle" >
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

                <div class="card mt-2">
                    <div class="card-header"><b>Achademic Calender</b></div>
                    <div class="card-body">
                        <div id="excelData"></div>
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

                        document.getElementById('excelData').innerHTML = tableHTML;
                    })
                    .catch(function (error) {
                        console.error('Error loading Excel file:', error);
                    });
            </script>
            <!-- Traning Schudule Form -->
            <div class="container tab-content " id="tab2" style="display: none;">
                <!-- Form Start  -->
                <div class="card mt-3">
                    <div class="card-header text-center">
                        <h4>Training schedule form</h4>
                    </div>
                    <!-- ################################ -->
                    <div class="container mt-2">
                        <!-- <div class="card"> -->
                        <!-- <div class=""> -->
                        <form class="card-body shadow-lg bg-body-tertiary rounded">
                            <div class="row">
                                <div class="form-group col-md-3">
                                    <div class="form-floating">
                                        <input type="text" class="form-control" id="floatingInputGridTreasury"
                                            placeholder="12343215" value="">
                                        <label for="floatingInputGridTreasury">Traning Ref Id</label>
                                    </div>
                                </div>
                                <div class="form-group col-md-3">
                                    <div class="form-floating">
                                        <button type="button" class="btn btn-primary btn-lg ">Search</button>
                                    </div>
                                </div>
                                <div class="form-group col-md-3">
                                    <div class="form-floating">
                                        <input type="text" class="form-control" id="floatingInputGridTreasury"
                                            placeholder="12343215" value="">
                                        <label for="floatingInputGridTreasury">Venue</label>
                                    </div>
                                </div>
                                <div class="form-group col-md-3">
                                    <div class="form-floating">
                                        <button type="button" class="btn btn-primary btn-lg ">Search</rchbutton>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>

                    <!-- ################################### -->






                    <div class="card-body">
                        <span class="text-danger"> * After search respective data will auto populated</span>

                        <form class="card-body shadow-lg p-3 mb-5 bg-body-tertiary rounded">
                            <div class="row">
                                <div class="form-group col-md-3">
                                    <div class="form-floating">
                                        <input type="text" class="form-control" id="traningType" placeholder="12343215"
                                            value="">
                                        <label for="traningType">Traning Type</label>
                                    </div>
                                </div>
                                <div class="form-group col-md-3">
                                    <div class="form-floating">
                                        <input type="text" class="form-control" id="traningMode"
                                            placeholder="99372257343" value="">
                                        <label for="traningMode">Traning Mode</label>
                                    </div>
                                </div>
                                <div class="form-group col-md-3">
                                    <div class="form-floating">
                                        <input type="text" class="form-control" id="traningMonth" placeholder="12343215"
                                            value="">
                                        <label for="traningMonth">Traning Month</label>
                                    </div>
                                </div>
                                <div class="form-group col-md-3">
                                    <div class="form-floating">
                                        <input type="text" class="form-control" id="traningYear" placeholder="12343215"
                                            value="">
                                        <label for="traningYear">Traning Year</label>
                                    </div>
                                </div>
                            </div>
                            <!-- ################### 2nd ################ -->
                            <div class="row mt-1">
                                <div class="form-group col-md-3">
                                    <div class="form-floating">
                                        <input type="text" class="form-control" id="traningName" placeholder="12343215"
                                            value="">
                                        <label for="traningName">Traning Name</label>
                                    </div>
                                </div>
                                <div class="form-group col-md-3">
                                    <div class="form-floating">
                                        <input type="text" class="form-control" id="module" placeholder="99372257343"
                                            value="">
                                        <label for="module">Module</label>
                                    </div>
                                </div>
                                <div class="form-group col-md-3">
                                    <div class="form-floating">
                                        <input type="text" class="form-control" id="description" placeholder="12343215"
                                            value="">
                                        <label for="description">Description</label>
                                    </div>
                                </div>
                                <div class="form-group col-md-3">
                                    <div class="form-floating">
                                        <input type="text" class="form-control" id="mapLocation" placeholder="12343215"
                                            value="">
                                        <label for="mapLocation">Map Location</label>
                                    </div>
                                </div>
                            </div>
                            <!-- ################################# 3rd ############################# -->
                            <div class="row mt-1">
                                <div class="form-group col-md-3">
                                    <div class="form-floating">
                                        <input type="text" class="form-control" id="grade" placeholder="12343215"
                                            value="">
                                        <label for="grade">Grade</label>
                                    </div>
                                </div>
                                <div class="form-group col-md-3">
                                    <div class="form-floating">
                                        <input type="text" class="form-control" id="Agency" placeholder="99372257343"
                                            value="">
                                        <label for="Agency">Agency</label>
                                    </div>
                                </div>
                                <div class="form-group col-md-3">
                                    <div class="form-floating">
                                        <input type="text" class="form-control" id="coOrdinaterName"
                                            placeholder="12343215" value="">
                                        <label for="coOrdinaterName">Co-Ordinater Name</label>
                                    </div>
                                </div>
                                <div class="form-group col-md-3">
                                    <div class="form-floating">
                                        <input type="text" class="form-control" id="email" placeholder="12343215"
                                            value="">
                                        <label for="email">Email</label>
                                    </div>
                                </div>
                            </div>
                            <!-- ############################# 4th ###############################
             -->
                            <div class="row mt-1">
                                <div class="form-group col-md-3">
                                    <div class="form-floating">
                                        <input type="text" class="form-control" id="mobile" placeholder="12343215"
                                            value="">
                                        <label for="mobile">Mobile</label>
                                    </div>
                                </div>
                                <div class="form-group col-md-3">
                                    <div class="form-floating">
                                        <input type="text" class="form-control" id="state" placeholder="99372257343"
                                            value="">
                                        <label for="state">State</label>
                                    </div>
                                </div>
                                <div class="form-group col-md-3">
                                    <div class="form-floating">
                                        <input type="text" class="form-control" id="district" placeholder="12343215"
                                            value="">
                                        <label for="district">District</label>
                                    </div>
                                </div>
                                <div class="form-group col-md-3">
                                    <div class="form-floating">
                                        <input type="text" class="form-control" id="mandal" placeholder="12343215"
                                            value="">
                                        <label for="mandal">mandal</label>
                                    </div>
                                </div>
                            </div>

                            <div class="row mt-1">
                                <span class="text-danger text-center">Please Fill The Bellow date</span>
                            </div>

                            <div class="row mt-1">
                                <div class="form-group col-md-3">
                                    <div class="form-floating">
                                        <input type="text" class="form-control" id="applicationSD"
                                            placeholder="12343215" value="">
                                        <label for="applicationSD">Application Start Date</label>
                                    </div>
                                </div>
                                <div class="form-group col-md-3">
                                    <div class="form-floating">
                                        <input type="text" class="form-control" id="applicationED"
                                            placeholder="99372257343" value="">
                                        <label for="applicationED">Application End Date</label>
                                    </div>
                                </div>
                                <div class="form-group col-md-3">
                                    <div class="form-floating">
                                        <input type="text" class="form-control" id="traningSD" placeholder="12343215"
                                            value="">
                                        <label for="traningSD">Traning Start Date</label>
                                    </div>
                                </div>
                                <div class="form-group col-md-3">
                                    <div class="form-floating">
                                        <input type="text" class="form-control" id="traningED" placeholder="12343215"
                                            value="">
                                        <label for="traningED">Traning End date</label>
                                    </div>
                                </div>
                            </div>
                            <div class="row mt-2">
                                <div class="col-md-3">
                                </div>
                                <div class="col-md-3">
                                    <button type="button" class="btn btn-primary btn-lg ">Schedule</button>
                                </div>
                                <div class="col-md-3">
                                    <button type="button" class="btn btn-danger btn-lg ">Clear</button>
                                </div>
                                <div class="col-md-3">

                                </div>

                            </div>

                        </form>
                    </div>
                </div>
                <form>
                </form>

            </div>


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