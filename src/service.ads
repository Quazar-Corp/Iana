with Ada.Strings.Unbounded;
with Email_Info;

package Service is
   use Ada.Strings.Unbounded;
   use Email_Info;

   procedure Authorize (Jwt : String; Token : out Unbounded_String);
   procedure Insert_Message (Info : Email_Info_Record; Token : String);

end Service;
