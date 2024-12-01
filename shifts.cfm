<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Shifts</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <h1 class="text-center">Shift Management</h1>
        <hr>
        <form method="post" action="addShift.cfm">
            <div class="mb-3">
                <label for="employeeId" class="form-label">Employee ID</label>
                <input type="number" class="form-control" id="employeeId" name="employeeId" required>
            </div>
            <div class="mb-3">
                <label for="startTime" class="form-label">Shift Start</label>
                <input type="datetime-local" class="form-control" id="startTime" name="startTime" required>
            </div>
            <div class="mb-3">
                <label for="endTime" class="form-label">Shift End</label>
                <input type="datetime-local" class="form-control" id="endTime" name="endTime" required>
            </div>
            <button type="submit" class="btn btn-primary">Add Shift</button>
        </form>

        <hr>
        <h2 class="mt-4">Scheduled Shifts</h2>
        <cfquery name="qShifts" datasource="Tanda">
            SELECT s.ID, e.Name, s.StartTime, s.EndTime
            FROM Shifts s
            INNER JOIN Employees e ON s.EmployeeID = e.ID
        </cfquery>
        <table class="table table-striped mt-3">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Employee Name</th>
                    <th>Start Time</th>
                    <th>End Time</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <cfoutput query="qShifts">
                <tr>
                    <td>#ID#</td>
                    <td>#Name#</td>
                    <td>#StartTime#</td>
                    <td>#EndTime#</td>
                    <td>
                        <a href="editShift.cfm?id=#ID#" class="btn btn-warning btn-sm">Edit</a>
                        <a href="deleteShift.cfm?id=#ID#" class="btn btn-danger btn-sm">Delete</a>
                    </td>
                </tr>
                </cfoutput>
            </tbody>
        </table>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
