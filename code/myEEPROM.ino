
/////////////////////////////////////////////////////////////////////
int GetEEpromData(eeprom_data* data, int data_size)
{
  int count = 0;
  char tmp = 0xFF;
  
  if( (data->address >= 512) || (data->address+(data_size-1) >= 512) )
  {
    return -1;
  }
  
  for(int i=0 ; i<data_size ; i++)
  {
    tmp = EEPROM.read(data->address+i);
    if(tmp == 0xFF)
    {
      return count;
    }
    else
    {
      data->data[i] = tmp;
      count++;
    }
  }
  return count;
}

/////////////////////////////////////////////////////////////////////
int SetEEpromData(eeprom_data* data, int data_size)
{
  int count = 0;
  
  if( (data->address >= 512) || (data->address+(data_size-1) >= 512) )
  {
    return -1;
  }

  for(int i=0 ; i<data_size ; i++)
  {
    if( (data->data[i] == 0xFF) || (data->data[i] == 0) )
    {
      EEPROM.commit();
      return count;
    }
    else
    {
      EEPROM.write(data->address+i, data->data[i]);
      count++;
    }
  }
  return count;
}


/////////////////////////////////////////////////////////////////////
bool CheckForUserDeviceMemoryReset(void)
{ 
  Serial.println("Press any key in the next 10 sec.to set the device back to default:");
  for(int i = 0 ; i< 10 ; i++)
  {
    Serial.print(".");
    delay(1000);
    
    if(Serial.available() > 0)
    {
      while(Serial.available() > 0)
      {
        Serial.read();  //Used to empty any serail data
      }
      return true;
    }
  }
  Serial.println();
  return false;
}


/////////////////////////////////////////////////////////////////////
void ResetEEpromMemory(void)
{ 
  Serial.println("Erasing EEPROM memory on device");

  for(int i=0 ; i<512 ; i++)
  {
      EEPROM.write(i, 0xFF);
  }
  EEPROM.commit();

  Serial.println("Memory is now set back to default");
}

/////////////////////////////////////////////////////////////////////
void GetUserInput(eeprom_data* data, int data_size)
{
  int i = 0;
  char tmp = 0;

  while(1)
  {
    if(Serial.available() > 0)
    {
      tmp = Serial.read();
      if(tmp == CARRIAGE_RETURN)
      {
        break;
      }
      else
      {
        data->data[i] = tmp;
        i++;
        if(i >= data_size)
        {
          break;
        }
      }
    }
  }  
}

/////////////////////////////////////////////////////////////////////
bool CheckDeviceEEpromConfigurations(void)
{
  EEPROM.begin(512);
  
  ssid.address = SSID_ADDR;
  pw.address = PW_ADDR;
  device_name.address = NAME_ADDR;

  ssid.id = SSID_ID;
  pw.id = PW_ID;
  device_name.id = NAME_ID;

  if(CheckForUserDeviceMemoryReset() == true)
  {
    ResetEEpromMemory();
  }
  
  if(GetEEpromData(&ssid, MAX_MEM_DATA_SIZE) == 0)
  {
    Serial.println();
    Serial.println(ssid.id + " setting is missing. Please enter SSID:");
    GetUserInput(&ssid, MAX_MEM_DATA_SIZE);
    SetEEpromData(&ssid, MAX_MEM_DATA_SIZE);
  }

  if(GetEEpromData(&pw, MAX_MEM_DATA_SIZE) == 0)
  {
    Serial.println();
    Serial.println(pw.id + " setting is missing. Please enter password:");
    GetUserInput(&pw, MAX_MEM_DATA_SIZE);
    SetEEpromData(&pw, MAX_MEM_DATA_SIZE);
  }

  if(GetEEpromData(&device_name, MAX_MEM_DATA_SIZE) == 0)
  {
    Serial.println();
    Serial.println(device_name.id + " setting is missing. Please enter password:");
    GetUserInput(&device_name, MAX_MEM_DATA_SIZE);
    SetEEpromData(&device_name, MAX_MEM_DATA_SIZE);
  }

  if(GetEEpromData(&ssid, MAX_MEM_DATA_SIZE) == 0)
  {
    Serial.println();
    Serial.println("ERROR: Missing " + ssid.id + " configuration. Can't continue.");
    return false;
  }
  else
  {
    Serial.println();
    Serial.println(ssid.id + " : " + ssid.data);
  }
  
  if(GetEEpromData(&pw, MAX_MEM_DATA_SIZE) == 0)
  {
    Serial.println();
    Serial.println("ERROR: Missing " + pw.id + " configuration. Can't continue.");
    return false;
  }
  else
  {
    Serial.println();
    Serial.println(pw.id + " : " + pw.data);
  }
  
  if(GetEEpromData(&device_name, MAX_MEM_DATA_SIZE) == 0)
  {
    Serial.println();
    Serial.println("ERROR: Missing " + device_name.id + " configuration. Can't continue.");
    return false;
  }
  else
  {
    Serial.println();
    Serial.println(device_name.id + " : " + device_name.data);
  }
  return true;
}
