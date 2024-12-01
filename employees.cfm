<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Employees</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <h1 class="text-center">Employee Management</h1>
        <hr>
        <!-- Add Employee Form -->
        <form method="post" action="addEmployee.cfm">
            <div class="mb-3">
                <label for="name" class="form-label">Employee Name</label>
                <input type="text" class="form-control" id="name" name="name" required>
            </div>
            <div class="mb-3">
                <label for="email" class="form-label">Email Address</label>
                <input type="email" class="form-control" id="email" name="email" required>
            </div>
            <button type="submit" class="btn btn-primary">Add Employee</button>
        </form>

        <hr>
        <h2 class="mt-4">Employee List</h2>

        <!-- Display Employee List -->
        <cfscript>
            // Create an instance of the Operations component
            operations = createObject("component", "Operations");

            // Call the viewEmployees method to get the employee list
            qEmployees = operations.viewEmployees();
        </cfscript>

        <table class="table table-striped mt-3">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <cfoutput query="qEmployees">
                <tr>
                    <td>#ID#</td>
                    <td>#Name#</td>
                    <td>#Email#</td>
                    <td>
                        <!-- Edit Employee Button -->
                        <a href="editEmployee.cfm?id=#ID#" class="btn btn-warning btn-sm">Edit</a>

                        <!-- Delete Employee Button (calls deleteEmployee method) -->
                        <form method="post" action="deleteEmployee.cfm" style="display:inline;">
                            <input type="hidden" name="id" value="#ID#">
                            <button type="submit" class="btn btn-danger btn-sm">Delete</button>
                        </form>
                    </td>
                </tr>
                </cfoutput>
            </tbody>
        </table>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
