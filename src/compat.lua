
-- compat.lua

local _, debug, jit

_, debug = pcall(require, "debug")
debug = _ and debug

_, jit = pcall(require, "jit")
jit = _ and jit

local compat = {
    debug = debug,

    lua52 = _VERSION == "Lua 5.2",
    lua52_len = not #setmetatable({},{__len = nop}), 
    luajit = jit and true or false,
    jit = (jit and jit.status()),
    proxies = newproxy
        and (function()
            local ok, result = pcall(newproxy)
            return ok and (type(result) == "userdata" )
        end)()
        and type(debug) == "table"
        and (function() 
            local prox, mt = newproxy(), {}
            local pcall_ok, db_setmt_ok = pcall(debug.setmetatable, prox, mt)
            return pcall_ok and db_setmt_ok and (getmetatable(prox) == mt)
        end)()
}

compat.lua51 = (_VERSION == "Lua 5.1") and not compat.luajit

return compat

--                   The Romantic WTF public license.
--                   --------------------------------
--                   a.k.a. version "<3" or simply v3
--
--
--            Dear user,
--
--            The LuLPeg library
--
--                                             \ 
--                                              '.,__
--                                           \  /
--                                            '/,__
--                                            /
--                                           /
--                                          /
--                       has been          / released
--                  ~ ~ ~ ~ ~ ~ ~ ~       ~ ~ ~ ~ ~ ~ ~ ~ 
--                under  the  Romantic   WTF Public License.
--               ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~`,´ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ 
--               I hereby grant you an irrevocable license to
--                ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~
--                  do what the gentle caress you want to
--                       ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~  
--                           with   this   lovely
--                              ~ ~ ~ ~ ~ ~ ~ ~ 
--                               / thing...
--                              /  ~ ~ ~ ~
--                             /    Love,
--                        #   /      '.'
--                        #######      ·
--                        #####
--                        ###
--                        #
--
--            -- Pierre-Yves
--
--
--            P.S.: Even though I poured my heart into this work, 
--                  I _cannot_ provide any warranty regarding 
--                  its fitness for _any_ purpose. You
--                  acknowledge that I will not be held liable
--                  for any damage its use could incur.