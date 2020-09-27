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
	
    {section name=rows loop=$diff}
    <tr bgcolor="{cycle values="#c9dae2,#e6eef1"}">
    <td>{$diff[rows]["TITLE"]}</td>
    <td>{$diff[rows]["VOLUME"]}</td>
    <td>{$diff[rows]["COMICDB_RUN"]}</td>
    <td>{$diff[rows]["COMICDB_SERIES_RUN"]}</td>
    <td>{$diff[rows]["DIGITAL_RUN"]}</td>
    <td>{$diff[rows]["DIGITAL_SERIES_RUN"]}</td>
    <td>
    <button value='{$diff[rows]["COMICDB_TITLE_ID"]},{$diff[rows]["DIGITAL_TITLE_ID"]}'  name='AddSeriesRun'  type="submit">Add Series Run</button>
    </td>
    {/section}
   </table>
   <p>
   </form>
  </div>
 </body>
</html>
