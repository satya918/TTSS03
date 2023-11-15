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

    <!-- Core theme CSS (includes Bootstrap)-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.17.3/xlsx.full.min.js"></script>
    <link href="css/styles.css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- Add this in the head section of your HTML file -->
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>

    
    
    <script>
    $(document).ready(function () {
        $("#saveSchedule").click(function () {
            var trainingRefId = $("#trainingReferenceId").val();
            var tvenueId = $("#venueId").val();
            var trainingMode = $("#trainingMode").val();
            var trainingMonth = $("#trainingMonth").val();
            var trainingYear = $("#trainingYear").val();
            var trainingName = $("#trainingName").val();
            var module = $("#module").val();
            var description = $("#description").val();
            var grade = $("#grade").val();
            var agency = $("#agency").val();
            var coordinatorname = $("#coordinatorName").val();
            var cemail = $("#email").val();
            var cmobile = $("#mobile").val();
            var tstate = $("#state").val();
            var tdistrict = $("#district").val();
            var tmandal = $("#mandal").val();
            var astartDate = $("#applicationSD").val();
            var aendDate = $("#applicationED").val();
            var tstartDate = $("#trainingSD").val();
            var tendDate = $("#trainingED").val();

            // Construct the formData object
            var formData = {
                ref_planner_id: trainingRefId,
                venue_id: tvenueId,
                tmode: trainingMode,
                tmonth: trainingMonth,
                tyear: trainingYear,
                tname: trainingName,
                tmodule: module,
                tdescription: description,
                tgrade: grade,
                tagency: agency,
                coordinatorname: coordinatorname,
                coordinatoremailid: cemail,
                coordinatormobileno: cmobile,
                state: tstate,
                district: tdistrict,
                mandal: tmandal,          
                apply_start_dt: astartDate,
                apply_end_dt: aendDate,
                training_start_dt: tstartDate,
                training_end_dt: tendDate
            };

            var jsonString = JSON.stringify(formData);


            fetch('/TTSS03/api/schedule', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: jsonString
            })
            .then(response => response.json())
            .then(data => {
                console.log("Schedule API response:", data);
                //toastr.success('API request successful!', 'Success');
                if (data.success) {
                toastr.success('Schedule application successful');
            } else {
                toastr.error('Schedule application failed');
            }

            })
            .catch(error => {
                console.log("Error:", error);
            });
        });
    });

    //script-2
    $(document).ready(function () {
        $("#searchButton").click(function () {
            var searchTerm = $("#trainingReferenceId").val();
 
            $.ajax({
                type: "GET",
                url: "/TTSS03/api/search/schedule?ref_planner_id=" + searchTerm,
                dataType: "json",
                success: function (response) {
					console.log(response);
                    var tmonth = response[0].tmonth;
                    var tyear = response[0].tyear;
                    var tname = response[0].tname;
                    var tdescription = response[0].tdescription;
                   
                    var tmode = response[0].tmode;
                    //var tmodule = response[0].tmodule;
                    var tgrade = response[0].tgrade;
                    var tagency = response[0].tagency;
                    var tcategory = response[0].tcategory;
                    var module = response[0].t_subjects;
 
                   
 
                    $("#trainingMonth").val(tmonth);
                    $("#trainingYear").val(tyear);
                    $("#trainingName").val(tname);
                    $("#description").val(tdescription);
                   
                    $("#traningMode").val(tmode);
                    //$("#module").val(tmodule);
                    $("#grade").val(tgrade);
                    $("#trainingMode").val(tmode);
                    $("#agency").val(tagency);
                    $("#trainingType").val(tcategory);
                    $("#module").val(module);
                },
                error: function (error) {
                    console.log("Error:", error);
                }
            });
        });
    });
 
    function formatDate(inputDate) {
        var date = new Date(inputDate);
        var year = date.getFullYear();
        var month = String(date.getMonth() + 1).padStart(2, '0');
        var day = String(date.getDate()).padStart(2, '0');
        return year + "-" + month + "-" + day;
    }
    
                  
   
    $(document).ready(function () {
        $.ajax({
            url: "/TTSS03/api/search/venue",
            type: "GET",
            dataType: "json",
            success: function (data) {
                var dropdown = $("#venueDropdown");
                dropdown.empty();
                dropdown.append($("<option>").val("").text("----Select Venue----"));
                $.each(data, function (index, item) {
                    var optionText = item.vname;
                    dropdown.append($("<option>").val(item.vid).text(optionText));
                });
            },
            error: function (error) {
                console.log("Error fetching venue data:", error);
            }
        });

        $('#venueDropdown').change(function () {
            var selectedVenueId = $(this).val();
            console.log(selectedVenueId);

            if (selectedVenueId) {
                $('#venueId').val(selectedVenueId);

                $.ajax({
                    type: "GET",
                    url: "/TTSS03/api/search/venueId?vid=" + selectedVenueId,
                    dataType: "json",
                    success: function (response) {
                        var vid = response[0].vid;

                        var vmandal = response[0].vmandal;
                        var vstate = response[0].vstate;
                        var vdistrict = response[0].vdistrict;
                        var vlocation = response[0].vlocation;
                        var vcontactname = response[0].vcontactname;
                        var vcontactno = response[0].vcontactno;
                        var vcontactmailid = response[0].vcontactmailid;
                        
                        $("#venueId").val(vid);
                        $("#mandal").val(vmandal);
                        $("#state").val(vstate);
                        $("#district").val(vdistrict);
                        $("#mapLocation").val(vlocation);
                        $("#coordinatorName").val(vcontactname);
                        $("#mobile").val(vcontactno);
                        $("#email").val(vcontactmailid);
                         

                    },
                    error: function (error) {
                        console.log("Error fetching venue details:", error);
                    }
                });
            } else {
                $('#venueId').val('');
                $('#mandal').val('');
                $('#state').val('');
                $('#district').val('');
                $('#mapLocation').val('');
                $('#coordinatorName').val('');
                $('#mobile').val('');
                $('#email').val('');
            }
        });
    });
    

