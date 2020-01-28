
function [DataOut]=NoiseAddition(DataIn,aa)
%*********************************************************************
%*********************************************************************
%*********************************************************************
%*********************************************************************
%*********************************************************************
%*********************************************************************
%函数功能：在输入的数据中加入高斯噪声，对于激光雷达数据，噪声值添加在
%          range上，采样角保持不变。
%输入：DataIn和aa
%      2×N矩阵DataIn(:,i)=|range|
%                          |theta|
%      距离向量 range
%      角度向量 theta
%      其中(range,theta)对应某一障碍点的信息
%      aa为噪声参数
%输出：DataOut和aa
%      2×N矩阵DataOut=|range|
%                      |theta|
%      DataOut和DataIn相比数组维度保持不变，改变的只是range对应的数值（添加了噪声）
%
%作者：Shaofeng Wu 
%时间：2019.12.06
%邮箱：shaofeng693@126.com
%*********************************************************************
%*********************************************************************
%*********************************************************************

Temp0=DataIn(1,:);
%在信号temp0中加入高斯白噪声，信噪比snr以dB为单位，
%如果temp0是复数，就加入复噪声，假定temp0的强度为0dBW
%snr取为10*log10(0.0965)，表示要产生均值0，方差为0.0965 的高斯白噪声
%信噪比(snr)的计量单位是dB，其计算方法是10lg(Ps/Pn)，其中Ps和Pn分别代表信号
%和噪声的有效功率，也可以换算成电压幅值的比率关系：20Lg(Vs/Vn)，Vs和Vn分别
%代表信号和噪声电压的“有效值”。在音频放大器中，我们希望的是该放大器除了放
%大信号外，不应该添加任何其它额外的东西。因此，信噪比应该越高越好。
Temp1 = awgn(Temp0, aa);

DataOut(1,:)=Temp1;
DataOut(2,:)=DataIn(2,:);





