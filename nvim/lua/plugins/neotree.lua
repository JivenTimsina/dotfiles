-- this config enable lazyvim to open hidden files when nv . into the folder
return {
	"nvim-neo-tree/neo-tree.nvim",
	opts = {
		filesystem = {
			filtered_items = {
				hide_dotfiles = false,
			},
		},
	},
}
