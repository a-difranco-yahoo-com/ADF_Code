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

   <input type="hidden" name="Origin" value="ViewSplits">
   <table class="form" border-width="1" border="1" cellspacing="1" cellpadding="2">
   <tr bgcolor="#e6eef1">
      <th>TITLE</th>
      <th>VOLUME</th>
      <th>START_ISSUE</th>
      <th>END_ISSUE</th>
      <th>SERIES_RUN</th>
      <th>ACTION</th>
    </tr>
	
    {foreach $split as $s}
    <tr bgcolor="{cycle values="#c9dae2,#e6eef1"}">
    <td>{$s.TITLE}</td>
    <td>{$s.VOLUME}</td>
    <td>{$s.START_ISSUE}</td>
    <td>{$s.END_ISSUE}</td>
    <td>{$s.SERIES_RUN}</td>
    <td>
    <button value='{$s.TITLE_ID},{$s.START_ISSUE},{$s.END_ISSUE}'  name='AddCompleteRun' type="submit">Add Complete Run</button>
    <button value='{$s.TITLE_ID}'                                  name='TitleToDelete'  type="submit">Delete Series</button>
    </td>
    {foreachelse}
    <tr><td Style="TEXT-ALIGN:CENTER;" COLSPAN=6>No Rows</td></tr>
    {/foreach}
   </table>
   <p>
   </form>
  </div>
 </body>
</html>
