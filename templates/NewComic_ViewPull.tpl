<html>
 <head>
  <link rel="stylesheet" type="text/css" href="css/comics.css" />
  <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
  
 </head>
 <body>
  {include file="TopMenu.tpl"}
  <div id="main" align="center">
   <form name="data" action="NewComic.php" method="post">
   {include file="NewComic_Menu.tpl"}

   <table class="form" border-width="1" border="1" cellspacing="1" cellpadding="2">
   <tr bgcolor="#e6eef1">
      <th>TITLE</th>
      <th>VOLUME</th>
      <th>ISSUE</th>
      <th>FULL_NAME</th>
      <th>RELEASE_DATE</th>
      <th>ACTION</th>
    </tr>
	
    {foreach $pull as $p}
    <tr bgcolor="{cycle values="#c9dae2,#e6eef1"}">
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