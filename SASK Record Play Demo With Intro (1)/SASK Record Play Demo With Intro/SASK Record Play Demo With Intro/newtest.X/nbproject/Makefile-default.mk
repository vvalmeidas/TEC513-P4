#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/newtest.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/newtest.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=-mafrlcsj
else
COMPARISON_BUILD=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=../src/G711.s ../src/ADCChannelDrv.c ../src/AT25F4096Drv.c ../src/main.c ../src/OCPWMDrv.c ../src/sask.c ../src/SFMDrv.c ../src/SST25VF040BDrv.s

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/1360937237/G711.o ${OBJECTDIR}/_ext/1360937237/ADCChannelDrv.o ${OBJECTDIR}/_ext/1360937237/AT25F4096Drv.o ${OBJECTDIR}/_ext/1360937237/main.o ${OBJECTDIR}/_ext/1360937237/OCPWMDrv.o ${OBJECTDIR}/_ext/1360937237/sask.o ${OBJECTDIR}/_ext/1360937237/SFMDrv.o ${OBJECTDIR}/_ext/1360937237/SST25VF040BDrv.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/1360937237/G711.o.d ${OBJECTDIR}/_ext/1360937237/ADCChannelDrv.o.d ${OBJECTDIR}/_ext/1360937237/AT25F4096Drv.o.d ${OBJECTDIR}/_ext/1360937237/main.o.d ${OBJECTDIR}/_ext/1360937237/OCPWMDrv.o.d ${OBJECTDIR}/_ext/1360937237/sask.o.d ${OBJECTDIR}/_ext/1360937237/SFMDrv.o.d ${OBJECTDIR}/_ext/1360937237/SST25VF040BDrv.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/1360937237/G711.o ${OBJECTDIR}/_ext/1360937237/ADCChannelDrv.o ${OBJECTDIR}/_ext/1360937237/AT25F4096Drv.o ${OBJECTDIR}/_ext/1360937237/main.o ${OBJECTDIR}/_ext/1360937237/OCPWMDrv.o ${OBJECTDIR}/_ext/1360937237/sask.o ${OBJECTDIR}/_ext/1360937237/SFMDrv.o ${OBJECTDIR}/_ext/1360937237/SST25VF040BDrv.o

# Source Files
SOURCEFILES=../src/G711.s ../src/ADCChannelDrv.c ../src/AT25F4096Drv.c ../src/main.c ../src/OCPWMDrv.c ../src/sask.c ../src/SFMDrv.c ../src/SST25VF040BDrv.s



CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-default.mk ${DISTDIR}/newtest.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=33FJ256GP506
MP_LINKER_FILE_OPTION=,--script=p33FJ256GP506.gld
# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/1360937237/ADCChannelDrv.o: ../src/ADCChannelDrv.c  .generated_files/flags/default/8ec542f29539cac4d9f866d907b749ed7630c1d2 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/ADCChannelDrv.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/ADCChannelDrv.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../src/ADCChannelDrv.c  -o ${OBJECTDIR}/_ext/1360937237/ADCChannelDrv.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/ADCChannelDrv.o.d"      -g -D__DEBUG     -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"../h" -I"." -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1360937237/AT25F4096Drv.o: ../src/AT25F4096Drv.c  .generated_files/flags/default/9b68d0e92470e197572f66137037a2dc879d0e2 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/AT25F4096Drv.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/AT25F4096Drv.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../src/AT25F4096Drv.c  -o ${OBJECTDIR}/_ext/1360937237/AT25F4096Drv.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/AT25F4096Drv.o.d"      -g -D__DEBUG     -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"../h" -I"." -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1360937237/main.o: ../src/main.c  .generated_files/flags/default/64983baf1cc91a523f59ac7459d6791396f8d6ce .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../src/main.c  -o ${OBJECTDIR}/_ext/1360937237/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/main.o.d"      -g -D__DEBUG     -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"../h" -I"." -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1360937237/OCPWMDrv.o: ../src/OCPWMDrv.c  .generated_files/flags/default/af9d027206bc0870986830951733ad91f690a4bb .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/OCPWMDrv.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/OCPWMDrv.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../src/OCPWMDrv.c  -o ${OBJECTDIR}/_ext/1360937237/OCPWMDrv.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/OCPWMDrv.o.d"      -g -D__DEBUG     -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"../h" -I"." -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1360937237/sask.o: ../src/sask.c  .generated_files/flags/default/911f5b147b373aad11140b2410ee8df91fd70913 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/sask.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/sask.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../src/sask.c  -o ${OBJECTDIR}/_ext/1360937237/sask.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/sask.o.d"      -g -D__DEBUG     -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"../h" -I"." -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1360937237/SFMDrv.o: ../src/SFMDrv.c  .generated_files/flags/default/80965a36e4934f9da6e352fcb2cd6aba9bfbd510 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/SFMDrv.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/SFMDrv.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../src/SFMDrv.c  -o ${OBJECTDIR}/_ext/1360937237/SFMDrv.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/SFMDrv.o.d"      -g -D__DEBUG     -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"../h" -I"." -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
else
${OBJECTDIR}/_ext/1360937237/ADCChannelDrv.o: ../src/ADCChannelDrv.c  .generated_files/flags/default/25468e6b09c40e356a01cab350f7feb7f28fbed .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/ADCChannelDrv.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/ADCChannelDrv.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../src/ADCChannelDrv.c  -o ${OBJECTDIR}/_ext/1360937237/ADCChannelDrv.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/ADCChannelDrv.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"../h" -I"." -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1360937237/AT25F4096Drv.o: ../src/AT25F4096Drv.c  .generated_files/flags/default/47809b1e74432394a238882f764a741ab22f2379 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/AT25F4096Drv.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/AT25F4096Drv.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../src/AT25F4096Drv.c  -o ${OBJECTDIR}/_ext/1360937237/AT25F4096Drv.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/AT25F4096Drv.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"../h" -I"." -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1360937237/main.o: ../src/main.c  .generated_files/flags/default/d1db0ec0d7857668f99f80ac6448f99fe2574a13 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../src/main.c  -o ${OBJECTDIR}/_ext/1360937237/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/main.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"../h" -I"." -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1360937237/OCPWMDrv.o: ../src/OCPWMDrv.c  .generated_files/flags/default/25ec29a2c11bcb40bb101ad1899818efa1930ed7 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/OCPWMDrv.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/OCPWMDrv.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../src/OCPWMDrv.c  -o ${OBJECTDIR}/_ext/1360937237/OCPWMDrv.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/OCPWMDrv.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"../h" -I"." -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1360937237/sask.o: ../src/sask.c  .generated_files/flags/default/8765ee50e0f13e1ecbb4ed39710fd4a538e7a02c .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/sask.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/sask.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../src/sask.c  -o ${OBJECTDIR}/_ext/1360937237/sask.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/sask.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"../h" -I"." -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1360937237/SFMDrv.o: ../src/SFMDrv.c  .generated_files/flags/default/71ca4d3550bca3012611d81046261ae110be4cea .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/SFMDrv.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/SFMDrv.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../src/SFMDrv.c  -o ${OBJECTDIR}/_ext/1360937237/SFMDrv.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/SFMDrv.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"../h" -I"." -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/1360937237/G711.o: ../src/G711.s  .generated_files/flags/default/679c93bb234a684dd8c98945ed285280c7077e84 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/G711.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/G711.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  ../src/G711.s  -o ${OBJECTDIR}/_ext/1360937237/G711.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -D__DEBUG   -omf=elf -DXPRJ_default=$(CND_CONF)    -I".." -I"." -Wa,-MD,"${OBJECTDIR}/_ext/1360937237/G711.o.d",--defsym=__MPLAB_BUILD=1,--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,,-g,--no-relax,-g$(MP_EXTRA_AS_POST)  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1360937237/SST25VF040BDrv.o: ../src/SST25VF040BDrv.s  .generated_files/flags/default/48309e9e97794debaee4f5d445d28d56a6886443 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/SST25VF040BDrv.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/SST25VF040BDrv.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  ../src/SST25VF040BDrv.s  -o ${OBJECTDIR}/_ext/1360937237/SST25VF040BDrv.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -D__DEBUG   -omf=elf -DXPRJ_default=$(CND_CONF)    -I".." -I"." -Wa,-MD,"${OBJECTDIR}/_ext/1360937237/SST25VF040BDrv.o.d",--defsym=__MPLAB_BUILD=1,--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,,-g,--no-relax,-g$(MP_EXTRA_AS_POST)  -mdfp="${DFP_DIR}/xc16"
	
