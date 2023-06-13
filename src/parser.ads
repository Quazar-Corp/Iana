with Email_Info;

package Parser is
   procedure Parse_To_String (Filename : String);
   function Get_Email_Info (Filename : String)
      return Email_Info.Email_Info_Record;
   function Get_Jwt (Filename : String)
      return String;
end Parser;
