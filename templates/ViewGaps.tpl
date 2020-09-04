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
   <tr bgcolor="#e6eef1">
      <th>TITLE</th>
      <th>VOLUME</th>
      <th>START_ISSUE</th>
      <th>END_ISSUE</th>
      <th>SUBISSUE</th>
      <th>SERIES_RUN</th>
      <th>ACTION</th>
    </tr>
	
    {section name=rows loop=$gaps}
    <tr bgcolor="{cycle values="#c9dae2,#e6eef1"}">
    <td>{$gaps[rows]["TITLE"]}</td>
    <td>{$gaps[rows]["VOLUME"]}</td>
    <td>{$gaps[rows]["START_ISSUE"]}</td>
    <td>{$gaps[rows]["END_ISSUE"]}</td>
    <td>{$gaps[rows]["SUBISSUE"]}</td>
    <td>{$gaps[rows]["SERIES_RUN"]}</td>
    <td><button value='{$gaps[rows]["TITLE_ID"]}'  name='AddWishList'  type="submit">Add Wish List</button></td>
    {/section}
   </table>
   <p>
   </form>
  </div>
 </body>
</html>
