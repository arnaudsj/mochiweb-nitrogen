-module (index).
-include ("wf.inc").
-export ([main/0, event/1]).

main() ->
	Title = "Default Page",
	Body = #template { file=default, title=Title, headline=Title, section1=[
		"Hello, World!"
	]},
	wf:render(Body).
	
event(_) -> ok.
