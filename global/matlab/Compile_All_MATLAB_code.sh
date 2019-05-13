#!/bin/bash

#
# # Compile_All_MATLAB_code.sh
#
# Compile all the MATLAB source code used in the HCP Pipelines code base
#
# ## Copyright Notice
#
# Copyright (C) 2019 The Connectome Coordination Facility (CCF)
#
# ## Author(s)
#
# * Timothy B. Brown, Neuroinformatics Research Group, Washington University in St. Louis
#
# ## Product
#
# [Human Connectome Project](https://www.humanconnectome.org) (HCP) Pipelines
#
# ## License
#
# See the [LICENSE](https://github.com/Washington-University/HCPpipelines/blob/master/LICENSE.md) file
#

# ------------------------------------------------------------------------------
#  Compile MATLAB code used for ICAFIX
# ------------------------------------------------------------------------------
compile_ICAFIX_code()
{
	log_Msg "----------------------------------------"
	log_Msg "Compiling ICAFIX-related MATLAB code"
	log_Msg "----------------------------------------"
	${HCPPIPEDIR}/ICAFIX/scripts/Compile_MATLAB_code.sh
}

# ------------------------------------------------------------------------------
#  Compile MATLAB code used for MSMAll
# ------------------------------------------------------------------------------
compile_MSMALL_code()
{
	log_Msg "----------------------------------------"
	log_Msg "Compiling MSMAll-related MATLAB code"
	log_Msg "----------------------------------------"
	${HCPPIPEDIR}/MSMAll/scripts/Compile_MATLAB_code.sh
}

# ------------------------------------------------------------------------------
#  Compile MATLAB code used for RestingStateStats
# ------------------------------------------------------------------------------
compile_RestingStateStats_code()
{
	log_Msg "----------------------------------------"
	log_Msg "Compiling RestingStateStats-related MATLAB code"
	log_Msg "----------------------------------------"
	${HCPPIPEDIR}/RestingStateStats/Compile_MATLAB_code.sh
}

# ------------------------------------------------------------------------------
#  Main processing of script.
# ------------------------------------------------------------------------------
main()
{
	compile_ICAFIX_code
	compile_MSMALL_code
	compile_RestingStateStats_code
}

# ------------------------------------------------------------------------------
# "Global" processing - everything above here should be in a function
# ------------------------------------------------------------------------------

# Verify that HCPPIPEDIR environment variable is set
if [ -z "${HCPPIPEDIR}" ]; then
	script_name=$(basename "${0}")
	echo "${script_name}: ABORTING: HCPPIPEDIR environment variable must be set"
	exit 1
fi

# Load function libraries
source "${HCPPIPEDIR}/global/scripts/log.shlib" # Logging related functions
log_Msg "HCPPIPEDIR: ${HCPPIPEDIR}"

# Verify that any other needed environment variables are set
log_Check_Env_Var MATLAB_HOME

# Invoke the main processing
main "$@"

