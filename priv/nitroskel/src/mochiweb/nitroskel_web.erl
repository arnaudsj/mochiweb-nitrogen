%% @author author <author@example.com>
%% @copyright YYYY author.

%% @doc Web server for skel.

-module(nitroskel_web).
-author('author <author@example.com>').

-export([start/1, stop/0, loop/2]).

%% External API
start(Options) ->
    {DocRoot, Options1} = get_option(docroot, Options),
	{Port, _} = get_option(port, Options1),
    Loop = fun (Req) ->
                   ?MODULE:loop(Req, DocRoot)
           end,
    mochiweb_http:start([{name, list_to_atom(atom_to_list(?MODULE) ++ "_" ++ integer_to_list(Port))}, {loop, Loop} | Options1]).

stop() ->
    mochiweb_http:stop(?MODULE).

loop(Req, DocRoot) ->
    "/" ++ Path = Req:get(path),
	Extension = filename:extension(Path), %% Cheap trick - need to benchmark to see impact
    case Req:get(method) of
        Method when Method =:= 'GET'; Method =:= 'HEAD' ->
            case Extension of
                [] ->
                    wf_mochiweb:loop(Req);
                _ ->
                    Req:serve_file(Path, DocRoot)
            end;
        'POST' ->
            case Extension of
                [] ->
                    wf_mochiweb:loop(Req);
                _ ->
                    Req:not_found()
            end;
        _ ->
            Req:respond({501, [], []})
    end.

%% Internal API

get_option(Option, Options) ->
    {proplists:get_value(Option, Options), proplists:delete(Option, Options)}.
