:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/html_write)).

% URL handlers.
:- http_handler('/', handle_request, []).

% Request handlers.
handle_request(_Request) :-
    get_time(X),  % X = seconds elapsed since the epoch.
    reply_html_page(
        [title('Hello')],
        [h1('Hello'), p(X)]
    ).

server(Port) :-
    http_server(http_dispatch, [port(Port)]).

:- initialization(server(8000)).
