hl.bind(
    mainMod .. " + W",
    hl.dsp.workspace.toggle_special("work")
)

hl.workspace_rule({
    workspace = "special:work",
    on_created_empty = "~/.config/hypr/scripts/work.sh",
})
