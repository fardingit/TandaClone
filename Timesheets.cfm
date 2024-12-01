<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Timesheet Management</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
    <div class="container mt-5">
        <h1 class="text-center">Timesheet Management</h1>
        <table class="table table-bordered mt-3">
            <thead>
                <tr>
                    <th>Employee Name</th>
                    <th>Start Time</th>
                    <th>End Time</th>
                    <th>Total Hours</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <cfquery datasource="Tanda" name="timesheetData">
					SELECT 
						e.Name, 
						s.StartTime, 
						s.EndTime, 
						{fn TIMESTAMPDIFF(SQL_TSI_HOUR, s.StartTime, s.EndTime)} AS TotalHours
					FROM Shifts s
					INNER JOIN Employees e ON s.EmployeeID = e.ID
                </cfquery>
                <cfoutput query="timesheetData">
                    <tr>
                        <td>#Name#</td>
                        <td>#StartTime#</td>
                        <td>#EndTime#</td>
                        <td>#TotalHours#</td>
                        <td>
                            <button class="btn btn-primary edit-timesheet" data-id="#CurrentRow#">Edit</button>
                            <button class="btn btn-danger delete-timesheet" data-id="#CurrentRow#">Delete</button>
                        </td>
                    </tr>
                </cfoutput>
            </tbody>
        </table>
    </div>

    <!-- JavaScript for Button Actions -->
    <script>
        $(document).on("click", ".edit-timesheet", function () {
            const timesheetId = $(this).data("id");
            // Call C# API to fetch and edit timesheet data
            $.ajax({
                url: "https://localhost:7153/api/Timesheets/1", // Adjust C# API URL
                method: "GET",
                success: function (data) {
                    alert("Edit timesheet: " + JSON.stringify(data));
                },
                error: function (xhr) {
                    alert("Error fetching timesheet: " + xhr.responseText);
                }
            });
        });

        $(document).on("click", ".delete-timesheet", function () {
            const timesheetId = $(this).data("id");
            // Call C# API to delete timesheet
            $.ajax({
                url: "https://localhost:7153/api/Timesheets/1" + timesheetId, // Adjust C# API URL
                method: "DELETE",
                success: function () {
                    alert("Timesheet deleted successfully!");
                    location.reload();
                },
                error: function (xhr) {
                    alert("Error deleting timesheet: " + xhr.responseText);
                }
            });
        });
    </script>
</body>
</html>
