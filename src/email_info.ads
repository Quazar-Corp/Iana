with Ada.Strings.Unbounded;
with GNATCOLL.JSON;

package Email_Info is
   use Ada.Strings.Unbounded;
   use GNATCOLL.JSON;

   type Email_Info_Record is record
      Sender      : Unbounded_String;
      Recipient   : Unbounded_String;
      Subject     : Unbounded_String;
   end record;

   function Fill_Info (Json : JSON_Value)
      return Email_Info_Record;
   procedure Print_Email_Info (Info : Email_Info_Record);

end Email_Info;
