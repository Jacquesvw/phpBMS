function addEvent(obj, evType, fn){
 if (obj.addEventListener){
    obj.addEventListener(evType, fn, true);
    return true;
 } else if (obj.attachEvent){
    var r = obj.attachEvent("on"+evType, fn);
    return r;
 } else {
    return false;
 }
}
function removeEvent(obj, evType, fn, useCapture){
  if (obj.removeEventListener){
    obj.removeEventListener(evType, fn, useCapture);
    return true;
  } else if (obj.detachEvent){
    var r = obj.detachEvent("on"+evType, fn);
    return r;
  } else {
    window.status=("Handler could not be removed");
  }
}

function getViewportHeight() {
	if (window.innerHeight!=window.undefined) {
		return window.innerHeight;
		//var i=document.body.clientHeight;
		//return i;
	}
	if (document.compatMode=='CSS1Compat') return document.documentElement.clientHeight;
	if (document.body) return document.body.clientHeight; 
	return window.undefined; 
}
function getViewportWidth() {
	if (window.innerWidth!=window.undefined) {
		return window.innerWidth;
		//var i=document.body.offsetWidth;
		//return i;
	}
	if (document.compatMode=='CSS1Compat') return document.documentElement.clientWidth; 
	if (document.body) return document.body.clientWidth; 
	return window.undefined; 
}

/* ----------------------------------------------------------------------------- */

function showModal(content,title,thewidth){
	if(title==null) title="&nbsp";
	var alreadyModal=getObjectFromID("modalTitle");
	if(alreadyModal) return false;

	showModal.mask=document.createElement("div");
	showModal.mask.id="modalMask";
	showModal.mask.innerHtml="&nbsp;";

	showModal.box=document.createElement("div");
	showModal.box.id="modalBox";
	if(thewidth!= null){
		showModal.box.style.width=thewidth+"px";
	}
	showModal.box.width="400px";
	
	var tempDiv=document.createElement("div");
	tempDiv.id="modalTitle";
	tempDiv.innerHTML=title;
	showModal.box.appendChild(tempDiv);

        var tempDiv=document.createElement("div");
        tempDiv.id="modalContent";
        tempDiv.innerHTML=content;
        showModal.box.appendChild(tempDiv);

	document.body.appendChild(showModal.box);
	document.body.appendChild(showModal.mask);
	centerModal();

	var brsVersion = parseInt(window.navigator.appVersion.charAt(0), 10);
	if (brsVersion <= 6 && window.navigator.userAgent.indexOf("MSIE") > -1) {
		hideSelectBoxes();
	}


	addEvent(window, "resize", centerModal);
	window.onscroll=centerModal;
}


function closeModal(){
	removeEvent(window,"resize",centerModal,true);
	window.onscroll=null;

	document.body.removeChild(showModal.mask);
	document.body.removeChild(showModal.box);
        var brsVersion = parseInt(window.navigator.appVersion.charAt(0), 10);
        if (brsVersion <= 6 && window.navigator.userAgent.indexOf("MSIE") > -1) {	
               displaySelectBoxes();
        }
	showModal.mask=null;
	showModal.box=null;
}

var gi=0;
function centerModal(){
	if(showModal.mask){

		var fullHeight = getViewportHeight();
		var fullWidth = getViewportWidth();
	
		var theBody = document.documentElement;
	
		var scTop = parseInt(theBody.scrollTop,10);
		var scLeft = parseInt(theBody.scrollLeft,10);
	
		showModal.mask.style.height = fullHeight + "px";
		showModal.mask.style.width = fullWidth + "px";
		showModal.mask.style.top = scTop + "px";
		showModal.mask.style.left = scLeft + "px";
		if(window.innerHeight!=window.undefined){
		if(showModal.mask.scrollWidth>fullWidth)
			showModal.mask.style.height=(fullHeight-20)+"px";	
		if(document.body.scrollHeight>fullHeight)
			showModal.mask.style.width=(fullWidth-20)+"px";
		}
		showModal.box.style.top = scTop +75+"px";
		showModal.box.style.left =  (scLeft + ((fullWidth - showModal.box.offsetWidth) / 2)) + "px";
	} ;
}

function hideSelectBoxes() {
	for(var i = 0; i < document.all.length; i++) {
		if(document.all[i].tagName)
			if(document.all[i].tagName == "SELECT") 
				document.all[i].style.visibility="hidden";
	}
}

function displaySelectBoxes() {
        for(var i = 0; i < document.all.length; i++) {
                if(document.all[i].tagName)
                        if(document.all[i].tagName == "SELECT")
                                document.all[i].style.visibility="visible";
        }
}

function modalAlert(text){
	text.replace("\n","<br />");
	text+="<DIV align=\"right\"><button class=\"Buttons\" onClick=\"closeModal()\">ok</button></DIV>";
	showModal(text,"Alert",250);
}
window.alert = function(txt) {modalAlert(txt);}