<html>
{include file="Header.tpl"}
 <body>
  {include file="TopMenu.tpl"}
  <div id="main" align="center">
   <form name="data" action="Runs.php" method="post">
   {include file="Runs_Menu.tpl"}

   <label for="Search">Search Text:</label>
   <input class="Search" type="text" id="Search" name="Search" value="{$title}"><br>

   <table class="data">
   <tr>
      <th>TITLE</th>
      <th>VOLUME</th>
      <th>START_ISSUE</th>
      <th>END_ISSUE</th>
      <th>SUBISSUE</th>
      <th>SERIES_RUN</th>
    </tr>
	
    {foreach $runs as $r }
    <tr>
    <td>{$r.TITLE}</td>
    <td>{$r.VOLUME}</td>
    <td>{$r.START_ISSUE}</td>
    <td>{$r.END_ISSUE}</td>
    <td>{$r.SUBISSUE}</td>
    <td>{$r.SERIES_RUN}</td>
    {foreachelse}
    <tr><td COLSPAN=6 Style="TEXT-ALIGN:CENTER;">No Rows</td></tr>
    {/foreach}
   </table>
   <p>
   <table class="data">
   <tr>
      <th>TITLE</th>
      <th>VOLUME</th>
      <th>START_ISSUE</th>
      <th>END_ISSUE</th>
      <th>SUBISSUE</th>
      <th>SERIES_RUN</th>
    </tr>
	
    {foreach $wish as $w }
    <tr>
    <td>{$w.TITLE}</td>
    <td>{$w.VOLUME}</td>
    <td>{$w.START_ISSUE}</td>
    <td>{$w.END_ISSUE}</td>
    <td>{$w.SUBISSUE}</td>
    <td>{$w.SERIES_RUN}</td>
    {foreachelse}
    <tr><td COLSPAN=6 Style="TEXT-ALIGN:CENTER;">No Rows</td></tr>
    {/foreach}
   </table>

   </form>
  </div>
  <script src='js/Runs_View.js'></script>
 </body>
</html>