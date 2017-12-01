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

    #print("/MMI/logUserData.php?user=robbe&level="+str(level)+"&time="+str(time)+"&won="+str(won)+"&control=OpenbaarVervoer")
    err = http.request(HTTPClient.METHOD_GET,"/MMI/logUserData.php?user=robbe&level="+str(level)+"&time="+str(time)+"&won="+str(won)+"&control=OpenbaarVervoer",headers) # Request a page from the site (this one was chunked..)

    assert( err == OK ) # Make sure all is OK
    return

    while (http.get_status() == HTTPClient.STATUS_REQUESTING):
        # Keep polling until the request is going on
        http.poll()
        print("Requesting..")
        OS.delay_msec(500)


    assert( http.get_status() == HTTPClient.STATUS_BODY or http.get_status() == HTTPClient.STATUS_CONNECTED ) # Make sure request finished well.

    print("response? ",http.has_response()) # Site might not have a response.


    if (http.has_response()):
        # If there is a response..

        var headers = http.get_response_headers_as_dictionary() # Get response headers
        print("code: ",http.get_response_code()) # Show response code
        print("**headers:\\n",headers) # Show headers

        # Getting the HTTP Body

        if (http.is_response_chunked()):
            # Does it use chunks?
            print("Response is Chunked!")
        else:
            # Or just plain Content-Length
            var bl = http.get_response_body_length()
            print("Response Length: ",bl)

        # This method works for both anyway

        var rb = RawArray() # Array that will hold the data

        while(http.get_status()==HTTPClient.STATUS_BODY):
            # While there is body left to be read
            http.poll()
            var chunk = http.read_response_body_chunk() # Get a chunk
            if (chunk.size()==0):
                # Got nothing, wait for buffers to fill a bit
                OS.delay_usec(1000)
            else:
                rb = rb + chunk # Append to read buffer


        # Done!

        print("bytes got: ",rb.size())
        var text = rb.get_string_from_ascii()
        print("Text: ",text)
