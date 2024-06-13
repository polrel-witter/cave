::  %cave: swarm ascii art
::
::    make shapes and distribute to %pals.
::
::    there are a couple actions:
::    - %clear: delete all shapes in our wall
::    - %carve: commit a shape to our wall and distribute to %pals
::
::    it uses %gossip to distribute shapes and %mast as the frontend
::    framework.
::
/-  *cave
/+  verb, default-agent
/+  gossip, mast, cave-init
/=  view   /app/webui/view
/=  style  /app/webui/style
::
/$  grab-action  %noun  %action
::
|%
::
+$  versioned-state  $%(state-0)
::
+$  state-0
  $:  %0
      =display
      current-url=path
      size=_449
      wall=(map stone scratch)
  ==
::
+$  card  card:agent:gall
::  $display: /lib/mast frontend state
::
+$  display  $~([[%html ~] [[%head ~] ~] [[%body ~] ~] ~] manx)
::
--
::
%+  verb  |
=|  state-0
=*  state  -
::
%-  %+  agent:gossip
      [2 %anybody %anybody &]
    %+  ~(put by *(map mark $-(* vase)))
      %action
    |=(n=* !>((grab-action n)))
::
^-  agent:gall
=<
  |_  =bowl:gall
  +*  this    .
      def     ~(. (default-agent this %|) bowl)
      hc      ~(. +> bowl)
      routes  [/apps/cave view]~
  ::
  ++  on-init
    ^-  (quip card _this)
    =;  init-shape=_wall
      :_  this(wall init-shape)
      [%pass /bind %arvo %e %connect [~ /apps/cave] dap.bowl]~
    =;  [p=shape @ud]
      (malt p)
    %^  spin  shape:cave-init
      0
    |=  [=@t n=@ud]
    [[n [now.bowl t]] +(n)]
  ::
  ++  on-save  !>(state)
  ::
  ::
  ++  on-load
    |=  old=vase
    ^-  (quip card _this)
    `this(state !<(state-0 old))
  ::
  ++  on-poke
    |=  [=mark =vase]
    ^-  (quip card _this)
    ?>  =(our src):bowl
    ?+    mark  (on-poke:def mark vase)
        %action
      =+  !<(act=action vase)
      ?-    -.act
          %clear  `this(wall *(map stone scratch))
          %carve
        ?~  dry=(press:hc shape.act)
          `this
        :_  this(wall u.dry)
        :_  ~
        %-  invent:gossip
        action+!>(`action`[%carve shape.act])
      ==
    ::
        %handle-http-request
      =+  !<([eyre-id=@ta req=inbound-request:eyre] vase)
      ?.  authenticated.req
        [(make-auth-redirect:mast eyre-id) this]
      ?.  ?=(%'GET' method.request.req)
        [(make-400:mast eyre-id) this]
      =/  url=path
        (parse-url:mast url.request.req)
      ?:  =(/apps/cave/css url)
        [(make-css-response:mast eyre-id style) this]
      =/  new-display
        (rig:mast routes url [wall size])
      :_  this(display new-display, current-url url)
      (plank:mast "cave" /display-updates our.bowl eyre-id new-display)
    ::
        %json
      |^
      =+  !<(=json vase)
      =/  client-poke  (parse-json:mast json)
      =/  act=action
        ?+  tags.client-poke  ~|(bad-client-poke+vase !!)
          [%click %clear ~]  [%clear ~]
          [%click %carve ~]  [%carve (mold-shape data.client-poke)]
        ==
      ::  process the poke
      ::
      =/  update=(unit (quip card state=_this))
        (mole |.((on-poke action+!>(`action`act))))
      ::  update our display
      ::
      =/  new-display
        %^  rig:mast  routes
          current-url
        :_  size
        ?~(update wall wall.state.u.update)
      ::  write to cards and state
      ::
      :_  ?~  update
            this(display new-display)
          =.  this  state.u.update
          this(display new-display)
      :_  ?~(update ~ `(list card)`-.u.update)
      (gust:mast /display-updates display new-display)
      ::  +mold-shape: build $shape from data arriving from frontend
      ::
      ++  mold-shape
        |=  store=(map @t @t)
        ^-  shape
        %+  murn  ~(tap by store)
        |=  [key=@t value=@t]
        ?~  value  ~
        :-  ~
        :_  [now.bowl value]
        ::  extract the $stone
        ::
        ^-  @ud
        =-  -.-
        %+  scan  (trip key)
        ;~(pfix fas ;~(sfix (star dem) (jest '/value')))
      --
    ==
  ::
  ++  on-watch
    |=  =path
    ^-  (quip card _this)
    ?:  ?|  ?=([%http-response *] path)
            ?=([%display-updates *] path)
        ==
        `this
    ?.  =(/~/gossip/source path)
      (on-watch:def path)
    :_  this
    ::  only send the latest shape from our wall
    ::
    =/  elm=(list [dial=@dr =stone =scratch])
      (sort (add-relative:hc ~(tap by wall)) ror:hc)
    ?~  elm  ~
    =/  =shape
      %+  murn  elm
      |=  [dial=@dr =stone =scratch]
      ?.  =(dial dial.i.elm)  ~
      `[stone scratch]
    :_  ~
    %-  invent:gossip
    action+!>(`action`[%carve shape])
  ::
  ++  on-peek
    |=  =path
    ^-  (unit (unit cage))
    ?.  ?=([%x %wall ~] path)  [~ ~]
    ``noun+!>(wall)
  ::
  ++  on-agent
    |=  [=wire =sign:agent:gall]
    ^-  (quip card _this)
    ?.  ?&  =(/~/gossip/gossip wire)
            ?=(%fact -.sign)
            =(%action p.cage.sign)
        ==
      (on-agent:def wire sign)
    =+  !<(act=action q.cage.sign)
    ?>  ?=(%carve -.act)
    ?~  dry=(press:hc shape.act)
      `this
    =.  wall  u.dry
    =/  new-display
      (rig:mast routes current-url [wall size])
    :_  this(display new-display)
    ~[(gust:mast /display-updates display new-display)]
  ::
  ++  on-arvo
    |=  [=wire =sign-arvo]
    ^-  (quip card _this)
    ?.  ?&  ?=([%bind ~] wire)
            ?=([%eyre %bound *] sign-arvo)
        ==
      (on-arvo:def [wire sign-arvo])
    ~?  !accepted.sign-arvo
      %eyre-rejected-squad-binding
    `this
  ::
  ++  on-fail  on-fail:def
  ++  on-leave  on-leave:def
  --
|_  =bowl:gall
::  +ror: relative date ordering
::
++  ror
  |=  [[a=@dr *] [b=@dr *]]
  ?:((lth a b) %& %|)
::  +add-relative: prepend @dr to a list of shape elements
::
++  add-relative
  |=  a=shape
  =|  b=(list [@dr stone scratch])
  |-  ^+  b
  ?~  a  b
  =/  dial=@dr
    (sub now.bowl when.scratch.i.a)
  $(b [[dial stone.i.a scratch.i.a] b], a t.a)
::  +press: slot a new shape into our wall
::
++  press
  |=  =shape
  ^-  (unit _wall)
  ?:  =(~ shape)  ~
  =/  dry  wall
  |-
  ?~  shape  `dry
  ?:  (~(has by wall) stone.i.shape)  ~
  ?.  =(1 (lent (trip glyph.scratch.i.shape)))  ~
  $(dry (~(put by dry) i.shape), shape t.shape)
--
