<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Database Setup - Apache Derby</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <h1 class="text-center">Database Setup - Apache Derby</h1>
        <hr>
        <cftry>
            <!-- Step 1: Create Employees Table -->
            <cfquery datasource="Tanda">
                CREATE TABLE Employees (
                    ID INTEGER GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1) PRIMARY KEY,
                    Name VARCHAR(100) NOT NULL,
                    Email VARCHAR(100) NOT NULL
                )
            </cfquery>
            <p>Employees table created successfully!</p>

            <!-- Step 2: Create Shifts Table -->
            <cfquery datasource="Tanda">
                CREATE TABLE Shifts (
                    ID INTEGER GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1) PRIMARY KEY,
                    EmployeeID INTEGER NOT NULL,
                    StartTime TIMESTAMP NOT NULL,
                    EndTime TIMESTAMP NOT NULL,
                    FOREIGN KEY (EmployeeID) REFERENCES Employees(ID)
                )
            </cfquery>
            <p>Shifts table created successfully!</p>

            <!-- Step 3: Create TimeLogs Table -->
            <cfquery datasource="Tanda">
                CREATE TABLE TimeLogs (
                    ID INTEGER GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1) PRIMARY KEY,
                    EmployeeID INTEGER NOT NULL,
                    ClockInTime TIMESTAMP NOT NULL,
                    ClockOutTime TIMESTAMP,
                    FOREIGN KEY (EmployeeID) REFERENCES Employees(ID)
                )
            </cfquery>
            <p>TimeLogs table created successfully!</p>

            <!-- Step 4: Populate Sample Data -->
            <cfquery datasource="Tanda">
                INSERT INTO Employees (Name, Email)
                VALUES
                    ('Alice Johnson', 'alice.johnson@example.com'),
                    ('Bob Smith', 'bob.smith@example.com'),
                    ('Charlie Davis', 'charlie.davis@example.com')
            </cfquery>
            <p>Sample data added to Employees table!</p>

            <cfquery datasource="Tanda">
                INSERT INTO Shifts (EmployeeID, StartTime, EndTime)
                VALUES
                    (1, TIMESTAMP('2024-12-01 09:00:00'), TIMESTAMP('2024-12-01 17:00:00')),
                    (2, TIMESTAMP('2024-12-01 10:00:00'), TIMESTAMP('2024-12-01 18:00:00'))
            </cfquery>
            <p>Sample data added to Shifts table!</p>

            <div class="alert alert-success mt-3">
                Database setup completed successfully!
            </div>

        <cfcatch>
            <!-- Error Handling -->
            <div class="alert alert-danger mt-3">
                <h3>Error Details</h3>
                <p><strong>Message:</strong> <cfoutput>#cfcatch.Message#</cfoutput></p>
                <p><strong>Detail:</strong> <cfoutput>#cfcatch.Detail#</cfoutput></p>
            </div>
        </cfcatch>
        </cftry>
    </div>
</body>
</html>
