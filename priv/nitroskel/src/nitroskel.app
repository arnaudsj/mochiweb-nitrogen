{application, nitroskel,
 [{description, "nitroskel"},
  {vsn, "0.01"},
  {modules, [
    nitroskel,
    nitroskel_app,
    nitroskel_sup,
    nitroskel_web,
    nitroskel_deps
  ]},
  {registered, []},
  {mod, {nitroskel_app, []}},
  {env, []},
  {applications, [kernel, stdlib, crypto]}]}.
