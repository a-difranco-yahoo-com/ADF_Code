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

   <table class="form" border-width="1" border="1" cellspacing="1" cellpadding="2">
   <tr bgcolor="#e6eef1">
      <th>TITLE</th>
      <th>VOLUME</th>
      <th>COMICDB RUN</th>
      <th>COMICDB SERIES_RUN</th>
      <th>DIGITAL RUN</th>
      <th>DIGITAL SERIES_RUN</th>
      <th>ACTION</th>
    </tr>
	
    {foreach $diff as $d}
    <tr bgcolor="{cycle values="#c9dae2,#e6eef1"}">
    <td>{$d.TITLE}</td>
    <td>{$d.VOLUME}</td>
    <td>{$d.COMICDB_RUN}</td>
    <td>{$d.COMICDB_SERIES_RUN}</td>
    <td>{$d.DIGITAL_RUN}</td>
    <td>{$d.DIGITAL_SERIES_RUN}</td>
    <td>
    <button value='{$d.COMICDB_TITLE_ID},{$d.DIGITAL_TITLE_ID}'  name='AddSeriesRun'  type="submit">Add Series Run</button>
    </td>
    {foreachelse}
    <tr><td Style="TEXT-ALIGN:CENTER;" COLSPAN=7>No Rows</td></tr>
    {/foreach}
   </table>
   <p>
   </form>
  </div>
 </body>
</html>
