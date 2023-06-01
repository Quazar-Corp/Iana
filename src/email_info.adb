with Ada.Text_IO;

package body Email_Info is
   use Ada.Text_IO;

   function Fill_Info (Json : JSON_Value) return Email_Info_Record is
      Info : Email_Info_Record;
   begin
      Info :=
         (Get (Json, "sender"),
          Get (Json, "recipient"),
          Get (Json, "subject"));
      return Info;
   end Fill_Info;

   procedure Print_Email_Info (Info : Email_Info_Record) is
   begin
      Put_Line ("Sender:" & To_String (Info.Sender));
      Put_Line ("Recipient:" & To_String (Info.Recipient));
      Put_Line ("Subject:" & To_String (Info.Subject));
   end Print_Email_Info;

end Email_Info;
