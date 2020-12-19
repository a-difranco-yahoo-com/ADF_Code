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
      <th>COMICS</th>
      <th>TITLES</th>
    </tr>
	
    {foreach $summ as $s }
    <tr>
    <td>{$s.LIST}</td>
    <td>{$s.COMICS}</td>
    <td>{$s.TITLES}</td>
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