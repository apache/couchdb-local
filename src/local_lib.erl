%% @copyright 2014, Takeru Ohta <phjgt308@gmail.com>
%%
%% @doc Utility Functions
%% @private
-module(local_lib).

%%----------------------------------------------------------------------------------------------------------------------
%% Exported API
%%----------------------------------------------------------------------------------------------------------------------
-export([unlink_and_flush/1]).

%%----------------------------------------------------------------------------------------------------------------------
%% Exported API
%%----------------------------------------------------------------------------------------------------------------------
-spec unlink_and_flush(pid()) -> true.
unlink_and_flush(Pid) ->
    true = unlink(Pid),
    receive
        {'EXIT', Pid, _} -> true
    after 0 -> true
    end.
