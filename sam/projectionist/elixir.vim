let g:projectionist_heuristics['mix.exs'] = {
            \ 'apps/*/mix.exs': { 'type': 'app' },
            \ 'lib/*.ex': {
            \   'type': 'lib',
            \   'alternate': 'test/{}_test.exs',
            \   'template': ['defmodule {camelcase|capitalize|dot} do', 'end'],
            \ },
            \ 'test/*_test.exs': {
            \   'type': 'test',
            \   'alternate': 'lib/{}.ex',
            \   'template': ['defmodule {camelcase|capitalize|dot}Test do', '  use ExUnit.Case', '', '  alias {camelcase|capitalize|dot}, as: Subject', '', '  doctest Subject', 'end'],
            \ },
            \ 'mix.exs': { 'type': 'mix' },
            \ 'config/*.exs': { 'type': 'config' },
            \ '*.ex': {
            \   'makery': {
            \     'lint': { 'compiler': 'credo' },
            \     'test': { 'compiler': 'exunit' },
            \     'build': { 'compiler': 'mix' }
            \   }
            \ },
            \ '*.exs': {
            \   'makery': {
            \     'lint': { 'compiler': 'credo' },
            \     'test': { 'compiler': 'exunit' },
            \     'build': { 'compiler': 'mix' }
            \   }
            \ }
            \ }

let g:projectionist_heuristics['rebar.config'] = {
            \ '*.erl': {
            \   'template': ['-module({basename}).', '', '-export([]).', ''],
            \ },
            \ 'src/*.app.src': { 'type': 'app' },
            \ 'src/*.erl': {
            \   'type': 'src',
            \   'alternate': 'test/{}_SUITE.erl',
            \ },
            \ 'test/*_SUITE.erl': {
            \   'type': 'test',
            \   'alternate': 'src/{}.erl',
            \ },
            \ 'rebar.config': { 'type': 'rebar' }
\ }
