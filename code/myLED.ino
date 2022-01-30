/////////////////////////////////////////////////////////////////////
void InitLED(void)
{

  for(int i=0 ; i<NB_OF_LEDS ; i++)
  {
    pinMode(outputPin[i], OUTPUT);
    digitalWrite(outputPin[i], LOW);
  }
  outpuCountPWM[RED_LED_POSITION] = MAX_LED_PWM_SETTING;
  outpuCountPWM[GREEN_LED_POSITION] = MAX_LED_PWM_SETTING;
  outpuCountPWM[BLUE_LED_POSITION] = MAX_LED_PWM_SETTING;
}

/////////////////////////////////////////////////////////////////////
void inline timer_handler(void)
{
  static int alt_state = 0;
  
  if( LightBreathingFlag == LED_SOLID_STATE )
  {
    alt_state = 0;
    outpuCountPWM[RED_LED_POSITION] = MAX_LED_PWM_SETTING;
    outpuCountPWM[GREEN_LED_POSITION] = MAX_LED_PWM_SETTING;
    outpuCountPWM[BLUE_LED_POSITION] = MAX_LED_PWM_SETTING;
  }
  
  if( LightBreathingFlag == LED_BREATH_STATE )
  {
    alt_state = 0;
    if(count_direction == false)
    {
      outpuCountPWM[RED_LED_POSITION]++;
      outpuCountPWM[GREEN_LED_POSITION]++;
      outpuCountPWM[BLUE_LED_POSITION]++;
      if(outpuCountPWM[RED_LED_POSITION] > MAX_LED_PWM_SETTING)
      {
        count_direction = true;
      }
    }
    else
    {
      outpuCountPWM[RED_LED_POSITION]--;
      outpuCountPWM[GREEN_LED_POSITION]--;
      outpuCountPWM[BLUE_LED_POSITION]--;
      if(outpuCountPWM[RED_LED_POSITION] < 1)
      {
        count_direction = false;
      }
    }
  }

  if( LightBreathingFlag == LED_ALTERNATE_STATE )
  {
    switch(alt_state)
    {
      case 1:
        outpuCountPWM[RED_LED_POSITION]++;
        outpuCountPWM[GREEN_LED_POSITION] = MIN_LED_PWM_SETTING;
        outpuCountPWM[BLUE_LED_POSITION] = MIN_LED_PWM_SETTING;
        if(outpuCountPWM[RED_LED_POSITION] == MAX_LED_PWM_SETTING)
        {
          alt_state = 2;
        }
        break;
      case 2:
        outpuCountPWM[RED_LED_POSITION]--;
        outpuCountPWM[GREEN_LED_POSITION]++;
        outpuCountPWM[BLUE_LED_POSITION] = MIN_LED_PWM_SETTING;
        if(outpuCountPWM[GREEN_LED_POSITION] == MAX_LED_PWM_SETTING)
        {
          alt_state = 3;
        }
        break;
      case 3:
        outpuCountPWM[RED_LED_POSITION]++;
        outpuCountPWM[GREEN_LED_POSITION] = MAX_LED_PWM_SETTING;
        outpuCountPWM[BLUE_LED_POSITION] = MIN_LED_PWM_SETTING;
        if(outpuCountPWM[RED_LED_POSITION] == MAX_LED_PWM_SETTING)
        {
          alt_state = 4;
        }
        break;
      case 4:
        outpuCountPWM[RED_LED_POSITION]--;
        outpuCountPWM[GREEN_LED_POSITION]--;
        outpuCountPWM[BLUE_LED_POSITION]++;
        if(outpuCountPWM[BLUE_LED_POSITION] == MAX_LED_PWM_SETTING)
        {
          alt_state = 5;
        }
        break;
      case 5:
        outpuCountPWM[RED_LED_POSITION]++;
        outpuCountPWM[GREEN_LED_POSITION]=MIN_LED_PWM_SETTING;
        outpuCountPWM[BLUE_LED_POSITION]=MAX_LED_PWM_SETTING;
        if(outpuCountPWM[RED_LED_POSITION] == MAX_LED_PWM_SETTING)
        {
          alt_state = 6;
        }
        break;
      case 6:
        outpuCountPWM[RED_LED_POSITION]--;
        outpuCountPWM[GREEN_LED_POSITION]++;
        outpuCountPWM[BLUE_LED_POSITION]=MAX_LED_PWM_SETTING;
        if(outpuCountPWM[GREEN_LED_POSITION] == MAX_LED_PWM_SETTING)
        {
          alt_state = 7;
        }
        break;
      case 7:
        outpuCountPWM[RED_LED_POSITION]++;
        outpuCountPWM[GREEN_LED_POSITION]=MAX_LED_PWM_SETTING;
        outpuCountPWM[BLUE_LED_POSITION]=MAX_LED_PWM_SETTING;
        if(outpuCountPWM[RED_LED_POSITION] == MAX_LED_PWM_SETTING)
        {
          alt_state = 8;
        }
        break;
     case 8:
        outpuCountPWM[RED_LED_POSITION]--;
        outpuCountPWM[GREEN_LED_POSITION]--;
        outpuCountPWM[BLUE_LED_POSITION]--;
        if(outpuCountPWM[RED_LED_POSITION] == MIN_LED_PWM_SETTING)
        {
          alt_state = 1;
        }
        break;
     default:
        outpuCountPWM[RED_LED_POSITION]=MIN_LED_PWM_SETTING;
        outpuCountPWM[GREEN_LED_POSITION]=MIN_LED_PWM_SETTING;
        outpuCountPWM[BLUE_LED_POSITION]=MIN_LED_PWM_SETTING;
        alt_state = 1;
        break; 
    }
  }
  
  timer0_write(ESP.getCycleCount() + (int)LED_BREATHING_SPEED);
}

