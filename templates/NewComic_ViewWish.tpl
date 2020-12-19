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
      <th>START ISSUE</th>
      <th>END ISSUE</th>
      <th>SUBISSUE</th>
      <th>SERIES_RUN</th>
    </tr>
	
    {foreach $wish as $w}
    <tr>
    <td>{$w.TITLE}</td>
    <td>{$w.VOLUME}</td>
    <td>{$w.START_ISSUE}</td>
    <td>{$w.END_ISSUE}</td>
    <td>{$w.SUBISSUE}</td>
    <td>{$w.SERIES_RUN}</td>
    </tr>
    {/foreach}
   </table>
   <p>
   </form>
  </div>
 </body>
</html>
