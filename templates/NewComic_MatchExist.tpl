<html>
{include file="Header.tpl"}
 <body>
  {include file="TopMenu.tpl"}
  <div id="main" align="center">
   <form name="data" action="NewComic.php" method="post">
   {include file="NewComic_Menu.tpl"}

   <table class="data">
   <tr>
      <th>TITLE</th>
      <th>VOLUME</th>
      <th>ISSUE</th>
      <th>ACTION</th>
    </tr>
	
    {foreach $exist as $e}
    <tr>
    <td>{$e.TITLE}</td>
    <td>{$e.VOLUME}</td>
    <td>{$e.ISSUE}</td>
    <td><button value='{$e.COMICID}'  name='MatchToExist'  type="submit">Match Existing Comic</button></td>
    </tr>
    {foreachelse}
    <tr><td COLSPAN=4 Style="TEXT-ALIGN:CENTER;">No Rows</td></tr>
    {/foreach}
   </table>
   <p>
   </form>
  </div>
 </body>
</html>