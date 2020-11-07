<html>
 <head>
  <link rel="stylesheet" type="text/css" href="css/comics.css" />
  <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
  
 </head>
 <body>
  {include file="TopMenu.tpl"}
  <div id="main" align="center">
   <form name="data" action="ViewComicDatabase.php" method="post">
   {include file="ViewMenu.tpl"}

   <label for="Search">Search Text:</label>
   <input class="Search" type="text" id="Search" name="Search" value="{$title}"><br>

   <table class="form" border-width="1" border="1" cellspacing="1" cellpadding="2">
   <tr bgcolor="#e6eef1">
      <th>TITLE</th>
      <th>VOLUME</th>
      <th>START_ISSUE</th>
      <th>END_ISSUE</th>
      <th>SUBISSUE</th>
      <th>SERIES_RUN</th>
    </tr>
	
    {foreach $runs as $r }
    <tr bgcolor="{cycle values="#c9dae2,#e6eef1"}">
    <td>{$r.TITLE}</td>
    <td>{$r.VOLUME}</td>
    <td>{$r.START_ISSUE}</td>
    <td>{$r.END_ISSUE}</td>
    <td>{$r.SUBISSUE}</td>
    <td>{$r.SERIES_RUN}</td>
    {foreachelse}
    <tr><td COLSPAN=6 Style="TEXT-ALIGN:CENTER;">No Rows</td></tr>
    {/foreach}
   </table>
   <p>
   <table class="form" border-width="1" border="1" cellspacing="1" cellpadding="2">
   <tr bgcolor="#e6eef1">
      <th>TITLE</th>
      <th>VOLUME</th>
      <th>START_ISSUE</th>
      <th>END_ISSUE</th>
      <th>SUBISSUE</th>
      <th>SERIES_RUN</th>
    </tr>
	
    {foreach $wish as $w }
    <tr bgcolor="{cycle values="#c9dae2,#e6eef1"}">
    <td>{$w.TITLE}</td>
    <td>{$w.VOLUME}</td>
    <td>{$w.START_ISSUE}</td>
    <td>{$w.END_ISSUE}</td>
    <td>{$w.SUBISSUE}</td>
    <td>{$w.SERIES_RUN}</td>
    {foreachelse}
    <tr><td COLSPAN=6 Style="TEXT-ALIGN:CENTER;">No Rows</td></tr>
    {/foreach}
   </table>

   </form>
  </div>
  <script src='js/ViewRuns.js'></script>
 </body>
</html>