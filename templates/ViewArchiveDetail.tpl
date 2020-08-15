
<html>
 <head>
  <link rel="stylesheet" type="text/css" href="css/comics.css" />
  <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
  
 </head>
 <body>
  {include file="TopMenu.tpl"}
  <div id="main" align="center">
   <form name="data" action="CheckArchive.php" method="post">
   {include file="ArchiveMenu.tpl"}

   <table class="form" border-width="1" border="1" cellspacing="0" cellpadding="1">
   <tr>
   </tr>
   </table>
   <label for="SearchTitle">Search Title Text:</label>
   <input type="text" id="SearchTitle" name="SearchTitle">
   <label for="SearchYear">Search Year Text:</label>
   <input type="text" id="SearchYear" name="SearchYear"><br>

   <table class="form" border-width="1" border="1" cellspacing="0" cellpadding="1">
   <tr bgcolor="#e6eef1">
      <th>SOURCE</th>
      <th>TITLE</th>
      <th>VOLUME</th>
      <th>SERIES_RUN</th>
      <th>START_ISSUE</th>
      <th>START_ISSUE</th>
      <th>END_YEAR</th>
      <th>END_YEAR</th>
      <th>ISSUES</th>
    </tr>
	
    {section name=rows loop=$detail}
    <tr bgcolor="{cycle values="#c9dae2,#e6eef1"}">
    <td>{$detail[rows]["SOURCE"]}</td>
    <td>{$detail[rows]["TITLE"]}</td>
    <td>{$detail[rows]["VOLUME"]}</td>
    <td>{$detail[rows]["SERIES_RUN"]}</td>
    <td>{$detail[rows]["MIN_ISSUE"]}</td>
    <td>{$detail[rows]["MAX_ISSUE"]}</td>
    <td>{$detail[rows]["MIN_YEAR"]}</td>
    <td>{$detail[rows]["MAX_YEAR"]}</td>
    <td>{$detail[rows]["ISSUES"]}</td>
    {/section}
   </table>
   <p>
   </form>
  </div>
 </body>
</html>