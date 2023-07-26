with Ada.Text_IO;
with Util.Http.Clients;
with Util.Http.Clients.Curl;
with GNATCOLL.JSON;

package body Service is
   use Ada.Text_IO;
   use Util.Http.Clients;
   use GNATCOLL.JSON;

   procedure Authorize (Jwt : String; Token : out Unbounded_String) is
      Data : constant String :=
         "grant_type=urn%3Aietf%3Aparams%3Aoauth%3Agrant-type%3Ajwt-bearer&assertion="
         & Jwt;
      Json : JSON_Value;
   begin
      Util.Http.Clients.Curl.Register;
      declare
         Http_Client   : Client;
         Http_Response : Response;
         Http_Status    : Integer;
      begin
         Http_Client.Add_Header
            ("Content-Type", "application/x-www-form-urlencoded");

         Http_Client.Post ("https://oauth2.googleapis.com/token",
                           Data,
                           Http_Response);

         Http_Status := Http_Response.Get_Status;

         if Http_Status /= 200 then
            Put_Line (Http_Response.Get_Body);
         else
            Json := Read (Http_Response.Get_Body);

            Token := Get (Json, "access_token");
         end if;
      end;

   end Authorize;
   
   procedure Insert_Message (Info : Email_Info_Record; Token : String) is
      Url : constant String :=
         "https://gmail.googleapis.com/upload/gmail/v1/users/" & (To_String (Info.Sender)) & "/messages";
      Json : JSON_Value;
   begin
      Util.Http.Clients.Curl.Register;
      declare
         Http_Client   : Client;
         Http_Response : Response;
         Http_Status   : Integer;
      begin
         Http_Client.Add_Header
            ("Authorization", "Bearer " & Token);

         Http_Client.Add_Header
            ("Content-Type", "multipart/form-data");

         Http_Client.Post (Url,
                           Form,
                           Http_Response);

         Http_Status := Http_Response.Get_Status;

         if Http_Status /= 200 then
            Put_Line (Http_Response.Get_Body);
         else
            Json := Read (Http_Response.Get_Body);

            Put_Line (Http_Response.Get_Body);
         end if;
      end;

   end Insert_Message;

end Service;
