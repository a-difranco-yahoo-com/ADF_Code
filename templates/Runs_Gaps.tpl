<html>
 <head>
  <link rel="stylesheet" type="text/css" href="css/comics.css" />
  <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
  
 </head>
 <body>
  {include file="TopMenu.tpl"}
  <div id="main" align="center">
   <form name="data" action="Runs.php" method="post">
   {include file="Runs_Menu.tpl"}

   <input type="hidden" name="Origin" value="ViewGaps">
   <table class="form" border-width="1" border="1" cellspacing="1" cellpadding="2">
   <tr bgcolor="#e6eef1">
      <th>TITLE</th>
      <th>VOLUME</th>
      <th>START_ISSUE</th>
      <th>END_ISSUE</th>
      <th>SUBISSUE</th>
      <th>SERIES_RUN</th>
      <th>ACTION</th>
    </tr>
	
    {foreach $gaps as $g }
    <tr bgcolor="{cycle values="#c9dae2,#e6eef1"}">
    <td>{$g.TITLE}</td>
    <td>{$g.VOLUME}</td>
    <td>{$g.START_ISSUE}</td>
    <td>{$g.END_ISSUE}</td>
    <td>{$g.SUBISSUE}</td>
    <td>{$g.SERIES_RUN}</td>
    <td>
    <button value='{$g.TITLE_ID}'                                  name='AddWishList'    type="submit">Add Wish List</button>
    <button value='{$g.TITLE_ID},{$g.START_ISSUE},{$g.END_ISSUE}'  name='AddCompleteRun' type="submit">Add Complete Run</button>
    </td>
    {/foreach}
   </table>
   <p>
   </form>
  </div>
 </body>
</html>