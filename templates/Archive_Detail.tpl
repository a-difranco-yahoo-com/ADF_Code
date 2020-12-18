
<html>
 <head>
  <link rel="stylesheet" type="text/css" href="css/comics.css" />
  <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
  
 </head>
 <body>
  {include file="TopMenu.tpl"}
  <div id="main" align="center">
   <form name="data" action="Archive.php" method="post">
   {include file="Archive_Menu.tpl"}

   <label for="SearchTitle">Search Title Text:</label>
   <input class="Search" type="text" id="SearchTitle"       name="SearchTitle" value='{$search['Title']}'>
   <label for="SearchTitle">Start Year</label>
   <input class="Search" type="number" id="SearchStartYear" name="SearchStartYear" value={$search['StartYear']}>
   <label for="SearchTitle">End Year</label>
   <input class="Search" type="number" id="SearchEndYear"   name="SearchEndYear"   value={$search['EndYear']}>

   <table class="form" border-width="1" border="1" cellspacing="1" cellpadding="2">
   <tr bgcolor="#e6eef1">
      <th>COMIC_TYPE</th>
      <th>TITLE</th>
      <th>VOLUME</th>
      <th>SERIES_RUN</th>
      <th>START_ISSUE</th>
      <th>END_ISSUE</th>
      <th>ACTION</th>
    </tr>
	
    {foreach $detail as $d}
    <tr bgcolor="{cycle values="#c9dae2,#e6eef1"}">
    <td>{$d.COMIC_TYPE}</td>
    <td>{$d.TITLE}</td>
    <td>{$d.VOLUME}</td>
    <td>{$d.SERIES_RUN}</td>
    <td>{$d.START_ISSUE}</td>
    <td>{$d.END_ISSUE}</td>
    <td><button value='{$d.TITLE_ID}'  name='TitleToDelete'  type="submit">Delete Series</button></td>
    {foreachelse}
    <tr><td COLSPAN=7 Style="TEXT-ALIGN:CENTER;">No Rows</td></tr>
    {/foreach}
   </table>
   <p>
   </form>
  </div>
  <script src='js/Archive_Detail.js'></script>
 </body>
</html>