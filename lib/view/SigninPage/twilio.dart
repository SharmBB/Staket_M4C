import 'package:twilio_flutter/twilio_flutter.dart';

class TwilioServices{
  TwilioFlutter twilioFlutter = TwilioFlutter(
      accountSid: "<Your account SID>", // found on console
      authToken: "<Your auth token>",     // found on console
      twilioNumber: "<Your trial phone number>" // trial phone number is the one from 
     // which the messages will be sent. It will probably be a USA phone number.
  );
   void sendSMS()
   {
     twilioFlutter.sendSMS(toNumber: "<Your verified phone number>", messageBody: 
    "Hello from Twilio");
   }
}
