<html>
{include file="Header.tpl"}
 <body>
  {include file="TopMenu.tpl"}
  <div id="main" align="center">
   <form name="data" action="ComicDB.php" method="post">
   {include file="ComicDB_Menu.tpl"}

   <table class="data">
   <tr>
      <th>TITLE</th>
      <th>VOLUME</th>
      <th>ISSUES</th>
      <th>ACTION</th>
    </tr>
	
    {foreach $summary as $s}
    <tr>
    <td>{$s.TITLE}</td>
    <td>{$s.VOLUME}</td>
    <td>{$s.ISSUES}</td>
    <td><button value='{$s.TITLE}'  name='ViewComicDBCompare'  type="submit">View Comparison</button></td>
    </tr>
    {/foreach}
   </table>
   <p>
   </form>
  </div>
 </body>
</html>