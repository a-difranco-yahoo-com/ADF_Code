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
   <input type="text" id="SearchTitle" name="SearchTitle" value={$title}>

   <table class="form" border-width="1" border="1" cellspacing="0" cellpadding="1">
   <tr bgcolor="#e6eef1">
      <th>SOURCE</th>
      <th>TITLE</th>
      <th>VOLUME</th>
      <th>MIN_ISSUE</th>
      <th>MAX_ISSUE</th>
      <th>COMICS</th>
    </tr>
	
    {section name=rows loop=$summary}
    <tr bgcolor="{cycle values="#c9dae2,#e6eef1"}">
    <td>{$summary[rows]["SOURCE"]}</td>
    <td>{$summary[rows]["TITLE"]}</td>
    <td>{$summary[rows]["VOLUME"]}</td>
    <td>{$summary[rows]["MIN_ISSUE"]}</td>
    <td>{$summary[rows]["MAX_ISSUE"]}</td>
    <td>{$summary[rows]["COMICS"]}</td>
    {/section}
   </table>
   <p>
   <table class="form" border-width="1" border="1" cellspacing="0" cellpadding="1">
   <tr bgcolor="#e6eef1">
      <th>SOURCE</th>
      <th>TITLE</th>
      <th>VOLUME</th>
      <th>ISSUE</th>
      <th>SUBISSUE</th>
    </tr>
	
    {section name=rows loop=$detail}
    <tr bgcolor="{cycle values="#c9dae2,#e6eef1"}">
    <td>{$detail[rows]["SOURCE"]}</td>
    <td>{$detail[rows]["TITLE"]}</td>
    <td>{$detail[rows]["VOLUME"]}</td>
    <td>{$detail[rows]["ISSUE"]}</td>
    <td>{$detail[rows]["SUBISSUE"]}</td>
    {/section}
   </table>
   </form>
  </div>
 </body>
</html>