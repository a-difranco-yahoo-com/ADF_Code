
<html>
{include file="Header.tpl"}
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

   <table class="data">
   <tr>
      <th>COMIC_TYPE</th>
      <th>TITLE</th>
      <th>VOLUME</th>
      <th>SERIES_RUN</th>
      <th>START_ISSUE</th>
      <th>END_ISSUE</th>
      <th>ACTION</th>
    </tr>
	
    {foreach $detail as $d}
    <tr>
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