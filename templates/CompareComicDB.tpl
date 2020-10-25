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
   <input class="Search" type="text" id="SearchTitle" name="SearchTitle"     value="{$title}">
   <label for="SearchTitle">Start Year</label>
   <input class="Search" type="number" id="SearchTitle" name="SearchStartYear" value={$startYear}>
   <label for="SearchTitle">End Year</label>
   <input class="Search" type="number" id="SearchTitle" name="SearchEndYear"   value={$endYear}>
   <p>

   <table class="form" border-width="1" border="1" cellspacing="1" cellpadding="2">
   <tr bgcolor="#e6eef1">
      <th>SOURCE</th>
      <th>TITLE</th>
      <th>VOLUME</th>
      <th>START_ISSUE</th>
      <th>END_ISSUE</th>
      <th>ACTION</th>
    </tr>
	
    {section name=rows loop=$runs}
    <tr bgcolor="{cycle values="#c9dae2,#e6eef1"}">
    <td>{$runs[rows]["COMIC_TYPE"]}</td>
    <td>{$runs[rows]["TITLE"]}</td>
    <td>{$runs[rows]["VOLUME"]}</td>
    <td>{$runs[rows]["START_ISSUE"]}</td>
    <td>{$runs[rows]["END_ISSUE"]}</td>
    <td><button value='{$runs[rows]["TITLE_ID"]}'  name='SplitTrade'
       {if {$runs[rows]["COMIC_TYPE"] == "DIGITAL"}} DISABLED {/if}  type="submit">Split Trade</button></td>
    {/section}
   </table>
   <p>
   <table class="form" border-width="1" border="1" cellspacing="1" cellpadding="2">
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
      <th>ACTION</th>
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
    <td><button value='{$match[rows]["MATCH_ID"]}'  name='MatchComicDB'
       {if {$match[rows]["MATCHED"] == "Y"}} DISABLED {/if}  type="submit">Match Comics</button></td>
    </tr>
    {/section}
   </table>
   </form>
  </div>
  <script src='js/CompareComicDB.js'></script>
 </body>
</html>