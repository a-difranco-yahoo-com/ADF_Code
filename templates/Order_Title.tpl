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
      <th>TITLE</th>
      <th>MIN_ISSUE</th>
      <th>MAX_ISSUE</th>
    </tr>
	
    {foreach $summ as $s }
    <tr>
    <td>{$s.LIST}</td>
    <td>{$s.TITLE}</td>
    <td>{$s.MIN_ISSUE}</td>
    <td>{$s.MAX_ISSUE}</td>
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