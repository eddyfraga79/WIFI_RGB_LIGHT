/////////////////////////////////////////////////////////////////////
void SetupUSBcomm(void)
{
  Serial.begin(115200);
  Serial.println();
  delay(1000);  //Allow time for serial port to init. else miss messages
}
