<cfmodule template="beforecontent.cfm" pageTitle="Welcome">
<cfquery datasource="HDStreet" name="rsLatestNews">
    SELECT TOP 3 [Id], [Title], [Author], [CreationDate], [Content]
    FROM [News]
    ORDER BY [CreationDate] DESC
</cfquery>
<cfquery datasource="HDStreet" name="rsLatestEvents">
    SELECT TOP 3 [Id], [Name], [Date], [Location], [Venue]
    FROM [Events]
    WHERE [Date] >= #now()#
    ORDER BY [Date] ASC
</cfquery>

<div id="pageBody">
    <div id="homeContent">
        <cfoutput>
            <h1>#rsLatestNews.Title#</h1>
            <p class="metadata">Published on #dateFormat(rsLatestNews.CreationDate, "mmm dd, yyyy")# by #rsLatestNews.Author#</p>
            #rsLatestNews.Content#
        </cfoutput>
    </div>
    <div id="homeSideBar">
        <div class="pod">
            <h1 id="nextEventsTitle">Next Events</h1>
            <ul>
                <cfoutput query="rsLatestEvents">
                    <li><a href="agenda.cfm?eventId=#Id#"><strong>#dateFormat(Date, "mmm d")#</strong> - #Location#</a></li>
                </cfoutput>
            </ul>
        </div>
        <div class="pod">
            <h1 id="latestNewsTitle">Latest News</h1>
            <ul>
                <cfoutput query="rsLatestNews">
                    <li><a href="news.cfm?newsId=#Id#"><strong>#dateFormat(CreationDate, "mmm d")#</strong> - #Title#</a></li>
                </cfoutput>
            </ul>
        </div>
    </div>
</div>
    <!---First line to be included in footer.cfm--->
<cfinclude template="aftercontent.cfm">
