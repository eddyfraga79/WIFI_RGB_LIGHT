#include <ESP8266WiFi.h>
#include <ESP8266mDNS.h>
#include <NTPClient.h>
#include <WiFiUdp.h>
#include <EEPROM.h>

/////////////////////////////////////////////////////////////////////
/*                            REFERENCE                            */
/////////////////////////////////////////////////////////////////////

//  https://randomnerdtutorials.com/how-to-install-esp8266-board-arduino-ide/
//  https://stackoverflow.com/questions/50080260/arduino-ide-cant-find-esp8266wifi-h-file
//  https://www.esp8266.com/viewtopic.php?t=4865

/////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////
//                               LED                               //
/////////////////////////////////////////////////////////////////////
#define STATUS_LED              2

#define NB_OF_LEDS              3
#define BLUE_LED_POSITION       0
#define RED_LED_POSITION        1
#define GREEN_LED_POSITION      2

#define BLUE_LED_PIN            D0
#define RED_LED_PIN             D1
#define GREEN_LED_PIN           D2

#define LED_SOLID_STATE         "SOLID"
#define LED_BREATH_STATE        "BREATH"
#define LED_ALTERNATE_STATE     "ALTERNATE"

#define MAX_LED_PWM_SETTING     254
#define MIN_LED_PWM_SETTING     0

String outputState[NB_OF_LEDS]  = {"off", "off", "off"};
String outputName[NB_OF_LEDS]   = {"BLUE", "RED", "GREEN"};
int outputPin[NB_OF_LEDS]       = {BLUE_LED_PIN, RED_LED_PIN, GREEN_LED_PIN};
int outpuCountPWM[NB_OF_LEDS]   = {0,0,0};

String LightBreathingFlag       = LED_ALTERNATE_STATE;
int alternate_led_select        = BLUE_LED_POSITION;

bool count_direction            = false;

/////////////////////////////////////////////////////////////////////
//                            USB COMM.                            //
/////////////////////////////////////////////////////////////////////
#define CARRIAGE_RETURN 0x0A

/////////////////////////////////////////////////////////////////////
//                          NETWORK TIME                           //
/////////////////////////////////////////////////////////////////////
#define utcOffsetInSeconds    -14400  //UTC-4 : Montreal Time

char daysOfTheWeek[7][12]     = {"Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"};

/////////////////////////////////////////////////////////////////////
//                         WIFI (ESP8266)                          //
/////////////////////////////////////////////////////////////////////
#define ESP8266_CLOCK_SPEED   80000000
#define TIMER_TRIGGER_SPEED   0.01
#define LED_BREATHING_SPEED   (ESP8266_CLOCK_SPEED*TIMER_TRIGGER_SPEED)

WiFiServer server(80);  // Set web server port number to 80

// Variable to store the HTTP request
String header;

unsigned long currentTime     = millis(); // Current time
unsigned long previousTime    = 0;        // Previous time
const long timeoutTime        = 2000;     // Define timeout time in milliseconds (example: 2000ms = 2s)

/////////////////////////////////////////////////////////////////////
//                            EEPROM                               //
/////////////////////////////////////////////////////////////////////
#define MAX_MEM_DATA_SIZE     32
#define SSID_ADDR             0
#define PW_ADDR               MAX_MEM_DATA_SIZE
#define NAME_ADDR             (PW_ADDR + MAX_MEM_DATA_SIZE)
#define SSID_ID               "SSID";
#define PW_ID                 "PASSWORD";
#define NAME_ID               "NAME";

struct eeprom_data
{ 
  int address = 0;
  char data[MAX_MEM_DATA_SIZE] = {0};
  String id;
}; 
typedef struct eeprom_data eeprom_data;

eeprom_data ssid;
eeprom_data pw;
eeprom_data device_name;

/////////////////////////////////////////////////////////////////////
//                  Define NTP Client to get time                  //
/////////////////////////////////////////////////////////////////////
WiFiUDP ntpUDP;
NTPClient timeClient(ntpUDP, "pool.ntp.org", utcOffsetInSeconds);

/////////////////////////////////////////////////////////////////////
//                          MAIN SETUP                             //
/////////////////////////////////////////////////////////////////////
void setup()
{
  InitLED();
  SetupUSBcomm();
  
  if(CheckDeviceEEpromConfigurations())
  {
    SetupEspWifi();
    SetupLedTimer();
    WelcomeFlashingLEDs();
  }
  else
  {
    while(1)
    {
      Serial.println("Please reboot device and enter missing configurations.");
      RedErrorFlashingLED();
    }
  }
}

/////////////////////////////////////////////////////////////////////
//                          MAIN LOOP                              //
/////////////////////////////////////////////////////////////////////
void loop()
{  
  WebServer();
  ProcessLeds();
}
