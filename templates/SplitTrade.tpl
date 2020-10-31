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
      <th>ISSUE</th>
      <th>SPLIT START_ISSUE</th>
      <th>SPLIT END_ISSUE</th>
      <th>ACTION</th>
    </tr>
  
   <input type="hidden" name="SearchTitle"     value="{$search["Title"]}">
   <input type="hidden" name="SearchStartYear" value="{$search["StartYear"]}">
   <input type="hidden" name="SearchEndYear"   value="{$search["EndYear"]}">

    {foreach $trades as $t}
    <tr bgcolor="{cycle values="#c9dae2,#e6eef1"}">
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