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

   <table class="form" border-width="1" border="1" cellspacing="0" cellpadding="1">
   <tr bgcolor="#e6eef1">
      <th>TITLE</th>
      <th>VOLUME</th>
      <th>YEAR</th>
      <th>ISSUE</th>
      <th>SUBISSUE</th>
      <th>SERIES_RUN</th>
    </tr>
	
    {section name=rows loop=$wish}
    <tr bgcolor="{cycle values="#c9dae2,#e6eef1"}">
    <td>{$wish[rows]["TITLE"]}</td>
    <td>{$wish[rows]["VOLUME"]}</td>
    <td>{$wish[rows]["YEAR"]}</td>
    <td>{$wish[rows]["ISSUE"]}</td>
    <td>{$wish[rows]["SUBISSUE"]}</td>
    <td>{$wish[rows]["SERIES_RUN"]}</td>
    </tr>
    {/section}
   </table>
   <p>
   </form>
  </div>
 </body>
</html>
