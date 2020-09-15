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
      <th>NEW_TITLE</th>
      <th>NEW_VOLUME</th>
      <th>NEW_ISSUE</th>
      <th>WISH_TITLE</th>
      <th>WISH_VOLUME</th>
      <th>WISH_ISSUE</th>
      <th>ACTION</th>
    </tr>
	
    {section name=rows loop=$wishs}
    <tr bgcolor="{cycle values="#c9dae2,#e6eef1"}">
    <td>{$wishs[rows]["NEW_TITLE"]}</td>
    <td>{$wishs[rows]["NEW_VOLUME"]}</td>
    <td>{$wishs[rows]["NEW_ISSUE"]}</td>
    <td>{$wishs[rows]["WISH_TITLE"]}</td>
    <td>{$wishs[rows]["WISH_VOLUME"]}</td>
    <td>{$wishs[rows]["WISH_ISSUE"]}</td>
    <td><button value='{$wishs[rows]["MATCH_ID"]}'  name='MatchToWish'  type="submit">Match Comics</button></td>
    </tr>
    {/section}
   </table>
   <p>
   </form>
  </div>
 </body>
</html>