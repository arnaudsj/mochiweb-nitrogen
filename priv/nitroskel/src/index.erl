-module (index).
-include ("wf.inc").
-export ([main/0, event/1]).

main() ->
	Body = #template { file="default"},
	wf:render(Body).
	
event(_) -> ok.
