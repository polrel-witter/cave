|%
::  $scratch: a mark on a wall
::
+$  scratch  [when=@da glyph=char]
::  $stone: scratch point
::
+$  stone  @ud
::  $shape: a bundle of scratches
::
+$  shape  (list [=stone =scratch])
::
+$  action  $%([%clear ~] [%carve =shape])
--
