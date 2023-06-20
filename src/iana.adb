with Ada.Text_IO;
with Ada.Strings.Unbounded;
with Email_Info;
with Parser;
with Service;

procedure Iana is
   use Ada.Text_IO;
   use Ada.Strings.Unbounded;
   use Email_Info;
   use Parser;
   use Service;

   File_Name : constant String := "config.json";
   Jwt       : constant String := Get_Jwt ("encoded_jwt.txt");
   Info      : Email_Info_Record;
   Token     : Unbounded_String;

begin

   Info := Get_Email_Info (File_Name);

   Print_Email_Info (Info);

   Authorize (Jwt, Token);

   Put_Line ("Bearer " & To_String (Token));

end Iana;
