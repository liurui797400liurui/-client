
//表格换行变色
var  highlightcolor='#c1ebff';
//此处clickcolor只能用win系统颜色代码才能成功,如果用#xxxxxx的代码就不行,还没搞清楚为什么:(
var  clickcolor='#51b2f6';
function  changeto(){
source=event.srcElement;
if  (source.tagName=="TR"||source.tagName=="TABLE")
return;
while(source.tagName!="TD")
source=source.parentElement;
source=source.parentElement;
cs  =  source.children;
//alert(cs.length);
if  (cs[1].style.backgroundColor!=highlightcolor&&source.id!="nc"&&cs[1].style.backgroundColor!=clickcolor)
for(i=0;i<cs.length;i++){
	cs[i].style.backgroundColor=highlightcolor;
}
}

function  changeback(){
if  (event.fromElement.contains(event.toElement)||source.contains(event.toElement)||source.id=="nc")
return
if  (event.toElement!=source&&cs[1].style.backgroundColor!=clickcolor)
//source.style.backgroundColor=originalcolor
for(i=0;i<cs.length;i++){
	cs[i].style.backgroundColor="";
}
}

function  clickto(){
source=event.srcElement;
if  (source.tagName=="TR"||source.tagName=="TABLE")
return;
while(source.tagName!="TD")
source=source.parentElement;
source=source.parentElement;
cs  =  source.children;
//alert(cs.length);
if  (cs[1].style.backgroundColor!=clickcolor&&source.id!="nc")
for(i=0;i<cs.length;i++){
	cs[i].style.backgroundColor=clickcolor;
}
else
for(i=0;i<cs.length;i++){
	cs[i].style.backgroundColor="";
}
}


/*************************************************************************
 *表格列移动
 *需加css：
<style type="text/css">
	.resizeDivClass{
		text-align:right;
		width:1px;
		margin:0px 0 0px 0;
		border:0px;
		float:right;
		cursor:e-resize;
	} 
</style>
 */
 function MouseDownToResize(obj){ 
setTableLayoutToFixed(); 
obj.mouseDownX=event.clientX; 
obj.pareneTdW=obj.parentElement.offsetWidth; 
obj.pareneTableW=theObjTable.offsetWidth; 
obj.setCapture(); 
} 
function MouseMoveToResize(obj){ 
if(!obj.mouseDownX) return false; 
var newWidth=obj.pareneTdW*1+event.clientX*1-obj.mouseDownX; 
if(newWidth>0) 
{ 
obj.parentElement.style.width = newWidth; 
theObjTable.style.width=obj.pareneTableW*1+event.clientX*1-obj.mouseDownX; 
} 
} 
function MouseUpToResize(obj){ 
obj.releaseCapture(); 
obj.mouseDownX=0; 
} 
function setTableLayoutToFixed() 
{ 
 if(theObjTable.style.tableLayout=='fixed') return; 
var headerTr=theObjTable.rows[0]; 
for(var i=0;i<headerTr.cells.length;i++) 
{ 
headerTr.cells[i].styleOffsetWidth=headerTr.cells[i].offsetWidth; 
} 
 
for(var i=0;i<headerTr.cells.length;i++) 
{ 
headerTr.cells[i].style.width=headerTr.cells[i].styleOffsetWidth; 
} 
theObjTable.style.tableLayout='fixed'; 
} 