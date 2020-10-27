<html>
 <head>
  <link rel="stylesheet" type="text/css" href="css/comics.css" />
  <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
  
 </head>
 <body>
  {include file="TopMenu.tpl"}
  <div id="main" align="center">
   <form name="data" action="MatchComicDB.php" method="post">
   {include file="ComicDBMenu.tpl"}

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