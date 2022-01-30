/////////////////////////////////////////////////////////////////////
void SetupEspWifi(void)
{
  WiFi.hostname(device_name.data);
  delay(500);
  WiFi.mode(WIFI_STA);
  WiFi.begin(ssid.data, pw.data);

  Serial.print("Connecting to " + String(ssid.data));
  while (WiFi.status() != WL_CONNECTED)
  {
    Serial.print(".");
    YellowWarningFlashingLED();
  }
  Serial.println();
  Serial.print("Connected! IP address: ");
  Serial.println(WiFi.localIP());

  // Set up mDNS responder:
  // - first argument is the domain name, in this example
  //   the fully-qualified domain name is "esp8266.local"
  // - second argument is the IP address to advertise
  //   we send our IP address on the WiFi network
  if (!MDNS.begin(device_name.data))
  {
    Serial.println("Error setting up MDNS responder!");
    while (1) {
      delay(1000);
    }
  }
  Serial.println("mDNS responder started");
  
  server.begin();

  // Add service to MDNS-SD
  MDNS.addService("http", "tcp", 80);

  timeClient.begin();
}

/////////////////////////////////////////////////////////////////////
void GetDateAndTime(String* s)
{
  timeClient.update();
  *s+= "<p>" + String(daysOfTheWeek[timeClient.getDay()]) + " - " + String(timeClient.getHours()) + ":" + String(timeClient.getMinutes()) + ":" + String(timeClient.getSeconds()) + "</p>";
}

/////////////////////////////////////////////////////////////////////
void ShowDeviceIP(String* s)
{
  IPAddress ip = WiFi.localIP();
  String ipStr = String(ip[0]) + '.' + String(ip[1]) + '.' + String(ip[2]) + '.' + String(ip[3]);
  *s += "<p> IP address = " + ipStr + "</p>";
}

/////////////////////////////////////////////////////////////////////
void UpdateHtmlButton(String* s)
{

  *s+= "<table class=\"center\"><tr><th>Status</th><th>Control</th></tr>";

  //START : PROCESS THE LED BUTTONS
  for(int i=0 ; i<NB_OF_LEDS ; i++ )
  {
    *s+= "<tr><td style=\"color:" + String(outputName[i]) + "\">" + String(outputName[i]) + " - " + outputState[i] + " State</td>";
    
    if (outputState[i]=="off") // If the output state is off, it displays the ON button
    {
      *s+= "<td><a href=\"/" + String(outputName[i]) + "/on\"><button class=\"button\">ON</button></a></td>";
    }
    if (outputState[i]=="on") // If the output state is on, it displays the OFF button
    {
      *s+= "<td><a href=\"/" + String(outputName[i]) + "/off\"><button class=\"button\">OFF</button></a></td>";
    }
    *s+= "</tr>";
  }

  //START : PROCESS THE BREATHING PATTERN
  *s += "<tr><td> Light Pattern - " + LightBreathingFlag + " State</td>";
  if (LightBreathingFlag == LED_SOLID_STATE) // If the output state is SOLID, it displays the BREATH button
  {
    *s+= "<td><a href=\"/BREATH\"><button class=\"button\">BREATH</button></a></td>";
  }
  if (LightBreathingFlag == LED_BREATH_STATE) // If the output state is BREATH, it displays the ALT button
  {
    *s+= "<td><a href=\"/ALT\"><button class=\"button\">ALT</button></a></td>";
  }
  if (LightBreathingFlag == LED_ALTERNATE_STATE) // If the output state is ALT, it displays the SOLID button
  {
    *s+= "<td><a href=\"/SOLID\"><button class=\"button\">SOLID</button></a></td>";
  }

  //END THE TABLE  
  *s+= "</table>";
}

