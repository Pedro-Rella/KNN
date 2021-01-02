KNN_DIR:=../..
include $(KNN_DIR)/core.mk

IS_TAB:=gen_is_tab.tex cpu_nat_s_is_tab.tex 

REG_TAB:=sw_reg_tab.tex

BD_TAB:=bd_tab.tex

SRC:=ug.tex $(wildcard ./*.tex) $(wildcard ../*.tex)  $(IS_TAB) $(REG_TAB) $(BD_TAB)

include $(KNN_DIR)/document/document.mk

gen_is_tab.tex: $(INTERCON_DIR)/hardware/include/gen_if.v
	$(TEX_SW_DIR)/io2tex.py $< $@

cpu_nat_s_is_tab.tex: $(INTERCON_DIR)/hardware/include/cpu_nat_s_if.v
	$(TEX_SW_DIR)/io2tex.py $< $@

sw_reg_tab.tex: $(KNN_HW_DIR)/include/KNNsw_reg.v
	$(TEX_SW_DIR)/swreg2tex.py $<

bd_tab.tex: $(KNN_HW_DIR)/src/iob_knn.v
	$(TEX_SW_DIR)/block2tex.py $@ $(KNN_HW_DIR)/src/iob_knn.v

clean: texclean
	@rm -f $(IS_TAB) $(REG_TAB) $(BD_TAB)

.PHONY: clean
