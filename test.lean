import system.io

meta def demo : tactic unit := do
  tactic.trace "running",

  tactic.unsafe_run_io $ do {
    h ← io.mk_file_handle "test.dat" io.mode.read ff,
    io.fs.read h (6000 * 1024)
  },

  tactic.trace "done"

run_cmd demo