/////////////////////////////////////////////////////////////////////
void ProcessHtmlButton(String* s)
{
  //START : PROCESS THE INPUT BUTTONs FOR LED CONTROL
  for(int led_select=0 ; led_select<NB_OF_LEDS ; led_select++)
  { 
    if(header.indexOf("GET /" + String(outputName[led_select]) + "/on") >= 0) 
    {
      outputState[led_select] = "on";
    } 
    if(header.indexOf("GET /" + String(outputName[led_select]) + "/off") >= 0) 
    {
      outputState[led_select] = "off";
    }
  }

  //START : PROCESS THE INPUT BUTTON LED PATTERN (SOLID/BREATH)
  if(header.indexOf("GET /SOLID") >= 0)
  {
    LightBreathingFlag = LED_SOLID_STATE;
  } 
  if(header.indexOf("GET /BREATH") >= 0)
  {
    LightBreathingFlag = LED_BREATH_STATE;
  }
  if(header.indexOf("GET /ALT") >= 0)
  {
    LightBreathingFlag = LED_ALTERNATE_STATE;
    
    digitalWrite(outputPin[BLUE_LED_POSITION], LOW);
    outputState[BLUE_LED_POSITION] = "off";
    digitalWrite(outputPin[RED_LED_POSITION], LOW);
    outputState[RED_LED_POSITION] = "off";
    digitalWrite(outputPin[GREEN_LED_POSITION], LOW);
    outputState[GREEN_LED_POSITION] = "off";
  } 
}

/////////////////////////////////////////////////////////////////////
void HtmlHeaderInfo(String* s)
{
  // Display the HTML web page
  *s += "<!DOCTYPE html><html>";
  *s += "<head><meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">";
  *s += "<link rel=\"icon\" href=\"data:,\">";
}

/////////////////////////////////////////////////////////////////////
void HtmlStyleCSS(String* s)
{
  // CSS to style the on/off buttons 
  // Feel free to change the background-color and font-size attributes to fit your preferences
  *s += "<style>html { font-family: Helvetica; display: inline-block; margin: 0px auto; text-align: center;}";
  *s += "table, th, td {border:1px solid black; border-collapse: collapse;}";
  *s += "table.center {margin-left: auto; margin-right: auto;}";
  *s += "table { width: 75%;}";
  *s += "td {width: 50% ;}";
  *s += "th {font-size: 20px;}";
  *s += ".button { background-color: #195B6A; border: none; color: white; width: 50%; height: 50%;";
  *s += "text-decoration: none; font-size: 30px; margin: 2px; cursor: pointer;}";
  *s += ".button2 {background-color: #77878A;}</style></head>";
}

/////////////////////////////////////////////////////////////////////
void WebServer(void)
{
  MDNS.update();
  
  WiFiClient client = server.available();   // Listen for incoming clients

  if(client)                                // If a new client connects,
  {                             
    Serial.println("New Client.");          // print a message out in the serial port
    String currentLine = "";                // make a String to hold incoming data from the client
    currentTime = millis();
    previousTime = currentTime;
    while(client.connected() && currentTime - previousTime <= timeoutTime)   // loop while the client's connected
    {
      currentTime = millis();         
      if(client.available())                // if there's bytes to read from the client,
      {
        char c = client.read();             // read a byte, then
        //Serial.write(c);                  // print out the html info on the serial monitor
        header += c;
        String s;
        if(c == '\n')                       // if the byte is a newline character 
        {
          // if the current line is blank, you got two newline characters in a row.
          // that's the end of the client HTTP request, so send a response:
          if(currentLine.length() == 0)
          {
            // HTTP headers always start with a response code (e.g. HTTP/1.1 200 OK)
            // and a content-type so the client knows what's coming, then a blank line:
            s = "HTTP/1.1 200 OK\r\nContent-Type:text/html\r\nConnection: close\r\n\r\n";
            ProcessHtmlButton(&s);
            HtmlHeaderInfo(&s);
            HtmlStyleCSS(&s);
            s += "<body><h1>RGB Lighting Web Server</h1>";  // Web Page Heading
            UpdateHtmlButton(&s);
            GetDateAndTime(&s); //Display date/time info
            ShowDeviceIP(&s);
            s += "</body></html>\r\n\r\n";
            client.print(s);
            break;                            // Break out of the while loop
          }
          else                                // if you got a newline, then clear currentLine
          {
            currentLine = "";
          }
        }
        else if (c != '\r')      // if you got anything else but a carriage return character, 
        {
          currentLine += c;      // add it to the end of the currentLine
        }
      }
    }
    // Clear the header variable
    header = "";
    // Close the connection
    client.stop();
    Serial.println("Client disconnected.");
    Serial.println("");
  }  
}
