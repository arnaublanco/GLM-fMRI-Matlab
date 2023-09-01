# General Linear Model with functional MRI data

A General Linear Model (GLM) is a statistical framework commonly used in various fields, including neuroscience and neuroimaging. It is designed to analyze and model the relationships between one or more **independent variables** (**predictors**) $X_{ij}$ and a **dependent variable** (**response**) $Y_i$ while accounting for noise or variability in the data.

$$Y_i = \beta_0 + \beta_1 X_{i1} + \beta_2 X_{i2} + ... + \beta_n X_{ip} + \epsilon_{i}$$

for each observation $i = 0,1,...n$ and complexity $j = 0,1,...,p$.

In neuroimaging, such as fMRI (*functional Magnetic Resonance Imaging*) analysis, a GLM is often employed to relate **experimental conditions** or **stimuli** to **brain activity**. It helps researchers understand how different factors influence brain responses by estimating parameters, i.e. the beta coefficients, that describe the strength and nature of these relationships. GLMs are versatile and can be adapted to various experimental designs, making them a valuable tool for studying brain function and behavior.

In particular, a GLM can be used for decoding fMRI data, here's how it works:

1. **Modeling Brain Activity:** In fMRI studies, researchers measure the blood oxygen level-dependent (BOLD) signal, which is a proxy for neural activity. The GLM is used to model how this BOLD signal varies across time in response to different experimental conditions or stimuli.
2. **Experimental Design:** During an fMRI experiment, subjects are exposed to various stimuli or tasks, such as viewing images, hearing sounds, or performing cognitive tasks. These experimental conditions are typically designed in a way that they can be described as a series of events or conditions over time.
3. **Convolution with Hemodynamic Response Function (HRF):** The GLM convolves the experimental design with the hemodynamic response function (HRF), which represents the delay and shape of the BOLD response to a neural event. This convolution helps to predict how the BOLD signal should change in response to the experimental conditions.
4. **Estimation of Betas:** The GLM estimates beta coefficients for each condition or stimulus. These beta coefficients represent the strength of the relationship between the experimental conditions and the BOLD signal at each voxel in the brain.
5. **Decoding:** Once you have these beta coefficients, they can be used for decoding. For example, if you have fMRI data recorded while subjects were exposed to three different sounds, the beta coefficients associated with each sound condition can be used to train a decoding model (e.g., a machine learning classifier). This model can then be applied to new fMRI data to predict which of the three sounds the subject is hearing based on the patterns of brain activity.

Here's an example of a 2020 study where they follow this approach: <a href="https://pubmed.ncbi.nlm.nih.gov/32559449/">Decoding Natural Sounds in Early "Visual" Cortex of Congenitally Blind Individuals</a>.

In many cases, the beta coefficients obtained from a General Linear Model (GLM) **may not be sufficient** on their own to perform accurate classification or decoding of complex stimuli or conditions. While beta coefficients capture the relationship between experimental conditions and brain activity, additional features and techniques are often used to improve classification accuracy.

In this repository, the `main.m` file contains the MATLAB code to fit a fMRI signal in a given voxel in the `bold.nii.gz` file, which has not been uploaded for permission restrictions. Furthermore, the file loads the `design_matrix.txt` file which contains a binary table where the 1's indicates the presence of an external stimuli or task for a given timepoint. This file has been generated in `createDesignMatrix.m` from the `events.csv` file. Note that the design matrix is not convolved with the HRF.
