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
      <th>FULL_NAME</th>
      <th>RELEASE_DATE</th>
      <th>ACTION</th>
    </tr>
	
    {foreach $pull as $p}
    <tr>
    <td>{$p.TITLE}</td>
    <td>{$p.VOLUME}</td>
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