<html>
 <head>
  <link rel="stylesheet" type="text/css" href="css/comics.css" />
  <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
  
 </head>
 <body>
  {include file="TopMenu.tpl"}
  <div id="main" align="center">
   <form name="data" action="Order.php" method="post">
   {include file="Order_Menu.tpl"}

   <table class="form" border-width="1" border="1" cellspacing="1" cellpadding="2">
   <tr bgcolor="#e6eef1">
      <th>FIRST LIST</th>
      <th>SECOND LIST</th>
      <th>LEVEL</th>
    </tr>
	
    {foreach $hier as $h }
    <tr bgcolor="{cycle values="#c9dae2,#e6eef1"}">
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