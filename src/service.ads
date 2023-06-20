with Ada.Strings.Unbounded;

package Service is
   use Ada.Strings.Unbounded;

   procedure Authorize (Jwt : String; Token : out Unbounded_String);

end Service;
