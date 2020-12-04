<html>
 <head>
  <link rel="stylesheet" type="text/css" href="css/comics.css" />
  <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
  
 </head>
 <body>
  {include file="TopMenu.tpl"}
  <div id="main" align="center">
   <form name="data" action="ReadingOrder.php" method="post">
   {include file="ReadingOrderMenu.tpl"}

   <table class="form" border-width="1" border="1" cellspacing="1" cellpadding="2">
   <tr bgcolor="#e6eef1">
      <th>LIST</th>
      <th>TITLE</th>
      <th>MIN_ISSUE</th>
      <th>MAX_ISSUE</th>
    </tr>
	
    {foreach $summ as $s }
    <tr bgcolor="{cycle values="#c9dae2,#e6eef1"}">
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