/////////////////////////////////////////////////////////////////////
void SetupLedTimer(void)
{
  noInterrupts();
  timer0_isr_init();
  timer0_attachInterrupt(timer_handler);
  timer0_write(ESP.getCycleCount() + (int)LED_BREATHING_SPEED);
  interrupts();
}

/////////////////////////////////////////////////////////////////////
void WelcomeFlashingLEDs(void)
{
  for(int i=0 ; i<NB_OF_LEDS ; i++)
  {
    digitalWrite(outputPin[i], HIGH);
    delay(500);
    digitalWrite(outputPin[i], LOW);
  }
}

/////////////////////////////////////////////////////////////////////
void RedErrorFlashingLED(void)
{
  digitalWrite(outputPin[RED_LED_POSITION], HIGH);
  delay(500);
  digitalWrite(outputPin[RED_LED_POSITION], LOW);
  delay(500);
}

/////////////////////////////////////////////////////////////////////
void YellowWarningFlashingLED(void)
{
  digitalWrite(outputPin[RED_LED_POSITION], HIGH);
  digitalWrite(outputPin[GREEN_LED_POSITION], HIGH);
  delay(500);
  digitalWrite(outputPin[RED_LED_POSITION], LOW);
  digitalWrite(outputPin[GREEN_LED_POSITION], LOW);
  delay(500);
}

/////////////////////////////////////////////////////////////////////
void ProcessLeds(void)
{
  if(LightBreathingFlag == LED_ALTERNATE_STATE)
  {
    analogWrite(outputPin[RED_LED_POSITION], outpuCountPWM[RED_LED_POSITION]);
    analogWrite(outputPin[GREEN_LED_POSITION], outpuCountPWM[GREEN_LED_POSITION]);
    analogWrite(outputPin[BLUE_LED_POSITION], outpuCountPWM[BLUE_LED_POSITION]);
  }
  else
  {
    for(int i=0 ; i<NB_OF_LEDS ; i++)
    {
      if (outputState[i]=="on")
      {
        analogWrite(outputPin[i], outpuCountPWM[i]);
      }
      else
      {
        digitalWrite(outputPin[i], LOW);
      }
    }
  }
}
