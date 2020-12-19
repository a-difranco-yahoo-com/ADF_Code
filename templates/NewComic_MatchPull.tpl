<html>
{include file="Header.tpl"}
 <body>
  {include file="TopMenu.tpl"}
  <div id="main" align="center">
   <form name="data" action="NewComic.php" method="post">
   {include file="NewComic_Menu.tpl"}

   <label for="Search">Match Quality</label>
   <input class="Match" type="number" name="MatchLevel" value="{$level}"><br>

   <table class="data">
   <tr>
      <th>NEW_TITLE</th>
      <th>NEW_ISSUE</th>
      <th>PULL_TITLE</th>
      <th>PULL_ISSUE</th>
      <th>ACTION</th>
    </tr>
	
    {foreach $pulls as $p }
    <tr>
    <td>{$p.NEW_TITLE}</td>
    <td>{$p.NEW_ISSUE}</td>
    <td>{$p.PULL_TITLE}</td>
    <td>{$p.PULL_ISSUE}</td>
    <td><button value='{$p.MATCH_ID}'  name='MatchToPull'  type="submit">Match Comics</button></td>
    </tr>
    {foreachelse}
    <tr><td COLSPAN=5 Style="TEXT-ALIGN:CENTER;">No Rows</td></tr>
    {/foreach}
   </table>
   </form>
  </div>
 </body>
</html>