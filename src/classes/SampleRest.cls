@RestResource(urlMapping='/maskingRest/*')
global class SampleRest {
	
	@HttpGet
	global static string showData()
	{
		return 'Hello Rest Service..............';
	}

}