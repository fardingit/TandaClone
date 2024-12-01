<cfcomponent displayname="Operations">

    <!-- Method to Add Employee -->
    <cffunction name="addEmployee" access="public" returntype="void">
        <cfargument name="name" type="string" required="true">
        <cfargument name="email" type="string" required="true">
        
        <cfquery datasource="Tanda">
            INSERT INTO Employees (Name, Email)
            VALUES (<cfqueryparam value="#arguments.name#" cfsqltype="cf_sql_varchar">, 
                    <cfqueryparam value="#arguments.email#" cfsqltype="cf_sql_varchar">)
        </cfquery>
    </cffunction>

    <!-- Method to View Employees -->
    <cffunction name="viewEmployees" access="public" returntype="query">
        <cfquery datasource="Tanda" name="qEmployees">
            SELECT ID, Name, Email
            FROM Employees
        </cfquery>
        <cfreturn qEmployees>
    </cffunction>

    <!-- Method to Update Employee -->
    <cffunction name="updateEmployee" access="public" returntype="void">
        <cfargument name="id" type="numeric" required="true">
        <cfargument name="name" type="string" required="true">
        <cfargument name="email" type="string" required="true">

        <cfquery datasource="Tanda">
            UPDATE Employees
            SET Name = <cfqueryparam value="#arguments.name#" cfsqltype="cf_sql_varchar">, 
                Email = <cfqueryparam value="#arguments.email#" cfsqltype="cf_sql_varchar">
            WHERE ID = <cfqueryparam value="#arguments.id#" cfsqltype="cf_sql_integer">
        </cfquery>
    </cffunction>

    <!-- Method to Delete Employee -->
    <cffunction name="deleteEmployee" access="public" returntype="void">
        <cfargument name="id" type="numeric" required="true">

        <cfquery datasource="Tanda">
            DELETE FROM Employees
            WHERE ID = <cfqueryparam value="#arguments.id#" cfsqltype="cf_sql_integer">
        </cfquery>
    </cffunction>

</cfcomponent>
