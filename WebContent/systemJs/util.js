/**
	 *全选或者不选页面所有指定名称的复选框
	 *return@checkId:单击事件复选框元素id
	 *return@name:复选元素名称
*/
function choose(checkId,name){
	var isChecked=document.getElementById(checkId).checked;
	var el = document.getElementsByTagName('input');
	var len = el.length;
	for(var i=0; i<len; i++){
		if((el[i].type=="checkbox") && (el[i].name==name)){
			el[i].checked = isChecked;
		}
	}
}

//String.prototype.Trim    =   function(){return   this.replace(/^\s+|\s+$/g,"");}   
//String.prototype.Ltrim   =   function(){return   this.replace(/^\s+/g, "");}   
//String.prototype.Rtrim   =   function(){return   this.replace(/\s+$/g,  "");}
  		
 function ss(){
//   ("aa").toString().constructor
// 	
// 	$('aa')._toggle(){}
$('aa').show();
 } 		
  		
/****************************************************************************************************** 
* 防范SQL注入漏洞，检测输入的字符 
* @param  strInput 待检测的字符 
*/ 
function checkInputChar(strInput){ 
	var forbidChar = new Array(",","~","=","/","\\","'","%","\"","@","#","$","^","&","*","(",")"); 
	var tag = "";
	for (var i = 0;i < forbidChar.length ; i++){ 
	  /*if(strInput.indexOf(forbidChar[i]) >= 0){ 
	      alert("您输入的信息: "+strInput+" 中含有非法字符,请更正！");
	      return false; 
	  } */
	  if(strInput.indexOf(forbidChar[i]) >= 0){
	  	  tag += tag=="" ? forbidChar[i] : ","+forbidChar[i];
	  }
	}
	if(tag != ""){
	      alert("您输入的信息: "+strInput+" 中 "+tag+" 为非法字符,请更正！");
	      return false;
	} 
	return true; 
} 

/** 
* 遍历form内元素text类型检测字符合法性，此方法结合 checkInputChar(strInput)使用 
* JSP页面只要调用该方法，并传入form名即可自动完成该form内所有元素字符的检测 
* @param  formName 待检测的form名 
*/ 
function validationFormText(formName){ 
	var actionForm; 
	if(typeof(formName)){ 
	    actionForm = formName; 
	}else{ 
	    actionForm = document.forms[0]; 
	} 
	
	for (var i=0;i<actionForm.length;i++ ){ 
	    if (actionForm.elements[i].value != "" && (actionForm.elements[i].type == "text" 
	    		|| actionForm.elements[i].type == "textarea")){ 
		    if(!checkInputChar(actionForm.elements[i].value)){ 
			    actionForm.elements[i].focus(); 
			    return false; 
		    } 
	    } 
	} 
	return true; 
} 

/********************************************************************
** 表格的控制
**/
    var  highlightcolor='#eafcd5';
	var  clickcolor='#FCF9D8';
	function  changeto(){
		source=event.srcElement;
		if(source.tagName=="TR"||source.tagName=="TABLE")
		return;
		while(source.tagName!="TD")
		source=source.parentElement;
		source=source.parentElement;
		cs  =  source.children;
		//alert(cs.length);
		if(cs[1].style.backgroundColor!=highlightcolor&&source.id!="nc" && cs[1].style.backgroundColor!=clickcolor){
			for(i=0;i<cs.length;i++){
				cs[i].style.backgroundColor=highlightcolor;
			}
		}
	}
	
	function  changeback(){
		if(event.fromElement.contains(event.toElement)||source.contains(event.toElement)||source.id=="nc"){
		   return;
		}
		if(event.toElement!=source&&cs[1].style.backgroundColor!=clickcolor){
		//source.style.backgroundColor=originalcolor
			for(i=0;i<cs.length;i++){
				cs[i].style.backgroundColor="";
			}
		}
	}

