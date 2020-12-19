<html>
{include file="Header.tpl"}
 <body>
  {include file="TopMenu.tpl"}
  <div id="main" align="center">
   <form name="data" action="NewComic.php" method="post">
   {include file="NewComic_Menu.tpl"}

   <table class="data">
   <tr>
      <th>NEW_TITLE</th>
      <th>NEW_VOLUME</th>
      <th>NEW_ISSUE</th>
      <th>WISH_TITLE</th>
      <th>WISH_VOLUME</th>
      <th>WISH_ISSUE</th>
      <th>ACTION</th>
    </tr>
	
    {foreach $wishs as $w}
    <tr>
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