<html>
{include file="Header.tpl"}
 <body>
  {include file="TopMenu.tpl"}
  <div id="main" align="center">
   <form name="data" action="Runs.php" method="post">
   {include file="Runs_Menu.tpl"}

   <input type="hidden" name="Origin" value="ViewSplits">
   <table class="data">
   <tr>
      <th>TITLE</th>
      <th>VOLUME</th>
      <th>START_ISSUE</th>
      <th>END_ISSUE</th>
      <th>SERIES_RUN</th>
      <th>ACTION</th>
    </tr>
	
    {foreach $split as $s}
    <tr>
    <td>{$s.TITLE}</td>
    <td>{$s.VOLUME}</td>
    <td>{$s.START_ISSUE}</td>
    <td>{$s.END_ISSUE}</td>
    <td>{$s.SERIES_RUN}</td>
    <td>
    <button value='{$s.TITLE_ID},{$s.START_ISSUE},{$s.END_ISSUE}'  name='AddCompleteRun' type="submit">Add Complete Run</button>
    <button value='{$s.TITLE_ID}'                                  name='TitleToDelete'  type="submit">Delete Series</button>
    </td>
    {foreachelse}
    <tr><td Style="TEXT-ALIGN:CENTER;" COLSPAN=6>No Rows</td></tr>
    {/foreach}
   </table>
   <p>
   </form>
  </div>
 </body>
</html>
