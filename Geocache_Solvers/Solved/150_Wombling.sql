

CREATE OR REPLACE PACKAGE WOMBLING
AS
   PI   NUMBER := 4 * atan(1);
--
   Width_Train  NUMBER := 84.258;
--
   Height_To_Section1 NUMBER := 22.469;
   Height_To_Section2 NUMBER := 53.364;
   Height_To_Section3 NUMBER := 59.963;
--
   Degree_Section2 NUMBER := 6.1;
--
   Roof_Surface_Area NUMBER := 85713.1;
--
   Width_Section2_L    NUMBER;
   Roof_Radius_R       NUMBER;
   Radian_Roof_Segment NUMBER;
   Length_Roof_Segment NUMBER;
   Length_Train        NUMBER;
   Area_End_Train      NUMBER;  
   Volumne_Train       NUMBER;    
--
   Northing_Degrees NUMBER;
   Northing_Minutes NUMBER;
   Westing_Minutes  NUMBER;
--
   PROCEDURE Calcutlate_Coords;
END;
/


CREATE OR REPLACE PACKAGE BODY WOMBLING
AS
   FUNCTION Degrees_To_Radians(p_Degrees NUMBER)
      RETURN NUMBER
   AS
   BEGIN
     RETURN p_degrees / (180/ACOS(-1));
   END;

   -- Right Angled Triangle : Angle = Degree_Section2 : Opposite = Drop in Width (Needed) : Adjacent = Height Section 2
   -- tan Angle = Opposite / Adjacent => Opposite = Adjacent * tan Angle 
   PROCEDURE Calculate_Width_Section2
   IS
     Drop_Width_Section2  NUMBER;
   BEGIN
      Drop_Width_Section2 := (Height_To_Section2 - Height_To_Section1) * tan(  Degrees_To_Radians(Degree_Section2) );
      Width_Section2_L    := (Width_Train / 2) - Drop_Width_Section2;

      dbms_output.put_line('Width Section 2 (L) : ' || Width_Section2_L);
      dbms_output.put_line('');
   END;

   -- Know s + l : r = (s2 + l2) / 2s
   PROCEDURE Calculate_Roof_Radius
   IS
      Loc_S NUMBER := Height_To_Section3 - Height_To_Section2;
   BEGIN
      Roof_Radius_R := ( power(Loc_S, 2) + power(Width_Section2_L, 2) ) / (2 * Loc_S);
      dbms_output.put_line('Roof Radius r  : ' || Roof_Radius_R);
      dbms_output.put_line('');
   END;

   -- cos( angle / 2) = (radius - s) / radius
   PROCEDURE Calculate_Roof_Angle
   IS
      Loc_S NUMBER := Height_To_Section3 - Height_To_Section2;
   BEGIN
      Radian_Roof_Segment := 2 * acos( (Roof_Radius_R - Loc_S) / Roof_Radius_R);
      dbms_output.put_line('Roof Angle (Radians)  : ' || Radian_Roof_Segment);
      dbms_output.put_line('');
   END;

   -- length = angle ( radians) * radius
   PROCEDURE Calculate_Roof_Length
   IS
      Loc_S NUMBER := Height_To_Section3 - Height_To_Section2;
   BEGIN
      Length_Roof_Segment := Radian_Roof_Segment * Roof_Radius_R;
      dbms_output.put_line('Length Roof Segment  : ' || Length_Roof_Segment);
      dbms_output.put_line('');
   END;

   -- Section 1 : Rectangle 
   -- Section 2 : Isosceles Trapezoid
   -- Section 3 : Segment
   PROCEDURE Calculate_Train_End_Area
   IS
      Loc_Area1  NUMBER;
      Loc_Area2  NUMBER;
      Loc_Area3  NUMBER;
   BEGIN
      Loc_Area1 := Width_Train * Height_To_Section1;
      Loc_Area2 := (Width_Train + (Width_Section2_L * 2))* (Height_To_Section2 - Height_To_Section1) / 2;
      Loc_Area3 :=  power(Roof_Radius_R, 2) * (Radian_Roof_Segment - sin(Radian_Roof_Segment) ) / 2;
      Area_End_Train := Loc_Area1 + Loc_Area2 + Loc_Area3;
      dbms_output.put_line('Area of Section 1 : ' || Loc_Area1);
      dbms_output.put_line('Area of Section 2 : ' || Loc_Area2);
      dbms_output.put_line('Area of Section 3 : ' || Loc_Area3);
      dbms_output.put_line('Total Area of train end : ' || Area_End_Train);
      dbms_output.put_line('');
   END;

   -- Known Surface Area + length roof : Get length of train
   -- Volume = Length of Train x Area of End of Train
   PROCEDURE Calculate_Volume
   IS
   BEGIN
      Length_Train  := Roof_Surface_Area / Length_Roof_Segment;
      Volumne_Train := Area_End_Train * Length_Train;
      dbms_output.put_line('Length of train : ' || Length_Train);
      dbms_output.put_line('Volume of train : ' || Volumne_Train);
      dbms_output.put_line('');
   END;

   
   PROCEDURE Get_Coords
   IS
   BEGIN
      Westing_Minutes  := floor(Area_End_Train);
      Northing_Minutes := floor(Volumne_Train);
      Northing_Degrees := floor(Northing_Minutes / (1000 * 100));
      Northing_Minutes := mod(Northing_Minutes, (1000 * 100) );

      dbms_output.put_line('Northing : N ' || Northing_Degrees || ' ' || Northing_Minutes / 1000);
      dbms_output.put_line('Westing  : W 000 ' || Westing_Minutes / 1000);
      dbms_output.put_line('');
   END;

   PROCEDURE Calcutlate_Coords
   IS
   BEGIN
      dbms_output.put_line('***********   START ************');
      Calculate_Width_Section2;
      Calculate_Roof_Radius;
      Calculate_Roof_Angle;
      Calculate_Roof_Length;
      Calculate_Train_End_Area;
      Calculate_Volume;
      Get_Coords;
   END;
 
END;
/

BEGIN
   dbms_output.enable(100000);
   WOMBLING.Calcutlate_Coords;
END;
/
