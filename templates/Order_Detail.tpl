<html>
{include file="Header.tpl"}
 <body>
  {include file="TopMenu.tpl"}
  <div id="main" align="center">
   <form name="data" action="Order.php" method="post">
   {include file="Order_Menu.tpl"}

   <table class="data">
   <tr>
      <th>LIST</th>
      <th>SEQUENCE_NUMBER</th>
      <th>TITLE</th>
      <th>ISSUE</th>
    </tr>
	
    {foreach $det as $d }
    <tr>
    <td>{$d.LIST}</td>
    <td>{$d.SEQUENCE_NUMBER}</td>
    <td>{$d.TITLE}</td>
    <td>{$d.ISSUE}</td>
    </tr>
    {foreachelse}
    <tr><td COLSPAN=4 Style="TEXT-ALIGN:CENTER;">No Rows</td></tr>
    {/foreach}
   </table>
   <p>

   </form>
  </div>
 </body>
</html>