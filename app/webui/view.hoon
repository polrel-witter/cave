/-  *cave
|=  [wall=(map stone scratch) size=@ud]
^-  manx
=-  ;html
      ;head
        ;meta(charset "utf-8");
        ;meta(name "viewport", content "width=device-width, initial-scale=1");
        ;link(href "/apps/cave/css", rel "stylesheet");
      ==
      ;body
        ;nav
          ;a(href "/apps/cave"): void
          ;button(event "/click/clear"): clear
          ;button(event "/click/carve", return +.content): carve
        ==
        ;div#wall
          ;*  -.content
        ==
      ==
    ==
:: convert $wall to visual representation; a series of inputs and static data
::
^=  content
=|  stone=@ud
=|  cement=marl
=|  paths=tape
|-  ^-  [marl tape]
?:  (gth stone size)  [cement (snip paths)]
=/  still=(unit scratch)
  (~(get by wall) stone)
%=    $
    paths
  ?^  still  paths
  :(weld paths "/" (scow %ud stone) "/value" " ")
::
    cement
  %+  weld  cement
  ^-  marl
  ;+  ;div.stone
        ;+  ?~  still
              ;input
                =type       "text"
                =maxlength  "1"
                =id         (scow %ud stone);
            ;div
              ;input(type "hidden", id (scow %ud stone));
              ;+  ;/  (trip glyph.u.still)
            ==
      ==
::
    stone
  +(stone)
==
