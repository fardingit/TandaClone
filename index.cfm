<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Workforce Management System</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <h1 class="text-center">Workforce Management Dashboard</h1>
        <hr>
        <div class="row">
            <!-- Employee Management -->
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Employee Management</h5>
                        <p class="card-text">Add, update, or remove employees from the system.</p>
                        <a href="employees.cfm" class="btn btn-primary">Manage Employees</a>
                    </div>
                </div>
            </div>
            <!-- Shift Management -->
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Shift Scheduling</h5>
                        <p class="card-text">Plan and organize employee shifts and schedules.</p>
                        <a href="shifts.cfm" class="btn btn-primary">Manage Shifts</a>
                    </div>
                </div>
            </div>
            <!-- Time Tracking -->
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Time Tracking</h5>
                        <p class="card-text">Monitor employee clock-in and clock-out times.</p>
                        <a href="timetracking.cfm" class="btn btn-primary">Time Tracking</a>
                    </div>
                </div>
            </div>
        </div>
        <footer class="text-center mt-4">
            <p>&copy; 2024 Workforce Management System</p>
        </footer>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
