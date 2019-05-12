

CREATE OR REPLACE PACKAGE ROUNDEL
AS
   PI   NUMBER := 4 * atan(1);
--
--
   Inner_Radius NUMBER;
   Outer_Radius NUMBER;
--
   Degree_Section1 NUMBER := 51.396;
   Degree_Section2 NUMBER := 43.687;
   Degree_Section3 NUMBER := 38.551;
   Degree_Bar      NUMBER := 17.899;
--
   Inner_Sector_Radian NUMBER;
   Outer_Sector_Radian NUMBER;
--
   Bar_Height      NUMBER;   
   Width_Section1  NUMBER;
   Width_Section2  NUMBER;
   Width_Section3  NUMBER;

   Area_Bar      NUMBER;  
   Area_Annulus  NUMBER;  
   
   Overlap_Block  NUMBER;
   Extra_Segment  NUMBER;
   Minus_Segment  NUMBER;
   Total_Overlap  NUMBER;
   Total_Area     NUMBER;
--
   Northing  NUMBER;
   Westing   NUMBER;
--
   PROCEDURE Calcutlate_Area(p_Height NUMBER);
END;
/


CREATE OR REPLACE PACKAGE BODY ROUNDEL
AS
   FUNCTION Degrees_To_Radians(p_Degrees NUMBER)
      RETURN NUMBER
   AS
   BEGIN
     RETURN p_degrees / (180/ACOS(-1));
   END;

   -- For the bar use known height/width NOTE : we have half the width
   -- For the annulus calculate differences of circle areas : pi r square
   PROCEDURE Calculate_Areas
   IS
   BEGIN
      Area_Bar     := 2 * Bar_Height * (Width_Section1 + Width_Section2 + Width_Section3);
      Area_Annulus := PI * ( power(Outer_Radius, 2) - power(Inner_Radius, 2) );
      dbms_output.put_line('Area of bar     : ' || Area_Bar);
      dbms_output.put_line('Area of annulus : ' || Area_Annulus);
      dbms_output.put_line('');
   END;

   PROCEDURE Calculate_Sector_Angles
   IS
   BEGIN
      Inner_Sector_Radian  := 2 * atan( (Bar_Height / 2) /  Width_Section1);
      Outer_Sector_Radian  := 2 * atan( (Bar_Height / 2) / (Width_Section1 + Width_Section2) );
      dbms_output.put_line('Inner Sector : ' || Inner_Sector_Radian);
      dbms_output.put_line('Outer Sector : ' || Outer_Sector_Radian);
      dbms_output.put_line('');
   END;

   PROCEDURE Calculate_Overlap
   IS
   BEGIN
      Overlap_Block := 2 * Bar_Height * Width_Section2; -- Double up for left + right
      Extra_Segment := (Outer_Sector_Radian - sin(Outer_Sector_Radian) ) * power(Outer_Radius, 2);
      Minus_Segment := (Inner_Sector_Radian - sin(Inner_Sector_Radian) ) * power(Inner_Radius, 2);
      Total_Overlap := Overlap_Block + Extra_Segment -  Minus_Segment;
      Total_Area    := Area_Bar + Area_Annulus - Total_Overlap;    
      dbms_output.put_line('Total Areas : ' || Total_Area);
      dbms_output.put_line('Total Overlap : ' || Total_Overlap);
      dbms_output.put_line('');
   END;

   PROCEDURE Calculate_Total_Area
   IS
   BEGIN
      Westing := floor(Total_Area);
      IF ( mod(Westing, 2) = 0 )
      THEN
         Northing := floor(Westing * 7.1186);
      ELSE
         Northing := floor(Westing * 7.117);
      END IF;
      dbms_output.put_line('Northing : N 51  ' || Northing / 1000);
      dbms_output.put_line('Westing  : W 000 ' || Westing / 1000);
      dbms_output.put_line('');
   END;

   -- JK known (half AF) BF / BH known to calc radiuses BJ/HJ 
   PROCEDURE Calculate_Radiuses
   IS
   BEGIN
      Inner_Radius := sqrt( power(Width_Section1, 2)                  + power(Bar_Height / 2, 2) );
      Outer_Radius := sqrt( power(Width_Section1 + Width_Section2, 2) + power(Bar_Height / 2, 2) );
      dbms_output.put_line('Inner Radius : ' || Inner_Radius);
      dbms_output.put_line('Outer Radius : ' || Outer_Radius);
      dbms_output.put_line('');
   END;

   PROCEDURE Guess_Height(p_Height NUMBER)
   IS
      Loc_EC   NUMBER;
      Loc_Degree_EC  NUMBER;
   BEGIN
      Bar_Height     := p_Height;
--
      Width_Section1 := Bar_Height * tan(  Degrees_To_Radians(Degree_Section1) );
      Width_Section2 := Bar_Height / tan(  Degrees_To_Radians(Degree_Section2) );
      Width_Section3 := Bar_Height * tan(  Degrees_To_Radians(Degree_Section3) );

      Loc_Degree_EC := 180 - Degree_Bar - Degree_Section2;
      Loc_EC := (Width_Section1 + Width_Section2) * sin(  Degrees_To_Radians(Degree_Bar) ) / sin(  Degrees_To_Radians(Loc_Degree_EC) );

      dbms_output.put_line('Height      : ' || Bar_Height);
      dbms_output.put_line('EC (13.448) : ' || Loc_EC);
      dbms_output.put_line('');
   END;


   PROCEDURE Calcutlate_Area(p_Height NUMBER)
   IS
   BEGIN
      dbms_output.put_line('***********   START ************');
      Guess_Height(p_Height);
      Calculate_Radiuses;
      Calculate_Areas;
      Calculate_Sector_Angles;
      Calculate_Overlap;
      Calculate_Total_Area;
   END;
 
END;
/

BEGIN
   dbms_output.enable(100000);
   ROUNDEL.Calcutlate_Area(16.7368);
   ROUNDEL.Calcutlate_Area(16.7369);
END;
/
