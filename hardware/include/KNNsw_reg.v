//START_TABLE sw_reg
`SWREG_W(NK       ,         8, 0) //number of neighbors
`SWREG_W(XX       ,    WDATA_W, 0) //x coordenate for point being studied
`SWREG_W(YY       ,    WDATA_W, 0) //y coordenate for point being studied
`SWREG_W(DATA_X   ,    WDATA_W, 0) //x coordenate for data point
`SWREG_W(DATA_Y   ,    WDATA_W, 0) //y coordenate for data point
`SWREG_W(DATA_LABEL,   8      , 0) //data label
`SWREG_W(CONTROL  ,    4      , 0) //KNN reset and control (LSB reset the others control)
`SWREG_R(XLABEL    ,   8      , 0) //label of the studied point
