local status, targ = pcall(require, "targets")
if not status then return end

targ.setup({})
