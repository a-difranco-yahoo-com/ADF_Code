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
      <th>LIST</th>
      <th>SEQUENCE_NUMBER</th>
      <th>TITLE</th>
      <th>ISSUE</th>
    </tr>
	
    {foreach $det as $d }
    <tr bgcolor="{cycle values="#c9dae2,#e6eef1"}">
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