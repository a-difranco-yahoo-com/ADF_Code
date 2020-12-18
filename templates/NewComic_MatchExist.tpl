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
      <th>ACTION</th>
    </tr>
	
    {foreach $exist as $e}
    <tr bgcolor="{cycle values="#c9dae2,#e6eef1"}">
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