<html>
 <head>
  <link rel="stylesheet" type="text/css" href="css/matrix.css" />
  <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
  <script>
   Contacts = [
   {foreach from=$data->contacts item=row}
     [
     {foreach from=$row item=field}
      ['{$field[0]|escape:"javascript"}','{$field[1]|escape:"javascript"}'],
     {/foreach}
      ['','']
     ],
   {/foreach}
     [
      []
     ]
   ];
  </script>
  <script language="Javascript" src="fun.js" ></script>
 </head>
 <body onLoad="change(document.list.contact.value); show('{$data->curPage}');" onkeypress="trapEnter(event);">
  {include file="menubar.tpl"}
  <div id="main">
   <table width="100%">
   <tr>
    {include file="leftpanel.tpl"}
   <td valign="top">
   <h1 align="center"> Carnaby Contacts </h1>
     <table width="100%" border="0" cellpadding="0" cellspacing="0">
     <tr>
      <td align="center">
       ::
       <a href="javascript:show('f0')"> Search </a> ::
       <a href="javascript:show('f1')"> Details </a> ::
       <a href="javascript:show('f2')"> Further details </a> ::
       <a href="javascript:show('f3')"> Even more further details </a> ::
     <tr>
      <td align="center" class="submenu">
     </table>
   <hr>
   <form name="search" action="contacts.php" method="post">
   <table id="f0" class="form" style="display: none">
   <tr>
    <td colspan=2 style="text-align: left">
     <h2> Search </h2>
    {foreach from=$data->search item=input}
    <tr>
     <td>
      {$input[0]}
     <td>
      <input type="text" name="{$input[1]}" value="{$input[3]|escape}" style="width: 200px">
    {/foreach}
   </table>
   <input type="hidden" name="query" value="search">
   </form>
   <form name="data" action="contacts.php" method="post">
   <table id="f1" class="form" style="display: none">
   <tr>
    <td colspan=2 style="text-align: left">
     <h2> Contact's details</h2>
    {foreach from=$data->form1 item=input}
    <tr>
     <td>
      {$input[0]}
     <td>
      {if $input[2] eq "radio"}
         {html_radios name=$input[1] options=$input[3] onchange="touch()"}
      {elseif $input[2] eq "select"}
        <select name="{$input[1]}" onchange="touch()">
         {html_options options=$input[3]}
        </select>
      {else}
         <input type="text" name="{$input[1]}" maxlength="{$input[2]}" onChange="check(this,'{$input[3][0]}','{$input[3][1]}') && touch()" style="width: 200px">
      {/if}
    {/foreach}
   </table>
   
   <table id="f2" class="form" style="display: none">
   <tr>
    <td colspan=2 style="text-align: left">
     <h2> Contact's further details</h2>
    {foreach from=$data->form2 item=input}
    <tr>
     <td>{$input[0]}<td>
      {if $input[2] eq "radio"}
         {html_radios name=$input[1] options=$input[3] onchange="touch()"}
      {elseif $input[2] eq "select"}
        <select name="{$input[1]}" onchange="touch()">
         {html_options options=$input[3]}
        </select>
      {else}
         <input type="text" name="{$input[1]}" maxlength="{$input[2]}" onChange="check(this,'{$input[3][0]}','{$input[3][1]}') && touch()" style="width: 200px">
      {/if}
    {/foreach}
   </table>

   <table id="f3" class="form" style="display: none">
   <tr>
    <td colspan=2 style="text-align: left">
     <h2> Contact's even more further details</h2>
    {foreach from=$data->form3 item=input}
    <tr>
     <td>{$input[0]}</td>
     <td>
      {if $input[2] eq "radio"}
         {html_radios name=$input[1] options=$input[3] onchange="touch()"}
      {elseif $input[2] eq "select"}
        <select name="{$input[1]}" onchange="touch()">
         {html_options options=$input[3]}
        </select>
      {else}
         <input type="text" name="{$input[1]}" maxlength="{$input[2]}" onChange="check(this,'{$input[3][0]}','{$input[3][1]}') && touch()" style="width: 200px">
      {/if}
    {/foreach}
     </td>
    <t/r>
   </table>
   
   <input type="hidden" name="changed"    value="no">
   <input type="hidden" name="query"      value="save">
   <input type="hidden" name="curPage"    value="f0">
   <input type="hidden" name="curContact" value="0">
   <input type="hidden" name="id"         value="{$data->contacts[0][0][1]}">
   </form>
   <hr>

   <div id="finish1" style="display: ">
   <input type="button" id="saveButton" value="Save" style="font-size: 16px; font-weight: bold" disabled onClick="document.data.submit()">
   </div>

   <div id="finish2" style="display: none">
   <input type="button" id="searchButton" value="Search" style="font-size: 16px; font-weight: bold" onClick="document.search.submit()">
   </div>
  </table>
  </div>
 </body>
</html>
