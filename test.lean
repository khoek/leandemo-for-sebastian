import system.io

meta def demo : tactic unit := do
  tactic.trace "running",

  tactic.unsafe_run_io $ do {
    h ← io.mk_file_handle "test2.dat" io.mode.read ff,
    c ← io.fs.read h (24000 * 1024),
    c ← io.fs.read h (24000 * 1024),
    io.print_ln c.size
  },

  tactic.trace "done"

example : true := begin
demo,

trivial
end

