<cfquery datasource="HDStreet" name="rsWePlayForYou">
    SELECT [Title], [Content]
    FROM [Pages]
    WHERE [Id] = 1
</cfquery>
<cfmodule template="beforecontent.cfm" pageTitle="#rsWePlayForYou.Title#">
<div id="pageBody">
    <cfoutput>
        <h1>#rsWePlayForYou.Title#</h1>
        #rsWePlayForYou.Content#
    </cfoutput>
</div>
<cfinclude template="aftercontent.cfm">