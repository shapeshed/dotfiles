-- Go template files. The treesitter queries in queries/gotmpl/ highlight the
-- template syntax and inject yaml into the surrounding text (helm/kustomize
-- style manifests).
vim.filetype.add({
  extension = {
    gotmpl = "gotmpl",
    tmpl = "gotmpl",
  },
})
