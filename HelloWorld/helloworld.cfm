<html>
    <head>
    </head>
    <body>
        <cfset pasta = "This is a variable">
        <p>Hello World!</p>
        <cfoutput>#pasta#</cfoutput></p>
        <cfquery name="userQuery"
            datasource="Test Database">
            SELECT Id, FirstName, LastName FROM [User]
        </cfquery>
        <!--- <cfset pasta = userQuery()> --->
        <!--- <cfset writeDump(userQuery)> --->
        <table>
            <cfoutput query="userQuery">
                <tr>
                    <td>#Id#</td>
                    <td>#FirstName#</td>
                    <td>#LastName#</td>
                    <td>#currentRow#</td>
                </tr>
            </cfoutput>
        </table>
    <body>
</html>