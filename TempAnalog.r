ggplot() +
  geom_glowpath(data = globe_df, 
                aes(X, Y, group = "L1"),
                shadowcolor='grey90',
                colour = "white",
                alpha = .01,
                shadowalpha=0.05,
                shadowsize = 1.8) +
  geom_glowpath(data = globe_df, 
                aes(X, Y, group = "L1"),
                shadowcolor='grey90',
                colour = "white",
                alpha = .01,
                shadowalpha=0.02,
                shadowsize = 1) +
  geom_glowpath(data = globe_df, 
                aes(X, Y, group = "L1"),
                shadowcolor='grey80',
                colour = "white",
                alpha = .01,
                shadowalpha=0.01,
                shadowsize = .5) +
  geom_raster(data = temp_df, 
              aes(x, y, fill = temp)) +  # Updated to the correct column name
  geom_sf(data = grid_crp, 
          colour = "white", 
          linewidth = .2) +
  geom_sf(data = wrl_ortho, 
          fill = NA,
          colour = "grey15",
          linewidth = .2) +
  geom_mark_circle(data = filter(temp_df, temp == max(temp)),
                   aes(x, y,
                       description = str_glue('{scales::number(temp, accuracy = .1, decimal.mark = ".", style_positive = "plus", suffix = "ºC")}')), # Updated temp
                   expand = unit(1, "mm"), 
                   label.buffer = unit(3, "mm"),
                   label.margin = margin(1, 1, 1, 1, "mm"),
                   label.family = fmain,
                   label.fontsize = 18,
                   label.fontface = "bold",
                   label.fill = alpha("grey99", .7),
                   con.type = "straight",
                   con.size = 0.3,
                   con.cap = unit(1, "mm")
                   ) +
  scale_fill_gradient2(
    low = "#85b7ce",
    mid = "#ffffe0",
    high = "#93003a",
    midpoint = 0,
    breaks = seq(from = -1, to= 4, by = 1),
    na.value = "grey99"
  ) +
  guides(fill = guide_colourbar(barwidth = 15, 
                                barheight = .5, 
                                title.position = "top",
                                title.hjust = .5)) +
  coord_sf() +
  labs(
    title = 'Temperature anomaly for July 2024',  # Corrected title for July 2024
    fill = "Temperature anomaly in °C\nvs. average for 1950-1980",
    caption = "Data: NASA · Map: Taiwo Kayode",
  ) +
  theme(legend.position = "bottom",
        legend.title = element_text(
          family = fmono, size = 14, colour = "grey15"
        ),
        legend.text = element_text(
          family = fmono, size = 12, colour = "grey15"
        ),
        plot.caption = element_text(
          colour = "grey50", size = 12, hjust = 0.5
        ),
        plot.title = element_text(
          size = 24, face = "bold", hjust = 0.5
        ))

# Explicitly print the plot to view it
print(last_plot())
