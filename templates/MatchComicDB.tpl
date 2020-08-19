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
   <input type="text"   id="SearchTitle"   value='{$title}'    name="SearchTitle">
   <label for="SearchTitle">Cut Off Year:</label>
   <input type="number" id="CutOffYear"    value='{$year}'     name="CutOffYear">
   <label for="SearchTitle">Minimum SIM:</label>
   <input type="number" id="Sim"            value='{$sim}'     name="Sim">
   <label for="SearchTitle">Include Matches:</label>
   <input type="text"   id="IncludeMatches" value='{$include}' name="IncludeMatches">

   <table class="form" border-width="1" border="1" cellspacing="0" cellpadding="1">
   <tr bgcolor="#e6eef1">
      <th>COMICDB_TITLE</th>
      <th>COMICDB_VOLUME</th>
      <th>DIGITAL_TITLE</th>
      <th>DIGITAL_VOLUME</th>
      <th>SIM</th>
      <th>COMICDB_COMICS</th>
      <th>DIGITAL_COMICS</th>
      <th>MATCHES</th>
      <th>SUBMATCHES</th>
      <th>MATCHED</th>
      <th>STATUS</th>
    </tr>
	
    {section name=rows loop=$match}
    <tr bgcolor="{cycle values="#c9dae2,#e6eef1"}">
    <td>{$match[rows]["COMICDB_TITLE"]}</td>
    <td>{$match[rows]["COMICDB_VOLUME"]}</td>
    <td>{$match[rows]["DIGITAL_TITLE"]}</td>
    <td>{$match[rows]["DIGITAL_VOLUME"]}</td>
    <td>{$match[rows]["SIM"]}</td>
    <td>{$match[rows]["COMICDB_COMICS"]}</td>
    <td>{$match[rows]["DIGITAL_COMICS"]}</td>
    <td>{$match[rows]["MATCHES"]}</td>
    <td>{$match[rows]["SUBMATCHES"]}</td>
    <td>{$match[rows]["MATCHED"]}</td>
    <td><input name='{$match[rows]["STATUS"]}'  value='M'  type="checkbox"></td>
    </tr>
    {/section}
   </table>
   <p>
    <input name="Commit" value="CommitMatchComicDB"    type="submit">
   </form>
  </div>
 </body>
</html>
