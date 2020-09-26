<html>
 <head>
  <link rel="stylesheet" type="text/css" href="css/comics.css" />
  <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
  
 </head>
 <body>
  {include file="TopMenu.tpl"}
  <div id="main" align="center">
   <form name="data" action="MatchNewComics.php" method="post">
   {include file="MatchMenu.tpl"}

   <table class="form" border-width="1" border="1" cellspacing="1" cellpadding="2">
   <tr bgcolor="#e6eef1">
      <th>TITLE</th>
      <th>VOLUME</th>
      <th>ISSUE</th>
      <th>FULL_NAME</th>
      <th>RELEASE_DATE</th>
      <th>ACTION</th>
    </tr>
	
    {section name=rows loop=$pull}
    <tr bgcolor="{cycle values="#c9dae2,#e6eef1"}">
    <td>{$pull[rows]["TITLE"]}</td>
    <td>{$pull[rows]["VOLUME"]}</td>
    <td>{$pull[rows]["ISSUE"]}</td>
    <td>{$pull[rows]["FULL_NAME"]}</td>
    <td>
    <input type="date" id='{$pull[rows]["RDID"]}' name='{$pull[rows]["RDID"]}' value='{$pull[rows]["RELEASE_DATE"]}'>
    </td>
    <td>
    <button value='{$pull[rows]["COMICID"]}'  name='DigitalPull' type="submit">Digital Series</button>
    </td>
    </tr>
    {/section}
   </table>
   <p>
   <button name="Commit" value="CommitPull" type="submit">Commit Changes</button>
   </form>
  </div>
 </body>
</html>