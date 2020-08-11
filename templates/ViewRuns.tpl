<html>
 <head>
  <link rel="stylesheet" type="text/css" href="css/comics.css" />
  <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
  
 </head>
 <body>
  {include file="TopMenu.tpl"}
  <div id="main" align="center">
   <form name="data" action="ViewComicDatabase.php" method="post">
   {include file="ViewMenu.tpl"}

   <table class="form" border-width="1" border="1" cellspacing="0" cellpadding="1">
   <tr>
   </tr>
   </table>
   <label for="Search">Search Text:</label>
   <input type="text" id="Search" name="Search"><br>

   <table class="form" border-width="1" border="1" cellspacing="0" cellpadding="1">
   <tr bgcolor="#e6eef1">
      <th>TITLE</th>
      <th>VOLUME</th>
      <th>START_ISSUE</th>
      <th>END_ISSUE</th>
      <th>SUBISSUE</th>
      <th>SERIES_RUN</th>
    </tr>
	
    {section name=rows loop=$runs}
    <tr bgcolor="{cycle values="#c9dae2,#e6eef1"}">
    <td>{$runs[rows]["TITLE"]}</td>
    <td>{$runs[rows]["VOLUME"]}</td>
    <td>{$runs[rows]["START_ISSUE"]}</td>
    <td>{$runs[rows]["END_ISSUE"]}</td>
    <td>{$runs[rows]["SUBISSUE"]}</td>
    <td>{$runs[rows]["SERIES_RUN"]}</td>
    {/section}
   </table>
   <p>
   <table class="form" border-width="1" border="1" cellspacing="0" cellpadding="1">
   <tr bgcolor="#e6eef1">
      <th>TITLE</th>
      <th>VOLUME</th>
      <th>START_ISSUE</th>
      <th>END_ISSUE</th>
      <th>SUBISSUE</th>
      <th>SERIES_RUN</th>
    </tr>
	
    {section name=rows loop=$wish}
    <tr bgcolor="{cycle values="#c9dae2,#e6eef1"}">
    <td>{$wish[rows]["TITLE"]}</td>
    <td>{$wish[rows]["VOLUME"]}</td>
    <td>{$wish[rows]["START_ISSUE"]}</td>
    <td>{$wish[rows]["END_ISSUE"]}</td>
    <td>{$wish[rows]["SUBISSUE"]}</td>
    <td>{$wish[rows]["SERIES_RUN"]}</td>
    {/section}
   </table>

   </form>
  </div>
 </body>
</html>

