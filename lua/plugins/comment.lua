local nvim_comment = require("nvim_comment")

nvim_comment.setup
{
    marker_padding = true,
    comment_empty = false,
    comment_empty_trim_whitespace = false,
    create_mappings = true,
    line_mapping = ";",
    operator_mapping = ";",
    comment_chunk_text_object = "<leader>;",
    hook = nil
}
