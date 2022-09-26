local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

parser_config.html_eex = {
  install_info = {
    url = "https://github.com/rockerBOO/tree-sitter-html-eex",
    files = { "src/parser.c", "src/scanner.cc" },
  },
  maintainers = { "@rockerBOO" },
}
