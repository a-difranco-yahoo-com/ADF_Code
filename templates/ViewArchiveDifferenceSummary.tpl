
<html>
 <head>
  <link rel="stylesheet" type="text/css" href="css/comics.css" />
  <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
  
 </head>
 <body>
  {include file="TopMenu.tpl"}
  <div id="main" align="center">
   <form name="data" action="CheckArchive.php" method="post">
   {include file="ArchiveMenu.tpl"}

   <table class="form" border-width="1" border="1" cellspacing="0" cellpadding="1">
   <tr bgcolor="#e6eef1">
      <th>TITLE</th>
      <th>ISSUES</th>
      <th>View Details</th>
    </tr>
	
    {section name=rows loop=$summary}
    <tr bgcolor="{cycle values="#c9dae2,#e6eef1"}">
    <td>{$summary[rows]["TITLE"]}</td>
    <td>{$summary[rows]["ISSUES"]}</td>
    <td><button value='{$summary[rows]["TITLE"]}'  name='ViewArchiveDetail'  type="submit">View Details</button></td>
    </tr>
    {/section}
   </table>
   <p>
   </form>
  </div>
 </body>
</html>