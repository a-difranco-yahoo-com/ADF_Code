   function show(objName) {
     if (objName == 'f0') {
       if (!is_saved()) 
         return;
       document.getElementById('finish2').style.display='';
       document.getElementById('finish1').style.display='none';
     } else {
       document.getElementById('finish1').style.display='';
       document.getElementById('finish2').style.display='none';
     }
     document.getElementById('f0').style.display='none';
     document.getElementById('f1').style.display='none';
     document.getElementById('f2').style.display='none';
     document.getElementById('f3').style.display='none';
     document.getElementById(objName).style.display='';
     document.data.curPage.value=objName;
   };
   function change(n) {
     if (!is_saved()) {
       document.list.contact.value=document.data.curContact.value;
       return false;
     }
     if (Contacts.length <= 1) return true;
     document.data.elements['id'].value=Contacts[n][0][1];
     for (var i=1; i<Contacts[0].length-1; i++)  
       if (document.data.elements[Contacts[n][i][0]].type == 'text')
         document.data.elements[Contacts[n][i][0]].value=Contacts[n][i][1];
       else if (document.data.elements[Contacts[n][i][0]].type == 'select-one')
         document.data.elements[Contacts[n][i][0]].value=Contacts[n][i][1];
       else {
         for ( var j=0; j<document.data.elements[Contacts[n][i][0]].length; j++)
           if (document.data.elements[Contacts[n][i][0]][j].value == Contacts[n][i][1])
             document.data.elements[Contacts[n][i][0]][j].checked = true;
           else
             document.data.elements[Contacts[n][i][0]][j].checked = false;
       }
     display = document.getElementById('f0').style.display;
     if (display != 'none') {
        display = 'none';
     }
     document.data.curContact.value=n;
     return true;
   }
   function check(obj,regexp,errmsg) {
     if (regexp == '' || Contacts.length <= 1)
       return true;
     var valid = new RegExp('^' + regexp + '$');
     if (valid.exec(obj.value)) 
       return true;
     alert(errmsg);
     /* changing input value to old one */
     n = document.data.curContact.value;
     for (var i=0; i<Contacts[n].length-1; i++) {
       if (Contacts[n][i][0] == obj.name) {
         obj.value=Contacts[n][i][1];
         break;
       }
     }
     obj.focus();
     return false;
   }
   function touch() {
    if (Contacts.length <= 1) return true;
    document.data.changed.value='yes';
    document.getElementById('saveButton').disabled='';
    return true;
   }
   function untouch() {
    document.data.changed.value='no';
    document.getElementById('saveButton').disabled=true;
    return true;
   }
   function is_saved() {
    if (document.data.changed.value == 'yes') {
     if (confirm("You haven't saved changes.\nAre you sure you want to continue?") ) {
      untouch();
      return true;
     } else {
      return false;
     }
    }
    return true;
   }
function trapEnter(evt) {
    var keycode;
 
    if (evt)
        ;
    else if (window.event)
        evt = window.event;
    else if (event)
        evt = event;
    else
        return true;
 
    if (evt.charCode)
        keycode = evt.charCode;
    else if (evt.keyCode)
        keycode = evt.keyCode;
    else if (evt.which)
        keycode = evt.which;
    else
        keycode = 0;
 
    if (keycode == 13) {
        if (document.data.curPage.value == 'f0') {
          document.getElementById('searchButton').click();
        } else {
          document.getElementById('saveButton').click();
        }
        return false;
    }
    else
        return true;
}
