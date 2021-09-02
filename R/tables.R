
b_vs_other_pseudobulk_res_tbl %>% arrange(padj) %>% write_csv(str_glue("{tables_out}/dge_bcells_other.csv"))

write_lines(b_vs_other_pseudobulk_res[[1]], file = str_glue("{tables_out}/dge_bcells_other_col_headers.txt"))

cds_main_top_markers %>% filter(cluster_method == "partition") %>% write_csv(str_glue("{tables_out}/partition_top_markers.csv"))

sumo_regression %>% write_csv(str_glue("{tables_out}/sumo_gene_regression_res.csv"))

merged_pseudobulk_res_tbl %>% arrange(padj) %>% write_csv(str_glue("{tables_out}/merged_pseudobulk_res.csv"))

write_lines(merged_pseudobulk_res[[1]], file = str_glue("{tables_out}/merged_pseudobulk_col_headers.txt"))
