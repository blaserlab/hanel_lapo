# umap colored by partition assignment------------------------------------
save_plot(bb_var_umap(cds_main, "partition_assignment_1",
            foreground_alpha = 0.6,
            overwrite_labels = T,man_text_df = tribble(
              ~text_x, ~text_y, ~label,
              0,-7.5,"B",
              4,-1,"Eryth",
              -6,6,"NK",
              2,10,"T",
              14,2.5,"Mono"

            )),
          filename = str_glue("{figs_out}/umap_partitions.pdf"),
          base_width = 3.0,
          base_height = 2.5
          )

# density umap faceted by specimen----------------------------------------
save_plot(bb_var_umap(cds_main, "density", facet_by = c("specimen")) +
  theme(panel.background = element_rect(color = "grey80")) +
  labs(color = "Cell\nDensity"),
  filename = str_glue("{figs_out}/umap_density_faceted.pdf"),
  base_height = 3.5,
  base_width = 4.5)

# gene umap plots for selected SUMO genes------------------------
save_plot(
bb_gene_umap(cds_main, c("SAE1", "UBA2", "UBE2I"),
             color_legend_title = "Expression",alpha = 0.4) +
  theme(panel.background = element_rect(color = "grey80")),
filename = str_glue("{figs_out}/umap_hanel_genes.pdf"),
base_width = 7.5,
base_height = 2.25
)

# gene dotplot for selected sumo genes faceted by specimen and partition_assignment 2----------------
save_plot(bb_gene_dotplot(cds = cds_main,
                markers = c("SAE1", "UBA2", "UBE2I"),
                group_cells_by = "multifactorial",
                max.size = 6,
                group_ordering = tribble(
    ~aesthetic,~variable, ~value, ~level,
    "facet","specimen", "1", 1,
    "facet","specimen", "2", 2,
    "facet","specimen", "3", 3,
    "facet","specimen", "4", 4,
    "axis", "partition_assignment_2", "B", 1,
    "axis", "partition_assignment_2", "other", 2

                ),
    nrow = 1,
    colorscale_name = "Expression",
    sizescale_name = "Fraction\nExpressing") +
  theme(panel.background = element_rect(color = "grey80")) +
  labs(x = NULL, y = NULL),
  filename = str_glue("{figs_out}/selected_gene_dotplot.pdf"),
  base_width = 3.5,
  base_height = 2.0)

save_plot(bb_gene_dotplot(cds = cds_main[,colData(cds_main)$partition_assignment_1 != "Eryth"],
                markers = c("SAE1", "UBA2", "UBE2I"),
                group_cells_by = "multifactorial",
                max.size = 6,
                group_ordering = tribble(
    ~aesthetic,~variable, ~value, ~level,
    "facet","specimen", "1", 1,
    "facet","specimen", "2", 2,
    "facet","specimen", "3", 3,
    "facet","specimen", "4", 4,
    "axis", "partition_assignment_1", "B", 1,
    "axis", "partition_assignment_1", "T", 2,
    "axis", "partition_assignment_1", "Mono", 3,
    "axis", "partition_assignment_1", "NK", 4

                ),
    nrow = 1,
    colorscale_name = "Expression",
    sizescale_name = "Fraction\nExpressing") +
  theme(panel.background = element_rect(color = "grey80")) +
  labs(x = NULL, y = NULL),
  filename = str_glue("{figs_out}/selected_gene_dotplot_1.pdf"),
  base_width = 7.5,
  base_height = 2.0)

save_plot(bb_gene_dotplot(cds = cds_main[,colData(cds_main)$partition_assignment_1 %notin% c("NK", "Eryth")],
                markers = c("SAE1", "UBA2", "UBE2I"),
                group_cells_by = "multifactorial",
                max.size = 6,
                group_ordering = tribble(
    ~aesthetic,~variable, ~value, ~level,
    "facet","specimen", "1", 1,
    "facet","specimen", "2", 2,
    "facet","specimen", "3", 3,
    "facet","specimen", "4", 4,
    "axis", "partition_assignment_1", "B", 1,
    "axis", "partition_assignment_1", "T", 2,
    "axis", "partition_assignment_1", "Mono", 3

                ),
    nrow = 1,
    colorscale_name = "Expression",
    sizescale_name = "Fraction\nExpressing") +
  theme(panel.background = element_rect(color = "grey80")) +
  labs(x = NULL, y = NULL),
  filename = str_glue("{figs_out}/selected_gene_dotplot_2.pdf"),
  base_width = 7.5,
  base_height = 2.0)

# gene dotplot for basic partition markers-----------------------------------
save_plot(
  bb_gene_dotplot(
    cds_main,
    group_cells_by = "partition_assignment_1",
    markers = c("CCND1", "CD3D", "CD68", "KLRC1", "HBA2"),
    colorscale_name = "Expression",
    sizescale_name = "Fraction\nExpressing",
    max.size = 6
  ) +
    labs(x = NULL, y = NULL),
  filename = str_glue("{figs_out}/marker_gene_dotplot.pdf"),
  base_width = 3.5,
  base_height = 2.5
)

# dotplots to show merging with ref B cells------------------------

save_plot(
  bb_var_umap(cds_merged_B, "density", facet_by = c("specimen_type")) +
    theme(panel.background = element_rect(color = "grey80")) +
    labs(color = "Cell\nDensity"),
  filename = str_glue("{figs_out}/merged_umap_density_faceted.pdf"),
  base_height = 2.5,
  base_width = 5.5
)

save_plot(
  bb_var_umap(cds_merged_B, "specimen_type", foreground_alpha = 0.2, palette = experimental_group_palette) ,
  filename = str_glue("{figs_out}/merged_umap_spec_type.pdf"),
  base_height = 2.0,
  base_width = 3.25
)

save_plot(
  bb_var_umap(cds_merged_B, "partition_assignment_merged", foreground_alpha = 0.2) ,
  filename = str_glue("{figs_out}/merged_umap_partition_assignment.pdf"),
  base_height = 2.0,
  base_width = 3.25
)
