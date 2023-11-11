<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Upload and Display Excel</title>
    <!-- Include the required JavaScript libraries for Excel processing -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.17.5/xlsx.full.min.js"></script>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
    <div>
        <h2>Upload and Display Excel</h2>
        <!-- Input element for file upload -->
        <input type="file" id="excelFile" accept=".xlsx, .xls" />
        <button onclick="processExcel()">Process Excel</button>

        <!-- Display the content of the Excel file -->
        <div id="excelContent"></div>
    </div>

    <script type="text/javascript">
        function processExcel() {
            var fileInput = document.getElementById('excelFile');
            var excelContentDiv = document.getElementById('excelContent');

            if (fileInput.files.length > 0) {
                var file = fileInput.files[0];

                var reader = new FileReader();
                reader.onload = function (e) {
                    var data = e.target.result;
                    var workbook = XLSX.read(data, { type: 'binary' });

                    // Assume there is only one sheet in the Excel file
                    var sheetName = workbook.SheetNames[0];
                    var sheet = workbook.Sheets[sheetName];

                    // Convert sheet data to JSON
                    var jsonData = XLSX.utils.sheet_to_json(sheet, { header: 1 });

                    // Display JSON content on the page
                    excelContentDiv.innerHTML = '<pre>' + JSON.stringify(jsonData, null, 2) + '</pre>';
                };

                // Read the Excel file as binary data
                reader.readAsBinaryString(file);
            } else {
                alert('Please select an Excel file.');
            }
        }
    </script>
</body>
</html>
