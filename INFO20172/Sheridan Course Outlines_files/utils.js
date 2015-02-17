function replaceparam (url,param,value)
{
	var s = "";
	var i = url.indexOf(param+"=");
	if ( i == -1 )
	{
		return url;
	}
	else
	{
		var j = url.indexOf("&", i);		
		s = url.substring(0,i) + param + "=" + value;
		if ( j != -1 )
		{
			s += url.substring(j); 
		}
		
		return s;
	}	
}