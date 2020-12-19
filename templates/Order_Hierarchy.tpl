<html>
{include file="Header.tpl"}
 <body>
  {include file="TopMenu.tpl"}
  <div id="main" align="center">
   <form name="data" action="Order.php" method="post">
   {include file="Order_Menu.tpl"}

   <table class="data">
   <tr>
      <th>FIRST LIST</th>
      <th>SECOND LIST</th>
      <th>LEVEL</th>
    </tr>
	
    {foreach $hier as $h }
    <tr>
    <td>{$h.FIRST_LIST}</td>
    <td>{$h.SECOND_LIST}</td>
    <td>{$h.LEVEL}</td>
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