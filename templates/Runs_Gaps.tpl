<html>
{include file="Header.tpl"}
 <body>
  {include file="TopMenu.tpl"}
  <div id="main" align="center">
   <form name="data" action="Runs.php" method="post">
   {include file="Runs_Menu.tpl"}

   <input type="hidden" name="Origin" value="ViewGaps">
   <table class="data">
   <tr>
      <th>TITLE</th>
      <th>VOLUME</th>
      <th>START_ISSUE</th>
      <th>END_ISSUE</th>
      <th>SUBISSUE</th>
      <th>SERIES_RUN</th>
      <th>ACTION</th>
    </tr>
	
    {foreach $gaps as $g }
    <tr>
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
