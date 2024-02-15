bigfont = require("/bigfont")

errorcc = {}
local paths = {}

function errorcc.setfix(path,url)
    paths[path] = url
end

function errorcc.display(errmsg, path)
    term.setCursorPos(1,1)
    term.setBackgroundColor(colors.blue)
    term.clear()
    term.setTextColor(colors.white)
    print(errmsg.."\n")
    bigfont.bigPrint("Error")
    print("Attempting to fix...\n\n")
    shell.run("delete", path)
    shell.run("wget", paths[path], path)
    print("Fixes applied. Press any key to continue...")
    os.pullEvent("key")
    term.setBackgroundColor(colors.black)
    term.clear()
    term.setCursorPos(1,1)
end

return errorcc
