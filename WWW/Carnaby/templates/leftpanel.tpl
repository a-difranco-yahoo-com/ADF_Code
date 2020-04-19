   <td width="248px" valign="top" class="left">
    <form name="list">
    <table>
    <tr>
     <td align="left">
      <h2>Contacts</h2>
    <tr>
     <td>
      <select name="contact" size="15" class="left" onchange="change(this.value)">
       {html_options options=$data->names selected=$data->curContact}
      </select>
    <tr>
     <td>
      <textarea id="errorboard" class="error" rows=6 readonly wrap>{$data->errormsg}</textarea>
    </table>
    </form>
