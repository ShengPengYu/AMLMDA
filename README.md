## AMLMDA<br> 

Prediction of potential miRNA-disease associations based on adaptive multi-label learning.<br>

**1.Method Description:** 

We propose to learn a new data graph adaptively for both diseases and miRNAs and then simultaneously update the predicted miRNA-disease information by multi-label learning. As a result, our method achieves comparable performance under different evaluation metrics, which suggests that our method is capable of discovering greater number of true miRNA-disease associations. Moreover, case study conducted on Lung Neoplasms further confirms the prediction reliability of the proposed method. Together, the experimental results clearly demonstrate the utility and efficacy of the proposed method. We anticipate that our method could serve as a reliable and efficient tool for uncovering disease-related miRNAs.  

**2. Usage:**

2.1.  You should completely download the whole project to your personal computer.
  
2.2. You should ensure your personal computer has installed MATLAB environment.
  
2.3. You should import MCLPMDA project to MATLAB workspace.
  
2.4. If you want to use MCLPMDA to get the predicting results, you just need to run 'E_PREDICT.m' ;
  
Then, The program will output files as follows (./Experiments/predict/predict_result.txt):
  
|                                    | hsa-mir-125a | hsa-mir-196a | hsa-mir-499a | ...... |
| ---------------------------------- | ------------ | ------------ | ------------ | ------ |
| Abortion, Habitual                 | 9.522239e-01 | 9.528295e-01 | 9.520322e-01 | ...... |
| Acquired Immunodeficiency Syndrome | 1.469990e-03 | 1.519555e-03 | 8.732708e-04 | ...... |
| ACTH-Secreting Pituitary Adenoma   | 2.600308e-03 | 2.556880e-03 | 1.580478e-03 | ...... |
| Acute Coronary Syndrome            | 1.787939e-03 | 2.401789e-03 | 1.984312e-03 | ...... |
| ......                             | ......       | ......       | ......       | ...... |


2.5 If you want to use global LOOCV to verify the performance of ALMDA, you just need to run 'E_GCV1.m' ;
    
2.6 If you want to use five-fold cross validation to verify the performance of ALMDA, you just need to run 'E_FCV1.m';

2.7 If you want to use LODOCV framework to verify the performance of ALMDA, you just need to run 'E_LODOCV1.m';

......


**3. Contact:**

For any questions regarding our work, please feel free to contact us: sdnuysp@163.com 
