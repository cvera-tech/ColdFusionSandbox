<cfinclude template="beforecontent.cfm">
<cfquery datasource="HDStreet" name="rsCurrentEvents">
    SELECT [Id], [Name], [Date], [Location], [Venue]
    FROM [Events]
    WHERE [Date] >= #now()#
    ORDER BY [Date] ASC
</cfquery>

<div id="pageBody">
    <cfif isDefined("URL.eventId")>
        <cfquery datasource="HDStreet" name="rsEventDetails">
            SELECT [Name], [Date], [Location], [Venue], [Description]
            FROM [Events]
            WHERE [Id] = #URL.eventId#
        </cfquery>
        <cfoutput query="rsEventDetails">
            <div id="calendarContent">
                <h1> Agenda</h1>
                    <h1>#Name#</h1>
                    #Description#
                    <p><a href="agenda.cfm">Back to the Agenda</a></p>
            </div>
            <div id="calendarSideBar">
                <h1>Event Details</h1>
                <div id="EventDetails">
                    <p id="eventDate"><span id="month">#dateFormat(Date, "mmm")#</span> <span id="days">#day(Date)#</span></p>
                    <h2>#Name#</h2>
                    <p id="eventTime">#dateTimeFormat(Date, "h:mm tt")#</p>
                </div>
                <p>#Venue#</p>
                <p>#Location#</p>
                <p class="alignRight">&nbsp;</p>
            </div>
        </cfoutput>
    <cfelse>
        <cfif rsCurrentEvents.recordCount EQ 0>
            <p>Sorry, there are no events to display at this time</p>
        <cfelse>
            <div id="calendarContent">
                <table>
                    <cfoutput query="rsCurrentEvents">
                        <tr>
                            <th>#dateFormat(Date, "mmm dd, yyyy")#</th>
                            <td>#Name# - #Location#</td>
                            <td><a href="agenda.cfm?eventId=#Id#">Read More</a></td>
                        </tr>
                    </cfoutput>
                </table>
            </div>
            <div id="calendarSideBar">
                <cfif rsCurrentEvents.recordCount NEQ 0>
                    <div id="EventDetails">
                        <h1>Next Event</h1>
                        <cfoutput>
                            <p id="eventDate"><span id="month">#dateFormat(rsCurrentEvents.Date, "mmm")#</span> <span id="days">#day(rsCurrentEvents.Date)#</span></p>
                            <h2>#rsCurrentEvents.Name#</h2>
                            <p>#rsCurrentEvents.Venue# - #rsCurrentEvents.Location#</p>
                            <p class="alignRight"><a href="agenda.cfm?eventId=#rsCurrentEvents.Id#">Read More</a></p>
                        </cfoutput>
                    </div>
                </cfif>
            </div>
        </cfif>
    </cfif>
</div>
<cfinclude template="aftercontent.cfm">