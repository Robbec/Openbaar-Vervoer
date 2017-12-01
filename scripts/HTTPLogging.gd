extends Node2D
 
 
func add_record(time, level, won):
 
    var err=0
    var http = HTTPClient.new() # Create the Client
 
    var err = http.connect("http://robbe.000webhostapp.com",80) # Connect to host/port
    assert(err==OK) # Make sure connection was OK
 
    # Wait until resolved and connected
    while( http.get_status()==HTTPClient.STATUS_CONNECTING or http.get_status()==HTTPClient.STATUS_RESOLVING):
        http.poll()
        #print("Connecting..")
        OS.delay_msec(50)
 
    assert( http.get_status() == HTTPClient.STATUS_CONNECTED ) # Could not connect
 
    # Some headers
 
    var headers=[
        "User-Agent: Pirulo/1.0 (Godot)",
        "Accept: */*"
    ]

    var id = OS.get_name() + "-" + OS.get_unique_ID()
    #print("/MMI/logUserData.php?user=robbe&level="+str(level)+"&time="+str(time)+"&won="+str(won)+"&control=OpenbaarVervoer")
    err = http.request(HTTPClient.METHOD_GET,"/MMI/logUserData.php?user="+id+"&level="+str(level)+"&time="+str(time)+"&won="+str(won)+"&control=OpenbaarVervoer",headers) # Request a page from the site (this one was chunked..)
 
    assert( err == OK ) # Make sure all is OK
    print("logged for "+id)
    return
 
    while (http.get_status() == HTTPClient.STATUS_REQUESTING):
        # Keep polling until the request is going on
        http.poll()
        print("Requesting..")
        OS.delay_msec(500)
 
 
    assert( http.get_status() == HTTPClient.STATUS_BODY or http.get_status() == HTTPClient.STATUS_CONNECTED ) # Make sure request finished well.
 