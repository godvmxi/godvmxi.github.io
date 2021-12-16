---
title: CABAC vs CAVLC
date: 2021-12-16 11:54:25
tags:
    - H264
    - AVC
---
# 什么是熵编码？
熵编码压缩是一种无损压缩，其实现原理是使用新的编码来表示输入的数据，从而达到压缩的效果。常用的熵编码有游程编码，哈夫曼编码和CAVLC编码等。
CAVLC是在H.264/MPEG-4AVC中使用的熵编码方式。在H.264中，CAVLC以zig-zag顺序用于对变换后的残差块进行编码。CAVLC是CABAC的替代品，虽然其压缩效率不如CABAC，但CAVLC实现简单，并且在所有的H.264profile中都支持。
![](flow.png)
# CABAC
CABAC: 基于上下文自适应的二进制算术编码(Context-based Adaptive Binary Arithmetic Coding)
# CAVLC
CAVLC: 基于上下文自适应变长编码(Context-based Adaptive Variable Length Coding)
# Perf
CABAC和CAVLC是H.264中的两种熵编码算法.通过序列foreman和coastguard对CABAC和CAVLC的压缩性能进行了比较,在给定的实验条件下得出CABAC的比特率比CAVLC节省5%～14%,并且随量化步长的增大,比特率节省增多.但是CABAC计算复杂度高,耗时比CAVLC长,

## CABAC编码详情
CABAC编码之所以能取得很高的压缩比，是因为：

> a) 根据每一个语法元素的上下文来选取预测模型;
> b) 使用本地的统计数据来估计概率；
> c) 使用算术编码而不是变长编码。

编码一个符号需要经过下面几步：

> 1. 二值化。CABAC使用的算术编码是基于二进制的算术编码，因此非二进制形式的编码首先要转化为二进制的形式表示。
> 2. 选择上下文模型。“上下文模型”是指对二值化后的符号中的bit位进行编码时使用的概率模型。概率模型与最近编码的符号相关，会有多个概率模型可供选择。
> 3. 算术编码。算术编码器根据第2步选择的概率模型对每个bit进行编码。需要注意的是每个bit的子范围只有两个数：0和1。
> 4. 更新预测模型。根据实际编码的值来更新所选择的预测模型。例如，如果所编码的二进制bit为1,则预测模型中的1计数要增加。

## CAVLC的编码过程如下：

### 1. 计算非零系数（TotalCoeffs）和拖尾系数（TrailingOnes）的数目。

拖尾系数指值为 +1/-1的系数，最大数目为 3。如果超过 3个，那么只有最后三个被视为拖尾系数。拖尾系数的数目被赋值到变量 TrailingOnes。
非零系数包括所有的拖尾系数，其数目被赋值到变量 TotalCoeffs)。

### 2. 计算nC(numberCurrent，当前块值)。
nC值由左边块的非零系数 nA和上面块非零系数 nB来确定，计算公式为： nC=round((nA+nB)/2)；若 nA存在 nB不存在，则 nC=nA；若 nA不存在而 nB存在，则 nC=nB；若 nA和 nB都不存在，则 nC=0。
nC值用于选择 VLC编码表，如下图所示。这里体现了上下文相关 (contextadaptive)的特性，例如当 nC值较小即周围块的非零系数较少时，就会选择比较短的码，从而实现了数据压缩。
![](cal_2.gif)
### 3.查表获得coff_token的编码。

根据之前编码和计算过程所得的变量 TotalCoeffs 、 TrailingOnes 和 nC 值可以查 H.264 标准附录 CAVLC 码表，即可得出 coeff_token 编码序列。

### 4. 编码每个拖尾系数的符号，按zig-zag的逆序进行编码。

每个符号用 1个 bit位来表示， 0表示“ +”， 1表示“—”。
当拖尾系数超过三个时只有最后三个被认定为拖尾系数，引词编码顺序为从后向前编码。
### 5. 编码除拖尾系数之外非零系数的level（Levels）。

每个非零系数的 level包括 sign和 magnitude，扫描顺序是逆 zig-zag序。
level的编码由前缀 (level_prefix)和后缀 (level_suffix)组成。前缀的长度在 0到 6之间，后缀的长度则可通过下面的步骤来确定：
将后缀初始化为 0。（若非零系数的总数超过 10且拖尾系数不到 3，则初始化为 1）。
编码频率最高（即按扫描序最后）的除拖尾系数之外的非零系数。
若这个系数的 magnitude 超过某个门槛值 (threshold) ，则增加后缀的长度。下表是门槛值的列表： 
![](cal_5.gif)
### 6. 编码最后一个非零系数之前0的个数（totalZeos）。

TotalZeros 指的是在最后一个非零系数前零的数目，此非零系数指的是按照正向扫描的最后一个非零系数
根据 TotalCoeffs 值， H.264 标准共提供了 25 个变长表格供查找，其中编码亮度数据时有 15 个表格供查找，编码色度 DC2 × 2 块（ 4 ： 2:0 格式）有 3 个表格、编码色度 DC2 × 4 块（ 4 ： 2:2 格式）有 7 个表格。
### 7. 编码每个系数前面0的数目（run_before）。

扫描顺序为 zig-zag 的逆序。
若 ∑ [run_before]== total_zeros ，则不需再计算run_before
扫描序中的最后一个元素不需要计算 run_before
每个 run_before 的 VLC 编码取决于 run_before 自身及未编码的 0 的个数 ZerosLeft 。例如若 ZerosLeft== 2 ，那么 run_before 只可能是 0,1 或 2 ，因此使用两个 bit 即可表示。
