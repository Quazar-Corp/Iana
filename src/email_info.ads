with Ada.Strings.Unbounded;
with GNATCOLL.JSON;

package Email_Info is
   use Ada.Strings.Unbounded;
   use GNATCOLL.JSON;
   
   type String_List is array(1..500) of Unbounded_String;

   type Email_Info_Record is record
      Sender      : Unbounded_String;
      Recipient   : Unbounded_String;
      Subject     : Unbounded_String;
   end record;

   type Message_Part_Header_Record is record
      Name  : Unbounded_String;
      Value : Unbounded_String;
   end record;
   
   type Header_List is array(1..10) of Message_Part_Header_Record;

   type Message_Part_Body_Record is record
      Attachment_Id  : Unbounded_String;
      Size           : Integer;
      Data           : Unbounded_String;
   end record;

   type Message_Part_Record is record 
      Part_Id      : Unbounded_String;
      Mime_Type    : Unbounded_String;
      Filename     : Unbounded_String;
      Headers      : Header_List; 
      Message_Body : Message_Part_Body_Record;
      Parts        : String_List;
   end record;

   type Message_Record is record
      Id            : Unbounded_String;
      Thread_Id     : Unbounded_String;
      Label_Ids     : String_List;
      Snippet       : Unbounded_String;
      History_Id    : Unbounded_String;
      Internal_Date : Unbounded_String;
      Payload       : Message_Part_Record;
      Size_Estimate : Integer;
      Raw           : Unbounded_String;
   end record;

   function Fill_Info (Json : JSON_Value)
      return Email_Info_Record;
   procedure Print_Email_Info (Info : Email_Info_Record);

end Email_Info;