</script>
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
                var excelFileURL = './actualTable.csv';
                 
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
                                        <input type="text" class="form-control" id="trainingReferenceId"
                                            placeholder="12343215" value="">
                                        <label for="floatingInputGridTreasury">Traning Ref Id</label>
                                    </div>
                                </div>
                                <div class="form-group col-md-3">
                                    <div class="form-floating">
                                        <button type="button" class="btn btn-primary btn-lg" Id="searchButton">Search</button>
                                    </div>
                                </div>
                                 <div class="form-group">
			    <label for="venue">Venue Name:</label>
			    <select id="venueDropdown" class="form-control"></select>
            </div><div class="form-group" style="display: none;">
    <label for="venue">Venue Id:</label>
    <input type="text" class="form-control" id="venueId" name="venueId"  required>
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
                                        <input type="text" class="form-control" id="trainingType" placeholder="12343215"
                                            value="">
                                        <label for="trainingType">Training Type</label>
                                    </div>
                                </div>
                                <div class="form-group col-md-3">
                                    <div class="form-floating">
                                        <input type="text" class="form-control" id="trainingMode"
                                            placeholder="99372257343" value="">
                                        <label for="trainingMode">Training Mode</label>
                                    </div>
                                </div>
                                <div class="form-group col-md-3">
                                    <div class="form-floating">
                                        <input type="text" class="form-control" id="trainingMonth" placeholder="12343215"
                                            value="">
                                        <label for="trainingMonth">Training Month</label>
                                    </div>
                                </div>
                                <div class="form-group col-md-3">
                                    <div class="form-floating">
                                        <input type="text" class="form-control" id="trainingYear" placeholder="12343215"
                                            value="">
                                        <label for="trainingYear">Training Year</label>
                                    </div>
                                </div>
                            </div>
                            <!-- ################### 2nd ################ -->
                            <div class="row mt-1">
                                <div class="form-group col-md-3">
                                    <div class="form-floating">
                                        <input type="text" class="form-control" id="trainingName" placeholder="12343215"
                                            value="">
                                        <label for="trainingName">Training Name</label>
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
                                        <input type="text" class="form-control" id="agency" placeholder="99372257343"
                                            value="">
                                        <label for="agency">Agency</label>
                                    </div>
                                </div>
                                <div class="form-group col-md-3">
                                    <div class="form-floating">
                                        <input type="text" class="form-control" id="coordinatorName"
                                            placeholder="12343215" value="">
                                        <label for="coordinatorName">Co-Ordinater Name</label>
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
                                        <input type="Date" class="form-control" id="applicationSD"
                                            placeholder="12343215" value="">
                                        <label for="applicationSD">Application Start Date</label>
                                    </div>
                                </div>
                                <div class="form-group col-md-3">
                                    <div class="form-floating">
                                        <input type="Date" class="form-control" id="applicationED"
                                            placeholder="99372257343" value="">
                                        <label for="applicationED">Application End Date</label>
                                    </div>
                                </div>
                                <div class="form-group col-md-3">
                                    <div class="form-floating">
                                        <input type="Date" class="form-control" id="trainingSD" placeholder="12343215"
                                            value="">
                                        <label for="trainingSD">Traning Start Date</label>
                                    </div>
                                </div>
                                <div class="form-group col-md-3">
                                    <div class="form-floating">
                                        <input type="Date" class="form-control" id="trainingED" placeholder="12343215"
                                            value="">
                                        <label for="trainingED">Traning End date</label>
                                    </div>
                                </div>
                            </div>
                            <div class="row mt-2">
                                <div class="col-md-3">
                                </div>
                                <div class="col-md-3">
                                    <button type="button" class="btn btn-primary btn-lg " Id="saveSchedule">Schedule</button>
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
    <button id="viewTrainingButton" class="btn btn-primary">View Training</button>
    <div class="card-body">
        <table border="1" id="trainingTable">
            <tr>
                <th>Training Ref Id</th>
                <th>Venue</th>
                <th>Training Mode</th>
                <th>Module</th>
                <th>Training Month</th>
                <th>Training Year</th>
                <th>Training Name</th>
                <th>Description</th>
                <th>Grade</th>
                <th>Agency</th>
                <th>Map Location</th>
                <th>Coordinator Name</th>
                <th>Email</th>
                <th>Mobile</th>
                <th>State</th>
                <th>District</th>
                <th>Mandal</th>
                <th>Application Start Date</th>
                <th>Application End Date</th>
                <th>Training Start Date</th>
                <th>Training End Date</th>
            </tr>
        </table>
    </div>
