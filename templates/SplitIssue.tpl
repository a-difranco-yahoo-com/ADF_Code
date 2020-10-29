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
      <th>KEY</th>
      <th>CODE</th>
      <th>VALUE</th>
    </tr>
  
    {foreach $startissue as $key => $st}
    <tr bgcolor="{cycle values="#c9dae2,#e6eef1"}"> <td>{$key}</td><td>Start Issue</td><td>{$st}</td></tr>
    {/foreach}
    {foreach $endissue as $key => $en}
    <tr bgcolor="{cycle values="#c9dae2,#e6eef1"}"> <td>{$key}</td><td>End Issue</td><td>{$en}</td></tr>
    {/foreach}
    {foreach $rowid as $key => $id}
    <tr bgcolor="{cycle values="#c9dae2,#e6eef1"}"> <td>{$key}</td><td>RowId</td><td>{$id}</td></tr>
    {/foreach}

   </table>
   <p>
   </form>
  </div>
 </body>
</html>