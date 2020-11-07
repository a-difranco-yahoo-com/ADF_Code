<html>
 <head>
  <link rel="stylesheet" type="text/css" href="css/comics.css" />
  <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
  
 </head>
 <body>
  {include file="TopMenu.tpl"}
  <div id="main" align="center">
   <form name="data" action="MatchNewComics.php" method="post">
   {include file="MatchMenu.tpl"}

   <table class="form" border-width="1" border="1" cellspacing="1" cellpadding="2">
   <tr bgcolor="#e6eef1">
      <th>NEW_TITLE</th>
      <th>NEW_VOLUME</th>
      <th>NEW_ISSUE</th>
      <th>WISH_TITLE</th>
      <th>WISH_VOLUME</th>
      <th>WISH_ISSUE</th>
      <th>ACTION</th>
    </tr>
	
    {foreach $wishs as $w}
    <tr bgcolor="{cycle values="#c9dae2,#e6eef1"}">
    <td>{$w.NEW_TITLE}</td>
    <td>{$w.NEW_VOLUME}</td>
    <td>{$w.NEW_ISSUE}</td>
    <td>{$w.WISH_TITLE}</td>
    <td>{$w.WISH_VOLUME}</td>
    <td>{$w.WISH_ISSUE}</td>
    <td><button value='{$w.MATCH_ID}'  name='MatchToWish'  type="submit">Match Comics</button></td>
    </tr>
    {foreachelse}
    <tr><td COLSPAN=7 Style="TEXT-ALIGN:CENTER;">No Rows</td></tr>
    {/foreach}
   </table>
   <p>
   </form>
  </div>
 </body>
</html>