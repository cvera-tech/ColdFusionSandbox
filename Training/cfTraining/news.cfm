        <cfinclude template="beforecontent.cfm">
        <cfquery datasource="HDStreet" name="rsAllNews">
            SELECT Title, CreationDate, Id
            FROM News
            ORDER BY CreationDate DESC
        </cfquery>
        <cfquery datasource="HDStreet" name="rsNewsYears">
            SELECT YEAR(CreationDate) as CreationYear
            FROM News
            ORDER BY CreationDate DESC
        </cfquery>
        <div id="pageBody">
            <div id="calendarContent">
                <cfif isDefined("URL.newsId")>
                    <cfquery datasource="HDStreet" name="rsNewsDetails">
                        SELECT Title, CreationDate, Author, [Content]
                        FROM News
                        WHERE Id = #URL.newsID#
                    </cfquery>
                    <cfoutput query="rsNewsDetails">
                        <h1>#Title#</h1>
                        <p class="metadata">Published on #DateFormat(CreationDate, "mmmm d, yyyy")# by #Author#</p>
                        #Content#
                        <p><a href="news.cfm">Back to the news</a></p>
                    </cfoutput>
                <cfelse>
                    <table>
                        <tbody>
                            <cfoutput query="rsAllNews">
                                <tr>
                                    <td>#dateFormat(CreationDate, 'mmm dd, yyyy')#</td>
                                    <td>#Title#</td>
                                    <td><a href="news.cfm?newsID=#Id#">Read More</a></td>
                                </tr>
                            </cfoutput>
                        </tbody>
                    </table>
                </cfif>
            </div>
            <div id="calendarSideBar">
                <h1>News archive</h1>
                <ul>
                    <cfoutput query="rsNewsYears" group="CreationYear">
                        <li><a href="news.cfm">#CreationYear#</a></li>
                    </cfoutput>
                </ul>
                <p class="alignRight">&nbsp;</p>
            </div>
        </div>
        <cfinclude template="aftercontent.cfm">