with Util.Http.Clients;
with Util.Http.Clients.Curl;
with GNATCOLL.JSON;

package body Service is
   use Util.Http.Clients;
   use Util.Http.Clients.Curl;
   use GNATCOLL.JSON;

   Http_Client : Client;
   Http_Response : Response;

   procedure Authorize (Jwt : String; Token : out Unbounded_String) is
      Data : constant String :=
         "grant_type=urn%3Aietf%3Aparams%3Aoauth%3Agrant-type%3Ajwt-bearer&assertion="
         & Jwt;
      Json : JSON_Value;
   begin
      Register;

      Http_Client.Add_Header
         ("Content-Type", "application/x-www-form-urlencoded");

      Http_Client.Post ("https://oauth2.googleapis.com/token",
                        Data,
                        Http_Response);

      Json := Read (Http_Response.Get_Body);

      Token := Get (Json, "access_token");

   end Authorize;

end Service;
