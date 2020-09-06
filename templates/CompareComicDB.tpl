<html>
 <head>
  <link rel="stylesheet" type="text/css" href="css/comics.css" />
  <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
  
 </head>
 <body>
  {include file="TopMenu.tpl"}
  <div id="main" align="center">
   <form name="data" action="MatchComicDB.php" method="post">
   {include file="ComicDBMenu.tpl"}

   <label for="SearchTitle">Search Title Text:</label>
   <input type="text" id="SearchTitle" name="SearchTitle"     value={$title}>
   <label for="SearchTitle">Start Year</label>
   <input type="number" id="SearchTitle" name="SearchStartYear" value={$startYear}>
   <label for="SearchTitle">End Year</label>
   <input type="number" id="SearchTitle" name="SearchEndYear"   value={$endYear}>
   <p>

   <table class="form" border-width="1" border="1" cellspacing="0" cellpadding="1">
   <tr bgcolor="#e6eef1">
      <th>SOURCE</th>
      <th>TITLE</th>
      <th>VOLUME</th>
      <th>START_ISSUE</th>
      <th>END_ISSUE</th>
    </tr>
	
    {section name=rows loop=$runs}
    <tr bgcolor="{cycle values="#c9dae2,#e6eef1"}">
    <td>{$runs[rows]["COMIC_TYPE"]}</td>
    <td>{$runs[rows]["TITLE"]}</td>
    <td>{$runs[rows]["VOLUME"]}</td>
    <td>{$runs[rows]["START_ISSUE"]}</td>
    <td>{$runs[rows]["END_ISSUE"]}</td>
    {/section}
   </table>
   <p>
   </form>
  </div>
 </body>
</html>