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
      <th>TITLE</th>
      <th>VOLUME</th>
      <th>START ISSUE</th>
      <th>END ISSUE</th>
      <th>SUBISSUE</th>
      <th>SERIES_RUN</th>
    </tr>
	
    {foreach $wish as $w}
    <tr bgcolor="{cycle values="#c9dae2,#e6eef1"}">
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
