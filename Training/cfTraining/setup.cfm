
	<!---Adjust event dates--->
	<cfquery name=rs_events datasource="HDStreet" >
		SELECT [Events].[Date], [Events].[Id]
		FROM [Events]
	</cfquery>
	<cfloop query="rs_events">
		<cfset eventDate = createDate((year(now())+1),month(#Date#),day(#Date#)) />
		<cfquery datasource="HDStreet">
			UPDATE [Events]
			SET [Date] = #eventDate#
			WHERE [Id] = #Id#
		</cfquery>
	</cfloop>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8" />
<title>CF training setup</title>
<link href="styles/hdStreet.css" rel="stylesheet" type="text/css" media="screen" />

</head>

<body>

<div id="wrapper">
	<p>Event dates have been updated.</p>
	<p>Go to the <a href="agenda.cfm">Agenda page</a> to check it out!</p>
</div>
</body>
</html>
