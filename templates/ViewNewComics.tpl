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
      <th>STATUS</th>
    </tr>
	
    {section name=rows loop=$new}
    <tr bgcolor="{cycle values="#c9dae2,#e6eef1"}">
    <td>{$new[rows]["TITLE"]}</td>
    <td>{$new[rows]["VOLUME"]}</td>
    <td>{$new[rows]["YEAR"]}</td>
    <td>{$new[rows]["ISSUE"]}</td>
    <td>{$new[rows]["SUBISSUE"]}</td>
    <td>{$new[rows]["SERIES_RUN"]}</td>
    <td>
    <select id='{$new[rows]["ID"]}' name='{$new[rows]["ID"]}'>
    <option value=""></option>
    <option value="D">Digital</option>
    <option value="O">Oneshot</option>
    <option value="N">New</option>
    <option value="B">Back issue</option>
    </select>
    <td>
    </tr>
    {/section}
   </table>
   <p>
   <button name="Commit" value="CommitNew" type="submit">Commit Changes</button>
   </form>
  </div>
 </body>
</html>