#
# TOP MAKEFILE 
#

#
# SIMULATE
#

KNN_DIR:=.
include core.mk

sim:
	make -C $(SIM_DIR) run SIMULATOR=$(SIMULATOR)

sim-waves:
	gtkwave $(SIM_DIR)/knn.vcd &

sim-clean:
	make -C $(SIM_DIR) clean

#
# IMPLEMENT FPGA
#

fpga:
ifeq ($(FPGA_SERVER), localhost)
	make -C $(FPGA_DIR) run DATA_W=$(DATA_W)
else 
	ssh $(FPGA_USER)@$(FPGA_SERVER) "if [ ! -d $(USER)/$(REMOTE_ROOT_DIR) ]; then mkdir -p $(USER)/$(REMOTE_ROOT_DIR); fi"
	rsync -avz --delete --exclude .git $(TIMER_DIR) $(FPGA_USER)@$(FPGA_SERVER):$(USER)/$(REMOTE_ROOT_DIR)
	ssh $(FPGA_USER)@$(FPGA_SERVER) 'cd $(USER)/$(REMOTE_ROOT_DIR); make -C $(FPGA_DIR) run FPGA_FAMILY=$(FPGA_FAMILY) FPGA_SERVER=localhost'
	mkdir -p $(FPGA_DIR)/$(FPGA_FAMILY)
	scp $(FPGA_USER)@$(FPGA_SERVER):$(REMOTE_ROOT_DIR)/$(FPGA_DIR)/$(FPGA_FAMILY)/$(FPGA_LOG) $(FPGA_DIR)/$(FPGA_FAMILY)
endif

fpga-clean:
ifeq ($(FPGA_SERVER), localhost)
	make -C $(FPGA_DIR) clean
else 
	rsync -avz --delete --exclude .git $(TIMER_DIR) $(FPGA_USER)@$(FPGA_SERVER):$(USER)/$(REMOTE_ROOT_DIR)
	ssh $(FPGA_USER)@$(FPGA_SERVER) 'cd $(USER)/$(REMOTE_ROOT_DIR); make clean SIM_SERVER=localhost FPGA_SERVER=localhost'
endif

#
# DOCUMENT
#

doc:
	for i in 1 2; do\
		make -C document/$(DOC_TYPE) $(DOC_TYPE).pdf;\
	done

doc-clean:
	make -C document/$(DOC_TYPE) clean

doc-pdfclean:
	make -C document/$(DOC_TYPE) pdfclean

clean: sim-clean fpga-clean doc-clean

.PHONY: sim sim-waves fpga fpga_clean doc doc-clean doc-pdfclean clean
