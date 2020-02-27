<!---Get news years--->
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8" />
  <title>HD Street Concert Band - News</title>
  <link href="styles/hdStreet.css" rel="stylesheet" type="text/css" media="screen" />
  <script type="text/javascript" src="script/jquery.js"></script>
  <script type="text/javascript" src="script/menu.js"></script>

  <!--- CF Queries--->
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

</head>

<body>
<div id="wrapper">
  <div id="header"> <a href="#"><img src="images/logo.png" alt="logo" name="logo" width="188" height="181" id="logo" /></a>
    <p id="mainTitle"><img src="images/mainTitle.png" width="398" height="158" alt="HD Street Concert Band" /><span>HD Street Concert Band</span></p>
<ul>
       	<li><a href="siteMap.html">Site Map</a></li>
        <li><a href="contactUs.html">Contact us</a></li>
    </ul>
  </div>
  <div id="menu">
    <ul>
      <li><a href="index.html">Home</a></li>
      <li><a href="agenda.html">Agenda</a></li>
      <li><a href="#">The Band</a>
        <ul>
          <li><a href="director.html">The director</a></li>
          <li><a href="history.html">The band History</a></li>
        </ul>
      </li>
      <li><a href="wePlayForYou.html">We play for You</a></li>
      <li><a href="comePlayWithUs.html">Come play with us</a></li>
      <li><a href="news.html">News</a></li>
    </ul>
  </div>
  <div id="pageBody">
    <div id="calendarContent">
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
  <div id="footer">
    <p>&copy; Copyright 2011 - HD Street Concert Band</p>
  </div>
</div>
</body>
</html>
