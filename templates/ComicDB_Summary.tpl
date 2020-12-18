<html>
{include file="Header.tpl"}
 <body>
  {include file="TopMenu.tpl"}
  <div id="main" align="center">
   <form name="data" action="ComicDB.php" method="post">
   {include file="ComicDB_Menu.tpl"}

   <table class="form" border-width="1" border="1" cellspacing="1" cellpadding="2">
   <tr bgcolor="#e6eef1">
      <th>TITLE</th>
      <th>VOLUME</th>
      <th>ISSUES</th>
      <th>ACTION</th>
    </tr>
	
    {foreach $summary as $s}
    <tr bgcolor="{cycle values="#c9dae2,#e6eef1"}">
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