var request = YAHOO.util.Connect;
var requestInProgress = false;
var connectionObject;
var lastsearchstring = '';

var minCharCount = 2;
var livesearchInterval = null;
var checkinterval = 0.5;

function startLiveSearch() 
{
	if (livesearchInterval == null)
		livesearchInterval = setInterval(checkLiveSearch, checkinterval*1000);
}

function checkKeycode(e) {
	var keycode;
	if (window.event) keycode = window.event.keyCode;
	else if (e) keycode = e.which;
	return keycode;
}

function stopLiveSearch() 
{
	clearInterval(livesearchInterval);
	livesearchInterval = null;
	setTimeout(closeLiveSearchBox, 500);
}

function checkLiveSearch()
{
	//document.getElementById("div").innerHTML += "Checking Live Search<br>";
	SendAndReceiveData();
}

function closeLiveSearchBox()
{
	document.getElementById('liveSearch').style.display='none';
}


var handleSuccess = function(o){
	var str = trim(document.getElementById("searchbox").value);
	if(o.responseText !== undefined){
//		document.getElementById("results").innerHTML = o.responseText; 
		document.getElementById("liveSearch").innerHTML = o.responseText; 
		document.getElementById("liveSearch").style.display = "block";
	}
	requestInProgress = false;
}

var handleFailure = function(o){
	if(o.responseText !== undefined){
	//document.getElementById("div").innerHTML += o.responseText;
	}
	requestInProgress = false;
}

var callback =
{
  success:handleSuccess,
  failure:handleFailure
};


function SendAndReceiveData()
{
	var postData; 
	var str = trim(document.getElementById("searchbox").value);
	postData = 'searchbox=' + str + '&remotepathlevel=' + pathlevel;
	if (str != lastsearchstring && str.length >= minCharCount)
	{
		if (requestInProgress)
		{
			YAHOO.util.Connect.abort(connectionObject);
			//document.getElementById("div").innerHTML += "Cancelling previous request<br>";
		}
		//document.getElementById("div").innerHTML += "Beginning search for: " + str + "<br>";
		//connectionObject = request.asyncRequest('POST', pathlevel + 'admin/modules/search/livesearchresults.cfm', callback, postData); 
		connectionObject = request.asyncRequest('POST', pathlevel + '?fuseaction=livesearch', callback, postData); 
		requestInProgress = true;
		lastsearchstring = str;
	}
	else if (str.length < minCharCount)
	{
		document.getElementById("liveSearch").style.display = "none";
	}
	else
	{
		//document.getElementById("div").innerHTML += "Ignoring keypress<br>";
	}
}

/*********************************************************************
 *
 * SECTION 10 - Miscellaneous Utility Functions
 *
 * trim()
 *
 ********************************************************************/


// from http://blog.stevenlevithan.com/archives/faster-trim-javascript
function trim (str) {
	var	str = str.replace(/^\s\s*/, ''),
		ws = /\s/,
		i = str.length;
	while (ws.test(str.charAt(--i)));
	return str.slice(0, i + 1);
}



