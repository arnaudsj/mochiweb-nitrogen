%% @author author <author@example.com>
%% @copyright YYYY author.

%% @doc TEMPLATE.

-module(nitroskel).
-author('author <author@example.com>').
-export([start/0, stop/0]).

ensure_started(App) ->
    case application:start(App) of
        ok ->
            ok;
        {error, {already_started, App}} ->
            ok
    end.
        
%% @spec start() -> ok
%% @doc Start the skel server.
start() ->
    nitroskel_deps:ensure(),
    ensure_started(crypto),
    application:start(nitroskel).

%% @spec stop() -> ok
%% @doc Stop the skel server.
stop() ->
    Res = application:stop(nitroskel),
    application:stop(crypto),
    Res.
