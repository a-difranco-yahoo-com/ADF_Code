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
      <th>NEW_VOLUME</th>
      <th>NEW_ISSUE</th>
      <th>WISH_TITLE</th>
      <th>WISH_VOLUME</th>
      <th>WISH_ISSUE</th>
      <th>STATUS</th>
    </tr>
	
    {section name=rows loop=$pulls}
    <tr bgcolor="{cycle values="#c9dae2,#e6eef1"}">
    <td>{$pulls[rows]["NEW_TITLE"]}</td>
    <td>{$pulls[rows]["NEW_VOLUME"]}</td>
    <td>{$pulls[rows]["NEW_ISSUE"]}</td>
    <td>{$pulls[rows]["WISH_TITLE"]}</td>
    <td>{$pulls[rows]["WISH_VOLUME"]}</td>
    <td>{$pulls[rows]["WISH_ISSUE"]}</td>
    <td><input name='{$pulls[rows]["ID"]}'  value='M'  type="checkbox"></td>
    </tr>
    {/section}
   </table>
   <p>
    <input name="Commit" value="CommitMatchWish"    type="submit">
   </form>
  </div>
 </body>
</html>