with Ada.Text_IO;
with Email_info;
with Parser;

procedure Iana is
   use Ada.Text_IO;
   use Email_Info;
   use Parser;

   File_Name : constant String := "config.json";
   Info      : Email_Info_Record;

begin

   Info := Get_Email_Info (File_Name);

   Print_Email_Info (Info);

end Iana;
