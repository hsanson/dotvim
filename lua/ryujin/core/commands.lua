-------------------------------------------------------------------------------
-- Cool json formatting command.
-- Requires jq installed and works with non Ascii characters like Japanese.
vim.cmd([[command! -range=% JSONFormat <line1>,<line2>!jq .]])

-------------------------------------------------------------------------------
-- Cool json formatting command.
-- Requires jq installed and works with non Ascii characters like Japanese.
vim.cmd([[command! -range=% XMLFormat <line1>,<line2>!python3 -c "import xml.dom.minidom, sys; print(xml.dom.minidom.parse(sys.stdin).toprettyxml())"]])

