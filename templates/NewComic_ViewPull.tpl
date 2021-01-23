<html>
{include file="Header.tpl"}
 <body>
  {include file="TopMenu.tpl"}
  <div id="main" align="center">
   <form name="data" action="NewComic.php" method="post">
   {include file="NewComic_Menu.tpl"}

   <table class="data">
   <tr>
   {if $sort eq 'Title'}
      <th>TITLE <button name='SortPullByTitle' type="submit">&#9660;</button> </th>
   {else}
      <th>TITLE <button name='SortPullByTitle' type="submit">&#9679;</button> </th>
   {/if}
      <th>ISSUE</th>
      <th>FULL_NAME</th>
   {if $sort eq 'Date'}
      <th>RELEASE_DATE <button name='SortPullByDate' type="submit">&#9660;</button></th>
   {else}
      <th>RELEASE_DATE <button name='SortPullByDate' type="submit">&#9679;</button></th>
   {/if}
      <th>ACTION</th>
    </tr>
	
    {foreach $pull as $p}
    <tr>
    <td>{$p.TITLE}</td>
    <td>{$p.ISSUE}</td>
    <td>{$p.FULL_NAME}</td>
    <td>{$p.RELEASE_DATE}</td>
    <td>
    <button value='{$p.COMICID}'  name='DigitalPull' type="submit">Digital Series</button>
    </td>
    </tr>
    {/foreach}
   </table>
   <p>
   </form>
  </div>
 </body>
</html>