local ls = require("luasnip")
-- some shorthands...
local snip = ls.snippet
local node = ls.snippet_node
local text = ls.text_node
local insert = ls.insert_node
local func = ls.function_node
local choice = ls.choice_node
local dynamicn = ls.dynamic_node

local date = function() return {os.date('%Y-%m-%d')} end

ls.add_snippets(nil, {
    all = {
        snip({
            trig = "date",
            namr = "Date",
            dscr = "Date in the form of YYYY-MM-DD",
        }, {
            func(date, {}),
        }),
    },
    nix = {
        snip({
            trig = "shell",
            namr = "nix-shell",
            dscr = "make a nix shell",
        }, {
            text({"{ pkgs ? import <nixpkgs> { } }:" }),
            text({"with pkgs;"}),
            text({"mkShell {"}),
            text({"    name = \""}), insert(1, "shell_name"), text({"\";"}),
            text({"    buildInputs = with pkgs; ["}),
            insert(2, "pkgs"),
            text({"    ];"});
            text({"}"});
        }),
    }
})
            --
            --     "---",
            -- "title: "}), insert(1, "note_title"), text({"", 
            -- "author: "}), insert(2, "author"), text({"", 
            -- "date: "}), func(date, {}), text({"",
            -- "categories: ["}), insert(3, ""), text({"]",
            -- "lastmod: "}), func(date, {}), text({"",
            -- "tags: ["}), insert(4), text({"]",
            -- "comments: true",
            -- "---", ""}),
            -- insert(0)
