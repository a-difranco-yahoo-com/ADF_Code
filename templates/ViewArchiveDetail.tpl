
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

   <label for="SearchTitle">Search Title Text:</label>
   <input type="text" id="SearchTitle" name="SearchTitle" value='{$title}'>
   <label for="SearchTitle">Start Year</label>
   <input type="number" id="SearchTitle" name="SearchStartYear" value={$startYear}>
   <label for="SearchTitle">End Year</label>
   <input type="number" id="SearchTitle" name="SearchEndYear"   value={$endYear}>

   <table class="form" border-width="1" border="1" cellspacing="1" cellpadding="2">
   <tr bgcolor="#e6eef1">
      <th>COMIC_TYPE</th>
      <th>TITLE</th>
      <th>VOLUME</th>
      <th>SERIES_RUN</th>
      <th>START_ISSUE</th>
      <th>END_ISSUE</th>
      <th>ACTION</th>
    </tr>
	
    {section name=rows loop=$detail}
    <tr bgcolor="{cycle values="#c9dae2,#e6eef1"}">
    <td>{$detail[rows]["COMIC_TYPE"]}</td>
    <td>{$detail[rows]["TITLE"]}</td>
    <td>{$detail[rows]["VOLUME"]}</td>
    <td>{$detail[rows]["SERIES_RUN"]}</td>
    <td>{$detail[rows]["START_ISSUE"]}</td>
    <td>{$detail[rows]["END_ISSUE"]}</td>
    <td><button value='{$detail[rows]["TITLE_ID"]}'  name='TitleToDelete'  type="submit">Delete Series</button></td>
    {/section}
   </table>
   <p>
   </form>
  </div>
 </body>
</html>