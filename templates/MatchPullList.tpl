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

   <table class="form" border-width="1" border="1" cellspacing="0" cellpadding="1">
   <tr bgcolor="#e6eef1">
      <th>NEW_TITLE</th>
      <th>NEW_ISSUE</th>
      <th>PULL_TITLE</th>
      <th>PULL_ISSUE</th>
      <th>STATUS</th>
    </tr>
	
    {section name=rows loop=$pulls}
    <tr bgcolor="{cycle values="#c9dae2,#e6eef1"}">
    <td>{$pulls[rows]["NEW_TITLE"]}</td>
    <td>{$pulls[rows]["NEW_ISSUE"]}</td>
    <td>{$pulls[rows]["PULL_TITLE"]}</td>
    <td>{$pulls[rows]["PULL_ISSUE"]}</td>
    <td><button value='{$pulls[rows]["ID"]}'  name='MatchToPull'  type="submit">Match Comic</button></td>
    </tr>
    {/section}
   </table>
   <p>
    <input name="Commit" value="CommitMatchPull"    type="submit">
   </form>
  </div>
 </body>
</html>