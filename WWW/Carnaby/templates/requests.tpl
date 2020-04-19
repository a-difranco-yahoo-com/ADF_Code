<html>
 <head>
  <link rel="stylesheet" type="text/css" href="css/matrix.css" />
  <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
  <script src="calendar.js" type="text/javascript" language="javascript"></script>
  
 </head>
 <body onLoad="showCalendar('now')">
  {include file="menubar.tpl"}
  <div id="main">
   <table width="100%">
   <form name="data" action="requests.php" method="post">
   <tr>
    <td width="248px" valign="top" class="left">
    <td valign="top">
   <h1 align="center"> Carnaby enquiries and on-line changes </h1>
   <hr>
   <h2> Select date and report type</h2>
   <table class="form">
    <tr>
     <td>From:</td>
     <td><script type="text/javascript" language="JavaScript">doRCCalendar('{$data->from}')</script></td>
    <tr>
     <td>To:</td>
     <td><script type="text/javascript" language="JavaScript">doRCCalendar('{$data->to}')</script></td>
    <tr>
     <td>Prospectus requests:</td>
     <td><input type="radio" name="type" value="inv_req" {if $data->type eq "inv_req"} checked {/if} > Investors</td>
    </tr>
    <tr>
     <td></td>
     <td><input type="radio" name="type" value="enq_req" {if $data->type eq "enq_req"} checked {/if} > Enquirers</td>
    </tr>
    <tr>
     <td></td>
     <td><input type="radio" name="type" value="med_req" {if $data->type eq "med_req"} checked {/if} > Media</td>
    </tr>
    <tr>
     <td>Details changes:</td>
     <td><input type="radio" name="type" value="inv_ch" {if $data->type eq "inv_ch"} checked {/if} > Investors</td>
    </tr>
    <tr>
     <td></td>
     <td><input name="enter" value="Generate" type="submit"></td>
    </tr>
   </table>

   <hr>

   <h2> List <input name="enter" type="submit" value="File"> </h2>
   <table class="report" border-width="1" border="1" cellspacing="0" cellpadding="1">
   <tr bgcolor="#e6eef1">
     {section name=heads loop=$data->header}
      <th>{$data->header[heads]}</th>
     {/section}
    </tr>
	
    {section name=rows loop=$data->table}
    <tr bgcolor="{cycle values="#c9dae2,#e6eef1"}">
       {section name=cols loop=$data->table[rows]}
        <td>{$data->table[rows][cols]}</td>
       {/section}
    </tr>
    {/section}
   </table>
   </form>
  </table>
  </div>
 </body>
</html>
