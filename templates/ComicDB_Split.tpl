<html>
{include file="Header.tpl"}
 <body>
  {include file="TopMenu.tpl"}
  <div id="main" align="center">
   <form name="data" action="ComicDB.php" method="post">
   {include file="ComicDB_Menu.tpl"}

   <table class="data">
   <tr>
      <th>TITLE</th>
      <th>VOLUME</th>
      <th>ISSUE</th>
      <th>SPLIT START_ISSUE</th>
      <th>SPLIT END_ISSUE</th>
      <th>ACTION</th>
    </tr>
  
   <input type="hidden" name="SearchTitle"     value="{$search["Title"]}">
   <input type="hidden" name="SearchStartYear" value="{$search["StartYear"]}">
   <input type="hidden" name="SearchEndYear"   value="{$search["EndYear"]}">

    {foreach $trades as $t}
    <tr>
    <td>{$t.TITLE}</td>
    <td>{$t.VOLUME}</td>
    <td>{$t.ISSUE}</td>
    <td><input class="Input" type="number" name="StartIssue{$t@iteration}" value=""></TD>
    <td><input class="Input" type="number" name="EndIssue{$t@iteration}"   value=""></TD>
        <input               type="hidden" name="RowId{$t@iteration}"      value="{$t.ROWID_CB}">
    <td><button              type="submit" name='SplitIssue'               value='Y'>Split Issue</button></td>
    {/foreach}

   </table>
   <p>
   </form>
  </div>
 </body>
</html>