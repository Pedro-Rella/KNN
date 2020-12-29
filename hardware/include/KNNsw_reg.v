//START_TABLE sw_reg
`SWREG_W(KNN_RESET,          1, 0) //KNN soft reset
`SWREG_W(KNN_ENABLE,         1, 0) //KNN enable
`SWREG_W(XX       ,    WDATA_W, 0) //x coordenate for point being studied
`SWREG_W(YY       ,    WDATA_W, 0) //y coordenate for point being studied
`SWREG_W(DATA_X   ,    WDATA_W, 0) //x coordenate for data point
`SWREG_W(DATA_Y   ,    WDATA_W, 0) //y coordenate for data point
`SWREG_W(DATA_LABEL,   8      , 0) //data label
`SWREG_W(NLABELS   ,   8      , 0) //number of labels
`SWREG_W(CLASSIFY  ,   1      , 0) //ready for classification?
`SWREG_W(D_READY   ,   1      , 0) //ready to compute distance 
`SWREG_R(XLABEL    ,   8      , 0) //label of the studied point
`SWREG_R(DISTANCE  , WDATA_W, 0) //distance from point being studied to data point
