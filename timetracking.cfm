<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Time Tracking</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <h1 class="text-center">Time Tracking</h1>
        <hr>
        <form method="post" action="clockIn.cfm">
            <div class="mb-3">
                <label for="employeeId" class="form-label">Employee ID</label>
                <input type="number" class="form-control" id="employeeId" name="employeeId" required>
            </div>
            <button type="submit" class="btn btn-primary">Clock In</button>
        </form>

        <hr>
        <h2 class="mt-4">Time Logs</h2>
        <cfquery name="qTimeLogs" datasource="Tanda">
            SELECT t.ID, e.Name, t.ClockInTime, t.ClockOutTime
            FROM TimeLogs t
            INNER JOIN Employees e ON t.EmployeeID = e.ID
        </cfquery>
        <table class="table table-striped mt-3">
            <thead>
                <tr>
                    <th>ID</th>WorkforceDB
                    <th>Employee Name</th>
                    <th>Clock In</th>
                    <th>Clock Out</th>
                </tr>
            </thead>
            <tbody>
                <cfoutput query="qTimeLogs">
                <tr>
                    <td>#ID#</td>
                    <td>#Name#</td>
                    <td>#ClockInTime#</td>
                    <td>#ClockOutTime#</td>
                </tr>
                </cfoutput>
            </tbody>
        </table>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