else
${OBJECTDIR}/_ext/1360937237/G711.o: ../src/G711.s  .generated_files/flags/default/271470dd9d454e01ccd2dc9e1eea4afbf5f5b3a1 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/G711.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/G711.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  ../src/G711.s  -o ${OBJECTDIR}/_ext/1360937237/G711.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -omf=elf -DXPRJ_default=$(CND_CONF)    -I".." -I"." -Wa,-MD,"${OBJECTDIR}/_ext/1360937237/G711.o.d",--defsym=__MPLAB_BUILD=1,-g,--no-relax,-g$(MP_EXTRA_AS_POST)  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1360937237/SST25VF040BDrv.o: ../src/SST25VF040BDrv.s  .generated_files/flags/default/a48ae96f52af833997861b669d34eab2894b813b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/SST25VF040BDrv.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/SST25VF040BDrv.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  ../src/SST25VF040BDrv.s  -o ${OBJECTDIR}/_ext/1360937237/SST25VF040BDrv.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -omf=elf -DXPRJ_default=$(CND_CONF)    -I".." -I"." -Wa,-MD,"${OBJECTDIR}/_ext/1360937237/SST25VF040BDrv.o.d",--defsym=__MPLAB_BUILD=1,-g,--no-relax,-g$(MP_EXTRA_AS_POST)  -mdfp="${DFP_DIR}/xc16"
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemblePreproc
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${DISTDIR}/newtest.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o ${DISTDIR}/newtest.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -D__DEBUG=__DEBUG   -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)   -mreserve=data@0x800:0x84F   -Wl,,,--defsym=__MPLAB_BUILD=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D__DEBUG=__DEBUG,,$(MP_LINKER_FILE_OPTION),--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--library-path="..",--library-path=".",--no-force-link,--smart-io,-Map="${DISTDIR}/newtest.X.${IMAGE_TYPE}.map",--report-mem,--memorysummary,${DISTDIR}/memoryfile.xml$(MP_EXTRA_LD_POST)  -mdfp="${DFP_DIR}/xc16" 
	
else
${DISTDIR}/newtest.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o ${DISTDIR}/newtest.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wl,,,--defsym=__MPLAB_BUILD=1,$(MP_LINKER_FILE_OPTION),--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--library-path="..",--library-path=".",--no-force-link,--smart-io,-Map="${DISTDIR}/newtest.X.${IMAGE_TYPE}.map",--report-mem,--memorysummary,${DISTDIR}/memoryfile.xml$(MP_EXTRA_LD_POST)  -mdfp="${DFP_DIR}/xc16" 
	${MP_CC_DIR}\\xc16-bin2hex ${DISTDIR}/newtest.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} -a  -omf=elf   -mdfp="${DFP_DIR}/xc16" 
	
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r ${OBJECTDIR}
	${RM} -r ${DISTDIR}

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(wildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
