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

   <table class="form" border-width="1" border="1" cellspacing="0" cellpadding="1">
   <tr>
   </tr>
   </table>
   <label for="SearchTitle">Search Title Text:</label>
   <input type="text" id="SearchTitle" name="SearchTitle">

   <table class="form" border-width="1" border="1" cellspacing="0" cellpadding="1">
   <tr bgcolor="#e6eef1">
      <th>TITLE</th>
      <th>VOLUME</th>
      <th>ISSUE</th>
      <th>SUBISSUE</th>
    </tr>
	
    {section name=rows loop=$missing}
    <tr bgcolor="{cycle values="#c9dae2,#e6eef1"}">
    <td>{$missing[rows]["TITLE"]}</td>
    <td>{$missing[rows]["VOLUME"]}</td>
    <td>{$missing[rows]["ISSUE"]}</td>
    <td>{$missing[rows]["SUBISSUE"]}</td>
    {/section}
   </table>
   <p>
   </form>
  </div>
 </body>
</html>