<%
const SUBDIR="notes" 'THIS IS SUBFOLDER NAME
dim upath,fs
set fs=Server.CreateObject("Scripting.FileSystemObject")
set upath=fs.GetFolder(Server.MapPath("."))
upath = upath & "\"
If fs.FolderExists(upath&SUBDIR) = false Then
	fs.CreateFolder(upath&SUBDIR)
	Response.Write("Just created the folder:</br>")
	Response.Write(upath&SUBDIR)
End If

dim timestring, nowtime
timestring=FormatDateTime(Now(),0)
timestring=Replace(timestring, ":", "-")
timestring=Replace(timestring, "/", "-")
timestring=Replace(timestring, " ", "_")
%>
<!DOCTYPE html>
<html>
<meta content="width=device-width, initial-scale=1.25, maximum-scale=2, user-scalable=0" name="viewport">
<body>

<table class="tblform">
<tr>
<form action="Default.asp" method="post">
<caption>SendNote</caption>
<td id="t"> Title: </td>
<tr>
<td id="i"> <input type="text" name="fname" 
value="<%Response.Write(timestring)%>"/> </td>
</tr>
</tr>
<tr>
<td id="t">Text: </td>
</tr>
<tr>
<td> <textarea style="" name="content" rows="5"/></textarea> </td>
</tr>
<td id="i"> <input type="submit" value="SUBMIT" /> </tr>
</form>
</table>
<a href="">RESET</a>

</br>
<h3>Warning: 
Chinese may not work on many occations.</h3>

<p>
Status: </br>
<%
dim fname
fname=Request.Form("fname") 
content=Request.Form("content")
If (fname<>"" And content<>"") Then
	fname=fname&".txt"
    Response.Write("File Name: " & fname & "<br>")
	' Write to file
	dim file,path
	set fs = createobject("scripting.filesystemobject")
	path = Server.MapPath(SUBDIR) & "\"
	Response.Write("Created:"&path&fname& "</br>")
	set file = fs.createtextfile(path&fname)
	Response.Write("Written Content:</br>" & content)
	file.Write(content)
Else
	Response.Write("No Files Yet Created </br>")

End If
%>
</p>

<p>
Or view a file: </br>
<%
dim fo,x,link,isfile
set fo=Server.CreateObject("Scripting.FileSystemObject").GetFolder(Server.MapPath(SUBDIR))
' Fuck the ASP VBS, how dare it sets system32
' directory as default for "." ? fuck my ass.
' I even have to use this mapPath shit just for "."
isfile=0
for each x in fo.files 
	link=x.Name
	link=SUBDIR & "\" & link
	Response.Write("<a href="&link&">"&x.Name& "</a> </br>")
	isfile=1
next

If isfile=0 Then
	Response.Write("(Empty) </br>")
End If

set fo=nothing
set x=nothing
set fs=nothing
set file=nothing
set link=nothing

%>
</p>

<style>
table.tblform {
	border: 1px solid black;
	padding: 10px;
}
#t {text-align: left}
#i {text-align: center}
</style>

</body>
</html>