<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>Untitled Document</title>
</head>

<body>
	<!---Step 1 - Create a structure using the structNew() function--->
	<cfset stUser = structNew() />
	<cfset stUser.firstName = 'John' />
	<cfset stUser.lastName = 'V.' />
	<cfset stUser.age = 24 />
	<p>Dumping the explicit Structure</p>
	<cfdump var = '#stUser#' label = 'Explicit Structure' />

	<!---Step 2 - Create the same structure using implicit notation--->
	<cfset stUserImplicit = {firstName = 'John', lsatName = 'V.', age = 24} />
	<p>Dumping the implicit structure</p>
	<cfdump var = '#stUserImplicit#' label = 'Implicit Structure' />
	
	<!---Step 3 - use structDelete() --->
	<cfset structDelete(stUser, 'age') />
	<p>Dumping stUser after the deletion of the 'age' key'</p>
	<cfdump var = '#stUser#' label = 'Explicit Structure after age deletion' />
	
	<!---Step 4 - use structClear() --->
	<cfset structClear(stUser) />
	<p>Dumping stUser after using structClear()</p>
	<cfdump var = '#stUser#' label = 'Explicit Structure after structClear' />
	
	<!---Step 5 - use structCount()--->
	
	<cfoutput>
		<p>stUserImplicit holds #structCount(stUserImplicit)# elements</p>
	</cfoutput>
</body>
</html>