</div>

<script>
    $(document).ready(function() {
        $("#viewTrainingButton").click(function () {
            $.ajax({
                type: "GET",
                url: "/TTSS03/api/scheduledTrainings",
                dataType: "json",
                success: function(data) {
                    displayTrainingData(data);
                },
                error: function(xhr, status, error) {
                    console.error("API request error: " + error);
                }
            });
        });

        function displayTrainingData(data) {
            var trainings = data;
            var table = document.getElementById("trainingTable");

            // Clear existing rows
            table.innerHTML = "<tr><th>Training Ref Id</th><th>Venue</th><th>Training Mode</th><th>Module</th><th>Training Month</th><th>Training Year</th><th>Training Name</th><th>Description</th><th>Grade</th><th>Agency</th><th>Map Location</th><th>Coordinator Name</th><th>Email</th><th>Mobile</th><th>State</th><th>District</th><th>Mandal</th><th>Application Start Date</th><th>Application End Date</th><th>Training Start Date</th><th>Training End Date</th></tr>";

            for (var i = 0; i < trainings.length; i++) {
                var training = trainings[i];
                var row = table.insertRow(i + 1);

                row.insertCell(0).innerHTML = training.ref_planner_id;
                row.insertCell(1).innerHTML = training.venue_id;
                row.insertCell(2).innerHTML = training.tmode;
                row.insertCell(3).innerHTML = training.tmodule;
                row.insertCell(4).innerHTML = training.tmonth;
                row.insertCell(5).innerHTML = training.tyear;
                row.insertCell(6).innerHTML = training.tname;
                row.insertCell(7).innerHTML = training.tdescription;
                row.insertCell(8).innerHTML = training.tgrade;
                row.insertCell(9).innerHTML = training.tagency;
                row.insertCell(10).innerHTML = training.location;
                row.insertCell(11).innerHTML = training.coordinatorname;
                row.insertCell(12).innerHTML = training.coordinator_email;
                row.insertCell(13).innerHTML = training.coordinator_mobile;
                row.insertCell(14).innerHTML = training.tstate;
                row.insertCell(15).innerHTML = training.tdistrict;
                row.insertCell(16).innerHTML = training.tmandal;
                row.insertCell(17).innerHTML = training.apply_start_dt;
                row.insertCell(18).innerHTML = training.apply_end_dt;
                row.insertCell(19).innerHTML = training.training_start_dt;
                row.insertCell(20).innerHTML = training.training_end_dt;
            }
        }
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