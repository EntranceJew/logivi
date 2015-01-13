local Authors = {};

-- ------------------------------------------------
-- Local Variables
-- ------------------------------------------------

local list = {};

local aliases = love.filesystem.load('aliases.lua');
aliases = aliases and aliases() or {};

-- ------------------------------------------------
-- Public Functions
-- ------------------------------------------------

---
-- Draws a list of all authors working on the project.
--
function Authors.draw()
    local count = 0;
    for author, _ in pairs(list) do
        count = count + 1;
        love.graphics.print(author, 20, 100 + count * 20);
    end
end

---
-- Adds a new author to the list. If a file for alternatives
-- was found, the function will use relapcements from that list.
-- This can be used to fix "faulty" authors in commits.
-- @param nauthor
--
function Authors.add(nauthor)
    list[aliases[nauthor] or nauthor] = true;
end

return Authors;