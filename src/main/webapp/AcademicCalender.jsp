<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>TTSS</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

<!-- Add this script tag after including Toastr CSS -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
<!-- Core theme CSS (includes Bootstrap)-->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.17.3/xlsx.full.min.js"></script>
<link href="css/styles.css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- Add this in the head section of your HTML file -->
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
</head>
<body>
	<div class="container tab-content col-12">
		<div class="card mt-2">
			<div class="card-header">
				<b>Academic Calendar</b>
			</div>
			<div class="card-body">
				<div class="table-responsive w-100" id="excelData"
					style="font-size: 14px;"></div>
			</div>
		</div>
	</div>

	<script>
    function displayExcelData() {
        var excelFileURL = './actualTable.csv';

        // Fetch and display Excel data
        fetch(excelFileURL)
            .then(function (response) {
                console.log('Response Status:', response.status);
                if (!response.ok) {
                    throw new Error('Failed to load Excel file');
                }
                return response.arrayBuffer();
            })
            .then(function (data) {
                var workbook = XLSX.read(data, { type: 'array' });
                var firstSheetName = workbook.SheetNames[0];
                var worksheet = workbook.Sheets[firstSheetName];
                var excelData = XLSX.utils.sheet_to_json(worksheet, { header: 1 });

                // Display the Excel data
                var tableHTML = '<table class="table table-striped table-bordered table-hover w-100">';
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
                toastr.error('Failed to load Excel file. Please try again.');
            });
    }

    // Call the function to display Excel data
    displayExcelData();
</script>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
	<!-- Toastr CSS and JS links go here -->
</body>
</html>
