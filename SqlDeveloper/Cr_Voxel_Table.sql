
CREATE TABLE GS_VOXEL (
Voxel_Id   Number,
Voxel_Str  Varchar2(2))
/
CREATE TABLE GS_VOXEL_XY (
Voxel_Id   Number,
Voxel_Str  Varchar2(2),
X          Number,
Y          Number
)
/
CREATE TABLE GS_VOXEL_Z (
Voxel_Id   Number,
Voxel_Str  Varchar2(2),
Spare      Number,
Z          Number
)
/
CREATE TABLE GS_VOXEL_RunType (
Voxel_Id   Number,
Run_Id     Number,
Voxel_Str  Varchar2(2),
Voxel_Type Number,
Run_Length Number
)
/
