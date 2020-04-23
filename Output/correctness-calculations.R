## This R script is used to calculate correctness metrics from 
## the following output directories:
## 'Output_GENIE3_Ds10n/',
## 'Output_GENIE3_Ds50n/' and
## 'Output_GENIE3_Ds100n/'.

## ======================================================================================================
## Calculate correctness for Ds10n.
##
## Please execute the following commands
## from the 'Test_GENIE3/' directory.
## It is assumed that the output directory is 
## 'Test_GENIE3/asset/Output_GENIE3_Ds10n/'.
 
base::rm(list = base::ls())
base::source('calc_correctness.R')
load('asset/DREAM3GoldStandard_InSilicoSize10_Yeast1_TrueNet.RData')
load('asset/Output_GENIE3_Ds10n/di_net_adj_matrix_wt.RData')

## With top 4 edges
di_net_adj_list <- GENIE3::getLinkList(di_net_adj_matrix_wt, reportMax = 4, threshold = 0)
base::save(di_net_adj_list, file = 'asset/Output_GENIE3_Ds10n/di_net_adj_list_top4.RData')
correctness <- CalcCorrectnessNetPredDiListVsTrueDiMx(di_net_adj_list, true.net.adj.matrix, print_tr_pos = TRUE)
base::save(correctness, file = 'asset/Output_GENIE3_Ds10n/correctness_top4.RData')

## With top 13 edges
di_net_adj_list <- GENIE3::getLinkList(di_net_adj_matrix_wt, reportMax = 13, threshold = 0)
base::save(di_net_adj_list, file = 'asset/Output_GENIE3_Ds10n/di_net_adj_list_top13.RData')
correctness <- CalcCorrectnessNetPredDiListVsTrueDiMx(di_net_adj_list, true.net.adj.matrix, print_tr_pos = TRUE)
base::save(correctness, file = 'asset/Output_GENIE3_Ds10n/correctness_top13.RData')

## ======================================================================================================
## Calculate correctness for Ds50n.
##
## Please execute the following commands
## from the 'Test_GENIE3/' directory.
## It is assumed that the output directory is 
## 'Test_GENIE3/asset/Output_GENIE3_Ds50n/'.

base::rm(list = base::ls())
base::source('calc_correctness.R')
load('asset/DREAM3GoldStandard_InSilicoSize50_Yeast1_TrueNet.RData')
load('asset/Output_GENIE3_Ds50n/di_net_adj_matrix_wt.RData')

## With top 106 edges
di_net_adj_list <- GENIE3::getLinkList(di_net_adj_matrix_wt, reportMax = 106, threshold = 0)
base::save(di_net_adj_list, file = 'asset/Output_GENIE3_Ds50n/di_net_adj_list_top106.RData')
correctness <- CalcCorrectnessNetPredDiListVsTrueDiMx(di_net_adj_list, true.net.adj.matrix, print_tr_pos = TRUE)
base::save(correctness, file = 'asset/Output_GENIE3_Ds50n/correctness_top106.RData')

## With top 357 edges
di_net_adj_list <- GENIE3::getLinkList(di_net_adj_matrix_wt, reportMax = 357, threshold = 0)
base::save(di_net_adj_list, file = 'asset/Output_GENIE3_Ds50n/di_net_adj_list_top357.RData')
correctness <- CalcCorrectnessNetPredDiListVsTrueDiMx(di_net_adj_list, true.net.adj.matrix, print_tr_pos = TRUE)
base::save(correctness, file = 'asset/Output_GENIE3_Ds50n/correctness_top357.RData')

## ======================================================================================================
## Calculate correctness for Ds100n.
##
## Please execute the following commands
## from the 'Test_GENIE3/' directory.
## It is assumed that the output directory is 
## 'Test_GENIE3/asset/Output_GENIE3_Ds100n/'.

base::rm(list = base::ls())
base::source('calc_correctness.R')
load('asset/DREAM3GoldStandard_InSilicoSize100_Yeast1_TrueNet.RData')
load('asset/Output_GENIE3_Ds100n/di_net_adj_matrix_wt.RData')

## With top 200 edges
di_net_adj_list <- GENIE3::getLinkList(di_net_adj_matrix_wt, reportMax = 200, threshold = 0)
base::save(di_net_adj_list, file = 'asset/Output_GENIE3_Ds100n/di_net_adj_list_top200.RData')
correctness <- CalcCorrectnessNetPredDiListVsTrueDiMx(di_net_adj_list, true.net.adj.matrix, print_tr_pos = TRUE)
base::save(correctness, file = 'asset/Output_GENIE3_Ds100n/correctness_top200.RData')

## With top 818 edges
di_net_adj_list <- GENIE3::getLinkList(di_net_adj_matrix_wt, reportMax = 818, threshold = 0)
base::save(di_net_adj_list, file = 'asset/Output_GENIE3_Ds100n/di_net_adj_list_top818.RData')
correctness <- CalcCorrectnessNetPredDiListVsTrueDiMx(di_net_adj_list, true.net.adj.matrix, print_tr_pos = TRUE)
base::save(correctness, file = 'asset/Output_GENIE3_Ds100n/correctness_top818.RData')
