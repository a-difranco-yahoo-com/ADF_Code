
<html>
{include file="Header.tpl"}
 <body>
  {include file="TopMenu.tpl"}
  <div id="main" align="center">
   <form name="data" action="Archive.php" method="post">
   {include file="Archive_Menu.tpl"}

   <table class="form" border-width="1" border="1" cellspacing="1" cellpadding="2">
   <tr bgcolor="#e6eef1">
      <th>TITLE</th>
      <th>ISSUES</th>
      <th>View Details</th>
    </tr>
	
    {foreach $summary as $s}
    <tr bgcolor="{cycle values="#c9dae2,#e6eef1"}">
    <td>{$s.TITLE}</td>
    <td>{$s.ISSUES}</td>
    <td><button value='{$s.TITLE}'  name='ViewArchiveDetail'  type="submit">View Details</button></td>
    </tr>
    {foreachelse}
    <tr><td COLSPAN=3 Style="TEXT-ALIGN:CENTER;">No Rows</td></tr>
    {/foreach}
   </table>
   <p>
   </form>
  </div>
 </body>
</html>