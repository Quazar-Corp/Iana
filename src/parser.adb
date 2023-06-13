with Ada.Text_IO;
with Ada.Strings.Unbounded;
with GNATCOLL.JSON;

package body Parser is
   use Ada.Text_IO;
   use Ada.Strings.Unbounded;
   use GNATCOLL.JSON;
   use Email_Info;

   Line      : Unbounded_String;
   Content   : Unbounded_String;
   Json      : JSON_Value;
   File      : File_Type;
   Info      : Email_Info_Record;

   procedure Parse_To_String (Filename : String) is
   begin
      Open (File, In_File, Filename);
      while not End_Of_File (File) loop
         Line := To_Unbounded_String (Get_Line (File));
         Append (Content, Line);
      end loop;
      Close (File);
   end Parse_To_String;

   function Get_Email_Info (Filename : String) return Email_Info_Record is
   begin

      Parse_To_String (Filename);

      Json := Read (Content, Filename);

      Info := (Fill_Info (Json));

      return Info;
   end Get_Email_Info;

   function Get_Jwt (Filename : String) return String is
      Content : Unbounded_String;
      File    : File_Type;
      Line    : String (1 .. 4096);
   begin
      Open (File, In_File, Filename);
      
      while not End_Of_File (File) loop
         Line := Get_Line (File);
         Append (Content, To_Unbounded_String (Line));
      end loop;
      
      Close (File);
      
      return To_String (Content);
   exception
      when Name_Error =>
         raise Name_Error with "Failed to open file: " & Filename;
      when others =>
         raise;
   end Get_Jwt;
end Parser;
