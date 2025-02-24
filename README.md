# Urban Transport Systems Project

## Project Overview

This project focuses on analyzing and improving the public transport system provided by **ASTIKO KTEL Volou** in Volos, Greece. The goal is to identify inefficiencies and key issues within the city's public transport services and propose actionable recommendations to enhance overall service quality and passenger satisfaction. The project leverages data analysis, data visualization, and machine learning techniques to evaluate the performance of the system, understand operational bottlenecks, analyze passenger patterns, and suggest improvements.

### Key Objectives:

1. **Data Analysis Tools**: The project utilizes RStudio and Python to process and analyze key data from various bus lines and stops of ASTIKO KTEL Volou. By analyzing this data, we aim to uncover trends and patterns such as peak hours, bus delays, overcrowding, and other operational issues.

2. **Identification of Key Issues**: We use the data to identify major challenges in the public transport system, such as inefficiencies in bus routes, frequent delays, areas with high passenger demand, and under-served locations, particularly in suburban regions. Pinpointing these problems allows for targeted solutions to improve service.

3. **Recommendations for Improvement**: Based on the insights gained from data analysis, we provide actionable recommendations aimed at improving the service. These include optimizing bus schedules, enhancing fleet management, improving frequency during peak hours, and expanding service coverage to underserved areas.

4. **Enhancing Real-time Services**: One of the objectives is to provide real-time data and recommendations to passengers, enabling them to make informed travel decisions. This involves creating data visualizations and interactive dashboards that display live information about bus locations, delays, and estimated arrival times.

## Project Structure

The repository includes the following core components:

1. **Code in R and Python**: The repository contains R and Python scripts for analyzing the data, processing key metrics, and visualizing results. The code is designed to be flexible and adaptable, allowing for future improvements or modifications.

2. **Data Analysis Results and Visualizations**: Various plots, graphs, and charts are generated to highlight key metrics such as bus delays, passenger boarding/unboarding counts, average speeds, and bus frequency. These visualizations help present the current performance of the public transport system and identify areas that need attention.

3. **Recommendations Document**: A comprehensive document containing actionable insights and recommendations based on the data analysis. These recommendations are aimed at improving operational efficiency, passenger comfort, and service reliability.

## Goals and Impact

The primary goal of this project is to empower ASTIKO KTEL Volou with data-driven insights that enable informed decision-making. By implementing the recommendations, we aim to:

1.  **Optimize Bus Routes and Schedules**: Improve the planning of bus routes and schedules to ensure better coverage and efficiency, minimizing delays and overcrowding.

2.  **Improve Passenger Experience**: Address issues such as delays and overcrowding to provide passengers with a more comfortable and timely travel experience.

3.  **Enhance Data-Driven Decision Making**: Provide ASTIKO KTEL Volou with a data-driven framework to continuously evaluate and adjust their services, ensuring ongoing improvements.

4.  **Promote Sustainable Urban Mobility**: Contribute to sustainable urban transportation solutions in Volos, supporting long-term, eco-friendly mobility goals.

By successfully implementing the recommendations, this project aims to deliver a more reliable, efficient, and accessible public transport system to the citizens of Volos.

#### Key Impacts:

-**Optimized Bus Routes and Schedules**: Enhanced planning for better service coverage and efficiency.

-**Improved Passenger Experience**: Reduced delays and overcrowding leading to a more comfortable and reliable travel experience.

-**Enhanced Data-Driven Decision Making**: Providing actionable insights to improve daily operations and long-term planning.

-**Sustainable Urban Mobility**: Promoting sustainable transportation options in Volos.

## Repository Structure and Explanation

```plain text
📦 Urban Transport Systems Project
├── .github
│   └── workflows
│       ├── jekyll-docker.yml  # GitHub Actions workflow for Jekyll with Docker
│       └── r.yml              # GitHub Actions workflow for R scripts
├── .gitignore                # Specifies files to ignore in Git
├── Final_SAS_B_G_G_K         # Main project folder
│   ├── Data                  # Contains all data files
│   │   └── Erwthmatologia    # Folder for questionnaire data
│   │       ├── Apanthseis    # Folder for responses
│   │       │   ├── All_R     # Folder for all responses combined
│   │       │   │   ├── data_tilematikh1.xlsx  # Excel file with response data
│   │       │   │   ├── data_tilematikh2.xlsx  # Excel file with response data
│   │       │   │   ├── data_tilematikh3.xlsx  # Excel file with response data
│   │       │   │   ├── pre_Έντυπο_Μέτρησης_στην_Στάση (Απαντήσεις).xlsx  # Pre-survey responses for station measurements
│   │       │   │   ├── pre_Έντυπο_Μέτρησης_στο_Λεωφορείο (Απαντήσεις).xlsx  # Pre-survey responses for bus measurements
│   │       │   │   ├── pre_Ερωτηματολόγιο_Βαϊνάς_Γκουγκουλής (Απαντήσεις).xlsx  # Pre-survey responses for questionnaire
│   │       │   │   ├── pre_Ερωτηματολόγιο_Κάλλης_Γιαλούρης (Απαντήσεις).xlsx  # Pre-survey responses for questionnaire
│   │       │   │   ├── Έντυπο_Μέτρησης_στην_Στάση (Απαντήσεις).xlsx  # Post-survey responses for station measurements
│   │       │   │   ├── Έντυπο_Μέτρησης_στο_Λεωφορείο (Απαντήσεις).xlsx  # Post-survey responses for bus measurements
│   │       │   │   ├── Ερωτηματολόγιο_Βαϊνάς_Γκουγκουλής (Απαντήσεις).xlsx  # Post-survey responses for questionnaire
│   │       │   │   └── Ερωτηματολόγιο_Κάλλης_Γιαλούρης (Απαντήσεις).xlsx  # Post-survey responses for questionnaire
│   │       │   ├── Βαϊνάς_Γκουγκουλής  # Folder for specific respondents
│   │       │   │   ├── Βαϊνάς  # Folder for Βαϊνάς responses
│   │       │   │   │   ├── pre_Έντυπο_Μέτρησης_στην_Στάση (Απαντήσεις).xlsx  # Pre-survey responses for station measurements
│   │       │   │   │   └── Έντυπο_Μέτρησης_στην_Στάση (Απαντήσεις).xlsx  # Post-survey responses for station measurements
│   │       │   │   └── Γκουγκουλής  # Folder for Γκουγκουλής responses
│   │       │   │       ├── pre_Ερωτηματολόγιο_Βαϊνάς_Γκουγκουλής (Απαντήσεις).xlsx  # Pre-survey responses for questionnaire
│   │       │   │       └── Ερωτηματολόγιο_Βαϊνάς_Γκουγκουλής (Απαντήσεις).xlsx  # Post-survey responses for questionnaire
│   │       │   └── Κάλλης_Γιαλούρης  # Folder for specific respondents
│   │       │       ├── Γιαλούρης  # Folder for Γιαλούρης responses
│   │       │       │   ├── pre_Ερωτηματολόγιο_Κάλλης_Γιαλούρης (Απαντήσεις).xlsx  # Pre-survey responses for questionnaire
│   │       │       │   └── Ερωτηματολόγιο_Κάλλης_Γιαλούρης (Απαντήσεις).xlsx  # Post-survey responses for questionnaire
│   │       │       └── Κάλλης  # Folder for Κάλλης responses
│   │       │           ├── pre_Έντυπο_Μέτρησης_στο_Λεωφορείο (Απαντήσεις).xlsx  # Pre-survey responses for bus measurements
│   │       │           └── Έντυπο_Μέτρησης_στο_Λεωφορείο (Απαντήσεις).xlsx  # Post-survey responses for bus measurements
│   │       ├── Excel  # Folder for processed Excel files
│   │       │   ├── ΕΡΩΤΗΜΑΤΟΛΟΓΙΟ_ΙΚΑΝΟΠΟΙΗΣΗ.xlsx  # Satisfaction questionnaire data
│   │       │   ├── ΜΕΤΡΗΣΗ_ΣΤΑΣΗ_ΒΑΙΝΑΣ_ΓΚΟΥΓΚΟΥΛΗΣ.xlsx  # Station measurement data
│   │       │   └── ΜΕΤΡΗΣΗ_ΣΤΟ_ΛΕΩΦΟΡΕΙΟ_ΓΙΑΛΟΥΡΗΣ_ΚΑΛΛΗΣ.xlsx  # Bus measurement data
│   │       ├── Forms  # Folder for form data
│   │       │   ├── Βαϊνάς_Γκουγκουλής  # Folder for Βαϊνάς and Γκουγκουλής forms
│   │       │   │   ├── Βαϊνάς  # Folder for Βαϊνάς forms
│   │       │   │   │   ├── pre_Έντυπο_Μέτρησης_στην_Στάση  # Pre-survey station measurement forms
│   │       │   │   │   │   ├── pre_Έντυπο_Μέτρησης_στην_Στάση.csv  # CSV file for pre-survey data
│   │       │   │   │   │   └── pre_Έντυπο_Μέτρησης_στην_Στάση.html  # HTML file for pre-survey data
│   │       │   │   │   └── Έντυπο_Μέτρησης_στην_Στάση  # Post-survey station measurement forms
│   │       │   │   │       ├── Έντυπο_Μέτρησης_στην_Στάση.csv  # CSV file for post-survey data
│   │       │   │   │       └── Έντυπο_Μέτρησης_στην_Στάση.html  # HTML file for post-survey data
│   │       │   │   └── Γκουγκουλής  # Folder for Γκουγκουλής forms
│   │       │   │       ├── pre_Ερωτηματολόγιο_Βαϊνάς_Γκουγκουλής  # Pre-survey questionnaire forms
│   │       │   │       │   ├── pre_Ερωτηματολόγιο_Βαϊνάς_Γκουγκουλής.csv  # CSV file for pre-survey data
│   │       │   │       │   └── pre_Ερωτηματολόγιο_Βαϊνάς_Γκουγκουλής.html  # HTML file for pre-survey data
│   │       │   │       └── Ερωτηματολόγιο_Βαϊνάς_Γκουγκουλής  # Post-survey questionnaire forms
│   │       │   │           ├── Ερωτηματολόγιο_Βαϊνάς_Γκουγκουλής.csv  # CSV file for post-survey data
│   │       │   │           └── Ερωτηματολόγιο_Βαϊνάς_Γκουγκουλής.html  # HTML file for post-survey data
│   │       │   └── Κάλλης_Γιαλούρης  # Folder for Κάλλης and Γιαλούρης forms
│   │       │       ├── Γιαλούρης  # Folder for Γιαλούρης forms
│   │       │       │   └── Γιαλούρης.txt  # Text file for Γιαλούρης data
│   │       │       └── Κάλλης  # Folder for Κάλλης forms
│   │       │           └── Κάλλης.txt  # Text file for Κάλλης data
│   │       └── Pdfs  # Folder for PDF files
│   │           ├── ΕΡΩΤΗΜΑΤΟΛΟΓΙΟ_ΙΚΑΝΟΠΟΙΗΣΗ.pdf  # Satisfaction questionnaire PDF
│   │           ├── ΜΕΤΡΗΣΗ_ΣΤΑΣΗ_ΒΑΙΝΑΣ_ΓΚΟΥΓΚΟΥΛΗΣ.pdf  # Station measurement PDF
│   │           └── ΜΕΤΡΗΣΗ_ΣΤΟ_ΛΕΩΦΟΡΕΙΟ_ΓΙΑΛΟΥΡΗΣ_ΚΑΛΛΗΣ.pdf  # Bus measurement PDF
│   ├── Data_Analysis  # Folder for data analysis scripts and outputs
│   │   ├── Code  # Folder for analysis code
│   │   │   ├── Bus_Heamap_Code.py  # Python script for bus heatmap
│   │   │   └── R_Studio_All_Code.R  # R script for data analysis
│   │   ├── Plots  # Folder for generated plots
│   │   │   ├── Image_Plots  # Folder for static image plots
│   │   │   │   ├── Erwt_Leoforeio  # Folder for bus-related plots
│   │   │   │   │   ├── Age_Answer_Frequency.jpeg  # Age frequency plot
│   │   │   │   │   ├── Anova_F_Values_Heatmap.jpeg  # ANOVA heatmap
│   │   │   │   │   ├── Box_Plot_of_Variables.jpeg  # Box plot of variables
│   │   │   │   │   ├── Bus_Use_Frequency_Answer_Frequency.jpeg  # Bus usage frequency plot
│   │   │   │   │   ├── CV_for_Each_Score_Type.jpeg  # Coefficient of variation plot
│   │   │   │   │   ├── Chi_Square_Test_p_Values.jpeg  # Chi-square test p-values
│   │   │   │   │   ├── Cleanliness_Score_Answer_Frequency.jpeg  # Cleanliness score frequency
│   │   │   │   │   ├── Cleanliness_Score_Histogram_Mean_Median.jpeg  # Cleanliness score histogram
│   │   │   │   │   ├── Comfort_Score_Answer_Frequency.jpeg  # Comfort score frequency
│   │   │   │   │   ├── Comfort_Score_Histogram_Mean_Median.jpeg  # Comfort score histogram
│   │   │   │   │   ├── Density_of_Skewness.jpeg  # Skewness density plot
│   │   │   │   │   ├── Distance_to_Stop_Score_Answer_Frequency.jpeg  # Distance to stop score frequency
│   │   │   │   │   ├── Distance_to_Stop_Score_Histogram_Mean_Median.jpeg  # Distance to stop score histogram
│   │   │   │   │   ├── Gender_Answer_Frequency.jpeg  # Gender frequency plot
│   │   │   │   │   ├── Kurtosis_for_Each_Score_Type.jpeg  # Kurtosis plot
│   │   │   │   │   ├── Linear_Regression_Coefficients.jpeg  # Linear regression coefficients
│   │   │   │   │   ├── Logistic_Regression_Odds_Ratios.jpeg  # Logistic regression odds ratios
│   │   │   │   │   ├── Mean_Scores_for_Each_Variable.jpeg  # Mean scores plot
│   │   │   │   │   ├── Move_Reason_Answer_Frequency.jpeg  # Move reason frequency plot
│   │   │   │   │   ├── Overall_Score_Answer_Frequency.jpeg  # Overall score frequency
│   │   │   │   │   ├── Overall_Score_Histogram_Mean_Median.jpeg  # Overall score histogram
│   │   │   │   │   ├── Peason_Corr_Matrix_Heatmap.jpeg  # Pearson correlation heatmap
│   │   │   │   │   ├── Percentiles_for_Each_Score_Type.jpeg  # Percentiles plot
│   │   │   │   │   ├── Range_and_Variance_for_Each_Score_Type.jpeg  # Range and variance plot
│   │   │   │   │   ├── Reliability_Score_Answer_Frequency.jpeg  # Reliability score frequency
│   │   │   │   │   ├── Reliability_Score_Histogram_Mean_Median.jpeg  # Reliability score histogram
│   │   │   │   │   ├── Residuals_vs_Fitted_QQ_Plot_of_Residuals.jpeg  # Residuals vs fitted plot
│   │   │   │   │   ├── Safety_Score_Answer_Frequency.jpeg  # Safety score frequency
│   │   │   │   │   ├── Safety_Score_Histogram_Mean_Median.jpeg  # Safety score histogram
│   │   │   │   │   ├── Scatter_Plot_of_Absolute_Difference_of_Overall_Mean_Score.jpeg  # Scatter plot of overall score differences
│   │   │   │   │   ├── T_test_p_Values_by_Numerical_Variables_Gender_Comparison.jpeg  # T-test p-values by gender
│   │   │   │   │   ├── Ticket_Price_Score_Answer_Frequency.jpeg  # Ticket price score frequency
│   │   │   │   │   ├── Ticket_Price_Score_Histogram_Mean_Median.jpeg  # Ticket price score histogram
│   │   │   │   │   ├── Time_Waited_Score_Answer_Frequency.jpeg  # Time waited score frequency
│   │   │   │   │   └── Time_Waited_Score_Histogram_Mean_Median.jpeg  # Time waited score histogram
│   │   │   │   ├── Erwt_Mixed  # Folder for mixed questionnaire plots
│   │   │   │   │   ├── Age_Distribution.jpeg  # Age distribution plot
│   │   │   │   │   ├── Combined_Responses_Percentage.png  # Combined responses percentage
│   │   │   │   │   ├── Gender_Distribution.jpeg  # Gender distribution plot
│   │   │   │   │   ├── Move_Reason_Most_Answered.jpeg  # Most answered move reason
│   │   │   │   │   ├── Responses_Percentage.png  # Responses percentage
│   │   │   │   │   ├── Scaled_Mean_Percentage_of_Scores.jpeg  # Scaled mean percentage of scores
│   │   │   │   │   └── Travel_Time_Stats.jpeg  # Travel time statistics
│   │   │   │   ├── Erwt_Stash  # Folder for station-related plots
│   │   │   │   │   ├── Age_Answer_Frequency.jpeg  # Age frequency plot
│   │   │   │   │   ├── Anova_F_Values_Heatmap.jpeg  # ANOVA heatmap
│   │   │   │   │   ├── Box_Plot_of_Variables.jpeg  # Box plot of variables
│   │   │   │   │   ├── Bus_Use_Frequency_Answer_Frequency.jpeg  # Bus usage frequency plot
│   │   │   │   │   ├── CV_for_Each_Score_Type.jpeg  # Coefficient of variation plot
│   │   │   │   │   ├── Chi_Square_Test_p_Values.jpeg  # Chi-square test p-values
│   │   │   │   │   ├── Cleanliness_Score_Answer_Frequency.jpeg  # Cleanliness score frequency
│   │   │   │   │   ├── Cleanliness_Score_Histogram_Mean_Median.jpeg  # Cleanliness score histogram
│   │   │   │   │   ├── Comfort_Score_Answer_Frequency.jpeg  # Comfort score frequency
│   │   │   │   │   ├── Comfort_Score_Histogram_Mean_Median.jpeg  # Comfort score histogram
│   │   │   │   │   ├── Density_of_Skewness.jpeg  # Skewness density plot
│   │   │   │   │   ├── Distance_to_Stop_Score_Answer_Frequency.jpeg  # Distance to stop score frequency
│   │   │   │   │   ├── Distance_to_Stop_Score_Histogram_Mean_Median.jpeg  # Distance to stop score histogram
│   │   │   │   │   ├── Gender_Answer_Frequency.jpeg  # Gender frequency plot
│   │   │   │   │   ├── Kurtosis_for_Each_Score_Type.jpeg  # Kurtosis plot
│   │   │   │   │   ├── Linear_Regression_Coefficients.jpeg  # Linear regression coefficients plot
│   │   │   │   │   ├── Logistic_Regression_Odds_Ratios.jpeg  # Logistic regression odds ratios plot
│   │   │   │   │   ├── Mean_Scores_for_Each_Variable.jpeg  # Mean scores for each variable plot
│   │   │   │   │   ├── Move_Reason_Answer_Frequency.jpeg  # Move reason frequency plot
│   │   │   │   │   ├── Overall_Score_Answer_Frequency.jpeg  # Overall score frequency plot
│   │   │   │   │   ├── Overall_Score_Histogram_Mean_Median.jpeg  # Overall score histogram with mean and median
│   │   │   │   │   ├── Pearson_Corr_Matrix_Heatmap.jpeg  # Pearson correlation matrix heatmap
│   │   │   │   │   ├── Percentiles_for_Each_Score_Type.jpeg  # Percentiles for each score type plot
│   │   │   │   │   ├── Range_and_Variance_for_Each_Score_Type.jpeg  # Range and variance for each score type plot
│   │   │   │   │   ├── Reliability_Score_Answer_Frequency.jpeg  # Reliability score frequency plot
│   │   │   │   │   ├── Reliability_Score_Histogram_Mean_Median.jpeg  # Reliability score histogram with mean and median
│   │   │   │   │   ├── Residuals_vs_Fitted_QQ_Plot_of_Residuals.jpeg  # Residuals vs fitted and QQ plot of residuals
│   │   │   │   │   ├── Safety_Score_Answer_Frequency.jpeg  # Safety score frequency plot
│   │   │   │   │   ├── Safety_Score_Histogram_Mean_Median.jpeg  # Safety score histogram with mean and median
│   │   │   │   │   ├── Scatter_Plot_of_Absolute_Difference_of_Overall_Mean_Score.jpeg  # Scatter plot of absolute differences in overall mean scores
│   │   │   │   │   ├── T_test_p_Values_by_Numerical_Variables_Gender_Comparison.jpeg  # T-test p-values by numerical variables for gender comparison
│   │   │   │   │   ├── Ticket_Price_Score_Answer_Frequency.jpeg  # Ticket price score frequency plot
│   │   │   │   │   ├── Ticket_Price_Score_Histogram_Mean_Median.jpeg  # Ticket price score histogram with mean and median
│   │   │   │   │   ├── Time_Waited_Score_Answer_Frequency.jpeg  # Time waited score frequency plot
│   │   │   │   │   └── Time_Waited_Score_Histogram_Mean_Median.jpeg  # Time waited score histogram with mean and median
│   │   │   │   ├── Metrhsh_Leoforeio  # Folder for bus measurement plots
│   │   │   │   │   ├── Average_Number_of_People_Boarded_vs_Unboarded.jpeg  # Average number of people boarded vs unboarded plot
│   │   │   │   │   ├── Average_People_Boarded_per_Stop.jpeg  # Average people boarded per stop plot
│   │   │   │   │   ├── Average_People_Unboarded_per_Stop.jpeg  # Average people unboarded per stop plot
│   │   │   │   │   ├── Average_Time_per_Stop.jpeg  # Average time per stop plot
│   │   │   │   │   ├── Box_Plot_of_People_Boarded_per_Stop.jpeg  # Box plot of people boarded per stop
│   │   │   │   │   ├── Box_Plot_of_People_Unboarded_per_Stop.jpeg  # Box plot of people unboarded per stop
│   │   │   │   │   ├── Boxplot_of_People_Boarded_and_Unboarded.jpeg  # Boxplot of people boarded and unboarded
│   │   │   │   │   ├── Bus_Lane.jpeg  # Bus lane plot
│   │   │   │   │   ├── Histogram_of_Maximum_Absolute_Time_Difference_per_Stop.jpeg  # Histogram of maximum absolute time difference per stop
│   │   │   │   │   ├── Max_People_Boarded_per_Stop.jpeg  # Maximum people boarded per stop plot
│   │   │   │   │   ├── Max_People_Unboarded_per_Stop.jpeg  # Maximum people unboarded per stop plot
│   │   │   │   │   ├── Max_Time_per_Stop.jpeg  # Maximum time per stop plot
│   │   │   │   │   ├── Number_of_Skips_per_Bus_Stop.jpeg  # Number of skips per bus stop plot
│   │   │   │   │   ├── Parked_Car.jpeg  # Parked car plot
│   │   │   │   │   ├── People_Boarded_per_1_Minute_Intervals.jpeg  # People boarded per 1-minute intervals plot
│   │   │   │   │   ├── People_Unboarded_per_1_Minute_Intervals.jpeg  # People unboarded per 1-minute intervals plot
│   │   │   │   │   ├── Scatter_Plot_of_People_Boarded.jpeg  # Scatter plot of people boarded
│   │   │   │   │   ├── Scatter_Plot_of_People_Unboarded.jpeg  # Scatter plot of people unboarded
│   │   │   │   │   ├── Scatter_Plot_of_Time_Differences.jpeg  # Scatter plot of time differences
│   │   │   │   │   ├── Scatter_Plot_of_Time_in_Stop_Values.jpeg  # Scatter plot of time in stop values
│   │   │   │   │   ├── Sum_of_People_Boarded_per_Stop.jpeg  # Sum of people boarded per stop plot
│   │   │   │   │   ├── Sum_of_People_Unboarded_Per_Stop.jpeg  # Sum of people unboarded per stop plot
│   │   │   │   │   ├── Total_Number_of_People_Boarded_vs_Unboarded.jpeg  # Total number of people boarded vs unboarded plot
│   │   │   │   │   └── Total_Time_per_Stop.jpeg  # Total time per stop plot
│   │   │   │   └── Metrhsh_Stash  # Folder for station measurement plots
│   │   │   │       ├── Average_Number_of_People_Boarded_vs_Unboarded.jpeg  # Average number of people boarded vs unboarded plot
│   │   │   │       ├── Average_People_Boarded_Per_Bus_Line.jpeg  # Average people boarded per bus line plot
│   │   │   │       ├── Average_People_Unboarded_per_Bus_Line.jpeg  # Average people unboarded per bus line plot
│   │   │   │       ├── Average_Speed_per_Bus_Line.jpeg  # Average speed per bus line plot
│   │   │   │       ├── Average_Time_per_Stop_per_Bus_Line.jpeg  # Average time per stop per bus line plot
│   │   │   │       ├── Box_Plot_of_People_Boarded_per_Line.jpeg  # Box plot of people boarded per line
│   │   │   │       ├── Box_Plot_of_People_Unboarded_per_Line.jpeg  # Box plot of people unboarded per line
│   │   │   │       ├── Bus_Count_per_Bus_Line.jpeg  # Bus count per bus line plot
│   │   │   │       ├── Bus_Count_per_Line_via_Tcycle.jpeg  # Bus count per line via Tcycle plot
│   │   │   │       ├── Bus_Lane.jpeg  # Bus lane plot
│   │   │   │       ├── Distribution_of_People_Boarded_and_Unboarded.jpeg  # Distribution of people boarded and unboarded plot
│   │   │   │       ├── Frequency_per_Bus_Line.jpeg  # Frequency per bus line plot
│   │   │   │       ├── Max_People_Boarded_Per_Bus_Line.jpeg  # Maximum people boarded per bus line plot
│   │   │   │       ├── Max_People_Unboarded_per_Bus_Line.jpeg  # Maximum people unboarded per bus line plot
│   │   │   │       ├── Max_Time_per_Stop_per_Bus_Line.jpeg  # Maximum time per stop per bus line plot
│   │   │   │       ├── Number_of_Buses.jpeg  # Number of buses plot
│   │   │   │       ├── Number_of_Skips_per_Bus_Line.jpeg  # Number of skips per bus line plot
│   │   │   │       ├── Parked_Car.jpeg  # Parked car plot
│   │   │   │       ├── People_Boarded_per_1_Minute_Intervals.jpeg  # People boarded per 1-minute intervals plot
│   │   │   │       ├── People_Unboarded_per_1_Minute_Intervals.jpeg  # People unboarded per 1-minute intervals plot
│   │   │   │       ├── Scatter_Plot_of_People_Boarded.jpeg  # Scatter plot of people boarded
│   │   │   │       ├── Scatter_Plot_of_People_Unboarded.jpeg  # Scatter plot of people unboarded
│   │   │   │       ├── Scatter_Plot_of_Time_Differences.jpeg  # Scatter plot of time differences
│   │   │   │       ├── Scatter_Plot_of_Time_in_Stop.jpeg  # Scatter plot of time in stop
│   │   │   │       ├── Sum_of_Absolute_Time_Difference_per_Bus_Line.jpeg  # Sum of absolute time difference per bus line plot
│   │   │   │       ├── Sum_of_People_Boarded_per_Bus_Line.jpeg  # Sum of people boarded per bus line plot
│   │   │   │       ├── Sum_of_People_Unboarded_per_Bus_Line.jpeg  # Sum of people unboarded per bus line plot
│   │   │   │       ├── Time_Distance_per_Bus_Line.jpeg  # Time distance per bus line plot
│   │   │   │       ├── Total_Cycle_Time_per_Bus_Line.jpeg  # Total cycle time per bus line plot
│   │   │   │       ├── Total_Distance_per_Bus_Line.jpeg  # Total distance per bus line plot
│   │   │   │       ├── Total_Number_of_People_Boarded_vs_Unboarded.jpeg  # Total number of people boarded vs unboarded plot
│   │   │   │       ├── Total_Time_Break_per_Bus_Line.jpeg  # Total time break per bus line plot
│   │   │   │       └── Total_Time_per_Stop_per_Bus_Line.jpeg  # Total time per stop per bus line plot
│   │   │   └── Interactive_Plots  # Folder for interactive plots
│   │   │       ├── Erwt_Leoforeio  # Folder for interactive bus-related plots
│   │   │       │   ├── Age_Answer_Frequency.html  # Interactive age frequency plot
│   │   │       │   ├── Anova_F_Values_Heatmap.html  # Interactive ANOVA heatmap
│   │   │       │   ├── Box_Plot_of_Variables.html  # Interactive box plot of variables
│   │   │       │   ├── Bus_Use_Frequency_Answer_Frequency.html  # Interactive bus usage frequency plot
│   │   │       │   ├── CV_for_Each_Score_Type.html  # Interactive coefficient of variation plot
│   │   │       │   ├── Chi_Square_Test_p_Values.html  # Interactive chi-square test p-values
│   │   │       │   ├── Cleanliness_Score_Answer_Frequency.html  # Interactive cleanliness score frequency plot
│   │   │       │   ├── Cleanliness_Score_Histogram_Mean_Median.html  # Interactive cleanliness score histogram
│   │   │       │   ├── Comfort_Score_Answer_Frequency.html  # Interactive comfort score frequency plot
│   │   │       │   ├── Comfort_Score_Histogram_Mean_Median.html  # Interactive comfort score histogram
│   │   │       │   ├── Density_of_Skewness.html  # Interactive skewness density plot
│   │   │       │   ├── Distance_to_Stop_Score_Answer_Frequency.html  # Interactive distance to stop score frequency plot
│   │   │       │   ├── Distance_to_Stop_Score_Histogram_Mean_Median.html  # Interactive distance to stop score histogram
│   │   │       │   ├── Gender_Answer_Frequency.html  # Interactive gender frequency plot
│   │   │       │   ├── Kurtosis_for_Each_Score_Type.html  # Interactive kurtosis plot
│   │   │       │   ├── Linear_Regression_Coefficients.html  # Interactive linear regression coefficients plot
│   │   │       │   ├── Logistic_Regression_Odds_Ratios.html  # Interactive logistic regression odds ratios plot
│   │   │       │   ├── Mean_Scores_for_Each_Variable.html  # Interactive mean scores for each variable plot
│   │   │       │   ├── Move_Reason_Answer_Frequency.html  # Interactive move reason frequency plot
│   │   │       │   ├── Overall_Score_Answer_Frequency.html  # Interactive overall score frequency plot
│   │   │       │   ├── Overall_Score_Histogram_Mean_Median.html  # Interactive overall score histogram
│   │   │       │   ├── Pearson_Corr_Matrix_Heatmap.html  # Interactive Pearson correlation matrix heatmap
│   │   │       │   ├── Percentiles_for_Each_Score_Type.html  # Interactive percentiles for each score type plot
│   │   │       │   ├── Range_and_Variance_for_Each_Score_Type.html  # Interactive range and variance for each score type plot
│   │   │       │   ├── Reliability_Score_Answer_Frequency.html  # Interactive reliability score frequency plot
│   │   │       │   ├── Reliability_Score_Histogram_Mean_Median.html  # Interactive reliability score histogram
│   │   │       │   ├── Residuals_vs_Fitted_QQ_Plot_of_Residuals.html  # Interactive residuals vs fitted and QQ plot of residuals
│   │   │       │   ├── Safety_Score_Answer_Frequency.html  # Interactive safety score frequency plot
│   │   │       │   ├── Safety_Score_Histogram_Mean_Median.html  # Interactive safety score histogram
│   │   │       │   ├── Scatter_Plot_of_Absolute_Difference_of_Overall_Mean_Score.html  # Interactive scatter plot of absolute differences in overall mean scores
│   │   │       │   ├── T_test_p_Values_by_Numerical_Variables_Gender_Comparison.html  # Interactive T-test p-values by numerical variables for gender comparison
│   │   │       │   ├── Ticket_Price_Score_Answer_Frequency.html  # Interactive ticket price score frequency plot
│   │   │       │   ├── Ticket_Price_Score_Histogram_Mean_Median.html  # Interactive ticket price score histogram
│   │   │       │   ├── Time_Waited_Score_Answer_Frequency.html  # Interactive time waited score frequency plot
│   │   │       │   └── Time_Waited_Score_Histogram_Mean_Median.html  # Interactive time waited score histogram
│   │   │       ├── Erwt_Mixed  # Folder for interactive mixed questionnaire plots
│   │   │       │   ├── Age_Distribution_Gialouris.html  # Interactive age distribution plot for Gialouris
│   │   │       │   ├── Age_Distribution_Pavlos.html  # Interactive age distribution plot for Pavlos
│   │   │       │   ├── Combined_Responses_Percentage.html  # Interactive combined responses percentage plot
│   │   │       │   ├── Gender_Distribution_Gialouris.html  # Interactive gender distribution plot for Gialouris
│   │   │       │   ├── Gender_Distribution_Pavlos.html  # Interactive gender distribution plot for Pavlos
│   │   │       │   ├── Move_Reason_Most_Answered.html  # Interactive most answered move reason plot
│   │   │       │   ├── Responses_Percentage.html  # Interactive responses percentage plot
│   │   │       │   ├── Scaled_Mean_Percentage_of_Scores.html  # Interactive scaled mean percentage of scores plot
│   │   │       │   └── Travel_Time_Stats.html  # Interactive travel time statistics plot
│   │   │       ├── Erwt_Stash  # Folder for interactive station-related plots
│   │   │       │   ├── Age_Answer_Frequency.html  # Interactive age frequency plot
│   │   │       │   ├── Anova_F_Values_Heatmap.html  # Interactive ANOVA heatmap
│   │   │       │   ├── Box_Plot_of_Variables.html  # Interactive box plot of variables
│   │   │       │   ├── Bus_Use_Frequency_Answer_Frequency.html  # Interactive bus usage frequency plot
│   │   │       │   ├── CV_for_Each_Score_Type.html  # Interactive coefficient of variation plot
│   │   │       │   ├── Chi_Square_Test_p_Values.html  # Interactive chi-square test p-values plot
│   │   │       │   ├── Cleanliness_Score_Answer_Frequency.html  # Interactive cleanliness score frequency plot
│   │   │       │   ├── Cleanliness_Score_Histogram_Mean_Median.html  # Interactive cleanliness score histogram with mean and median
│   │   │       │   ├── Comfort_Score_Answer_Frequency.html  # Interactive comfort score frequency plot
│   │   │       │   ├── Comfort_Score_Histogram_Mean_Median.html  # Interactive comfort score histogram with mean and median
│   │   │       │   ├── Density_of_Skewness.html  # Interactive skewness density plot
│   │   │       │   ├── Distance_to_Stop_Score_Answer_Frequency.html  # Interactive distance to stop score frequency plot
│   │   │       │   ├── Distance_to_Stop_Score_Histogram_Mean_Median.html  # Interactive distance to stop score histogram with mean and median
│   │   │       │   ├── Gender_Answer_Frequency.html  # Interactive gender frequency plot
│   │   │       │   ├── Kurtosis_for_Each_Score_Type.html  # Interactive kurtosis plot
│   │   │       │   ├── Linear_Regression_Coefficients.html  # Interactive linear regression coefficients plot
│   │   │       │   ├── Logistic_Regression_Odds_Ratios.html  # Interactive logistic regression odds ratios plot
│   │   │       │   ├── Mean_Scores_for_Each_Variable.html  # Interactive mean scores for each variable plot
│   │   │       │   ├── Move_Reason_Answer_Frequency.html  # Interactive move reason frequency plot
│   │   │       │   ├── Overall_Score_Answer_Frequency.html  # Interactive overall score frequency plot
│   │   │       │   ├── Overall_Score_Histogram_Mean_Median.html  # Interactive overall score histogram with mean and median
│   │   │       │   ├── Pearson_Corr_Matrix_Heatmap.html  # Interactive Pearson correlation matrix heatmap
│   │   │       │   ├── Percentiles_for_Each_Score_Type.html  # Interactive percentiles for each score type plot
│   │   │       │   ├── Range_and_Variance_for_Each_Score_Type.html  # Interactive range and variance for each score type plot
│   │   │       │   ├── Reliability_Score_Answer_Frequency.html  # Interactive reliability score frequency plot
│   │   │       │   ├── Reliability_Score_Histogram_Mean_Median.html  # Interactive reliability score histogram with mean and median
│   │   │       │   ├── Residuals_vs_Fitted_QQ_Plot_of_Residuals.html  # Interactive residuals vs fitted and QQ plot of residuals
│   │   │       │   ├── Safety_Score_Answer_Frequency.html  # Interactive safety score frequency plot
│   │   │       │   ├── Safety_Score_Histogram_Mean_Median.html  # Interactive safety score histogram with mean and median
│   │   │       │   ├── Scatter_Plot_of_Absolute_Difference_of_Overall_Mean_Score.html  # Interactive scatter plot of absolute differences in overall mean scores
│   │   │       │   ├── T_test_p_Values_by_Numerical_Variables_Gender_Comparison.html  # Interactive T-test p-values by numerical variables for gender comparison
│   │   │       │   ├── Ticket_Price_Score_Answer_Frequency.html  # Interactive ticket price score frequency plot
│   │   │       │   ├── Ticket_Price_Score_Histogram_Mean_Median.html  # Interactive ticket price score histogram with mean and median
│   │   │       │   ├── Time_Waited_Score_Answer_Frequency.html  # Interactive time waited score frequency plot
│   │   │       │   └── Time_Waited_Score_Histogram_Mean_Median.html  # Interactive time waited score histogram with mean and median
│   │   │       ├── Metrhsh_Leoforeio  # Folder for interactive bus measurement plots
│   │   │       │   ├── Average_Number_of_People_Boarded_vs_Unboarded.html  # Interactive average number of people boarded vs unboarded plot
│   │   │       │   ├── Average_People_Boarded_Per_Stop.html  # Interactive average people boarded per stop plot
│   │   │       │   ├── Average_People_Unboarded_per_Stop.html  # Interactive average people unboarded per stop plot
│   │   │       │   ├── Average_Time_per_Stop.html  # Interactive average time per stop plot
│   │   │       │   ├── Box_Plot_of_People_Boarded_Stop.html  # Interactive box plot of people boarded per stop
│   │   │       │   ├── Box_Plot_of_People_Unboarded_per_Stop.html  # Interactive box plot of people unboarded per stop
│   │   │       │   ├── Bus_Lane.html  # Interactive bus lane plot
│   │   │       │   ├── Distribution_of_People_Boarded_and_Unboarded.html  # Interactive distribution of people boarded and unboarded plot
│   │   │       │   ├── Histogram_of_Maximum_Absolute_Time_Difference_per_Stop.html  # Interactive histogram of maximum absolute time difference per stop
│   │   │       │   ├── Max_People_Boarded_Per_Stop.html  # Interactive maximum people boarded per stop plot
│   │   │       │   ├── Max_People_Unboarded_per_Stop.html  # Interactive maximum people unboarded per stop plot
│   │   │       │   ├── Max_Time_per_Stop.html  # Interactive maximum time per stop plot
│   │   │       │   ├── Number_of_Skips_per_Bus_Stop.html  # Interactive number of skips per bus stop plot
│   │   │       │   ├── Parked_Car.html  # Interactive parked car plot
│   │   │       │   ├── People_Boarded_per_1_Minute_Intervals.html  # Interactive people boarded per 1-minute intervals plot
│   │   │       │   ├── People_Unboarded_per_1_Minute_Intervals.html  # Interactive people unboarded per 1-minute intervals plot
│   │   │       │   ├── Scatter_Plot_of_People_Boarded.html  # Interactive scatter plot of people boarded
│   │   │       │   ├── Scatter_Plot_of_People_Unboarded.html  # Interactive scatter plot of people unboarded
│   │   │       │   ├── Scatter_Plot_of_Time_Differences.html  # Interactive scatter plot of time differences
│   │   │       │   ├── Scatter_Plot_of_Time_in_Stop_Values.html  # Interactive scatter plot of time in stop values
│   │   │       │   ├── Sum_of_People_Boarded_per_Stop.html  # Interactive sum of people boarded per stop plot
│   │   │       │   ├── Sum_of_People_Unboarded_per_Stop.html  # Interactive sum of people unboarded per stop plot
│   │   │       │   ├── Total_Number_of_People_Boarded_vs_Unboarded.html  # Interactive total number of people boarded vs unboarded plot
│   │   │       │   └── Total_Time_per_Stop.html  # Interactive total time per stop plot
│   │   │       └── Metrhsh_Stash  # Folder for interactive station measurement plots
│   │   │           ├── Average_Number_of_People_Boarded_vs_Unboarded.html  # Interactive average number of people boarded vs unboarded plot
│   │   │           ├── Average_People_Boarded_Per_Bus_Line.html  # Interactive average people boarded per bus line plot
│   │   │           ├── Average_People_Unboarded_per_Bus_Line.html  # Interactive average people unboarded per bus line plot
│   │   │           ├── Average_Speed_per_Bus_Line.html  # Interactive average speed per bus line plot
│   │   │           ├── Average_Time_per_Stop_per_Bus_Line.html  # Interactive average time per stop per bus line plot
│   │   │           ├── Box_Plot_of_People_Boarded_per_Line.html  # Interactive box plot of people boarded per line
│   │   │           ├── Box_Plot_of_People_Unboarded_per_Line.html  # Interactive box plot of people unboarded per line
│   │   │           ├── Bus_Count_per_Bus_Line.html  # Interactive bus count per bus line plot
│   │   │           ├── Bus_Count_per_Line_via_Tcycle.html  # Interactive bus count per line via Tcycle plot
│   │   │           ├── Bus_Lane.html  # Interactive bus lane plot
│   │   │           ├── Distribution_of_People_Boarded_and_Unboarded.html  # Interactive distribution of people boarded and unboarded plot
│   │   │           ├── Frequency_per_Bus_Line.html  # Interactive frequency per bus line plot
│   │   │           ├── Max_People_Boarded_Per_Bus_Line.html  # Interactive maximum people boarded per bus line plot
│   │   │           ├── Max_People_Unboarded_per_Bus_Line.html  # Interactive maximum people unboarded per bus line plot
│   │   │           ├── Max_Time_per_Stop_per_Bus_Line.html  # Interactive maximum time per stop per bus line plot
│   │   │           ├── Number_of_Buses.html  # Interactive number of buses plot
│   │   │           ├── Number_of_Skips_per_Bus_Line.html  # Interactive number of skips per bus line plot
│   │   │           ├── Parked_Car.html  # Interactive parked car plot
│   │   │           ├── People_Boarded_per_1_Minute_Intervals.html  # Interactive people boarded per 1-minute intervals plot
│   │   │           ├── People_Unboarded_per_1_Minute_Intervals.html  # Interactive people unboarded per 1-minute intervals plot
│   │   │           ├── Scatter_Plot_of_People_Boarded.html  # Interactive scatter plot of people boarded
│   │   │           ├── Scatter_Plot_of_People_Unboarded.html  # Interactive scatter plot of people unboarded
│   │   │           ├── Scatter_Plot_of_Time_Differences.html  # Interactive scatter plot of time differences
│   │   │           ├── Scatter_Plot_of_Time_in_Stop.html  # Interactive scatter plot of time in stop
│   │   │           ├── Sum_of_Absolute_Time_Difference_per_Bus_Line.html  # Interactive sum of absolute time difference per bus line plot
│   │   │           ├── Sum_of_People_Boarded_per_Bus_Line.html  # Interactive sum of people boarded per bus line plot
│   │   │           ├── Sum_of_People_Unboarded_per_Bus_Line.html  # Interactive sum of people unboarded per bus line plot
│   │   │           ├── Time_Distance_per_Bus_Line.html  # Interactive time distance per bus line plot
│   │   │           ├── Total_Cycle_Time_per_Bus_Line.html  # Interactive total cycle time per bus line plot
│   │   │           ├── Total_Distance_per_Bus_Line.html  # Interactive total distance per bus line plot
│   │   │           ├── Total_Number_of_People_Boarded_vs_Unboarded.html  # Interactive total number of people boarded vs unboarded plot
│   │   │           ├── Total_Time_Break_per_Bus_Line.html  # Interactive total time break per bus line plot
│   │   │           └── Total_Time_per_Stop_per_Bus_Line.html  # Interactive total time per stop per bus line plot
│   │   └── html_files  # Folder for HTML files
│   │       ├── Erwt_Leoforeio  # Folder for bus-related HTML files
│   │       │   ├── Datatable_Anova.html  # HTML file for ANOVA datatable
│   │       │   ├── Datatable_Chi_Squared.html  # HTML file for chi-squared datatable
│   │       │   ├── Datatable_Desc_Stats.html  # HTML file for descriptive statistics datatable
│   │       │   ├── Datatable_Frequencies.html  # HTML file for frequencies datatable
│   │       │   └── Datatable_T_test.html  # HTML file for T-test datatable
│   │       ├── Erwt_Stash  # Folder for station-related HTML files
│   │       │   ├── Datatable_Anova.html  # HTML file for ANOVA datatable
│   │       │   ├── Datatable_Chi_Squared.html  # HTML file for chi-squared datatable
│   │       │   ├── Datatable_Desc_Stats.html  # HTML file for descriptive statistics datatable
│   │       │   ├── Datatable_Frequencies.html  # HTML file for frequencies datatable
│   │       │   └── Datatable_T_test.html  # HTML file for T-test datatable
│   │       └── Stop_Visualization  # Folder for bus stop visualization HTML files
│   │           └── Bus_Stop_Heatmap.html  # HTML file for bus stop heatmap visualization
│   ├── Presentation  # Folder for presentation files
│   │   ├── Presentation_UTS.pdf  # PDF version of the presentation
│   │   └── Presentation_UTS.pptx  # PowerPoint version of the presentation
│   ├── Report  # Folder for report files
│   │   ├── Technical_Report_UTS.docx  # Word version of the technical report
│   │   └── Technical_Report_UTS.pdf  # PDF version of the technical report
│   └── WGS84  # Folder for geospatial data
│       └── φλ  # Folder for geospatial files
│           ├── DRAFT STASEIS DIADROMI.bak  # Backup file for bus stop draft
│           ├── DRAFT STASEIS DIADROMI.dwg  # Draft file for bus stop routes
│           ├── ΕΛΑ.txt  # Text file for geospatial data
│           ├── ΠΗΓΑΙΝΕ.txt  # Text file for geospatial data
│           ├── στασεις προς ΑΦ.txt  # Text file for bus stops towards AF
│           └── στασεις προς τερμα.txt  # Text file for bus stops towards terminal
├── LICENSE  # Project license file
├── README.md  # Project README file
├── docs  # Folder for documentation and additional files
│   ├── A_detailed_high-quality_background_image_of_a_mod.webp  # Background image for documentation
│   ├── Grammh_2  # Folder for line 2 documentation
│   │   ├── Erwt_Leoforeio  # Folder for bus-related documentation
│   │   │   ├── Datatables  # Folder for datatable documentation
│   │   │   │   ├── Datatable_Anova.html  # HTML file for ANOVA datatable
│   │   │   │   ├── Datatable_Chi_Squared.html  # HTML file for chi-squared datatable
│   │   │   │   ├── Datatable_Desc_Stats.html  # HTML file for descriptive statistics datatable
│   │   │   │   ├── Datatable_Frequencies.html  # HTML file for frequencies datatable
│   │   │   │   ├── Datatable_Image1.webp  # Image for datatable documentation
│   │   │   │   ├── Datatable_T_test.html  # HTML file for T-test datatable
│   │   │   │   └── index.html  # Index file for datatable documentation
│   │   │   ├── Interactive_Plots  # Folder for interactive plot documentation
│   │   │   │   ├── .gitignore  # Git ignore file for interactive plots
│   │   │   │   ├── Age_Answer_Frequency.html  # Interactive age frequency plot
│   │   │   │   ├── Anova_F_Values_Heatmap.html  # Interactive ANOVA heatmap
│   │   │   │   ├── Box_Plot_of_Variables.html  # Interactive box plot of variables
│   │   │   │   ├── Bus_Use_Frequency_Answer_Frequency.html  # Interactive bus usage frequency plot
│   │   │   │   ├── CV_for_Each_Score_Type.html  # Interactive coefficient of variation plot
│   │   │   │   ├── Chi_Square_Test_p_Values.html  # Interactive chi-square test p-values
│   │   │   │   ├── Cleanliness_Score_Answer_Frequency.html  # Interactive cleanliness score frequency plot
│   │   │   │   ├── Cleanliness_Score_Histogram_Mean_Median.html  # Interactive cleanliness score histogram
│   │   │   │   ├── Comfort_Score_Answer_Frequency.html  # Interactive comfort score frequency plot
│   │   │   │   ├── Comfort_Score_Histogram_Mean_Median.html  # Interactive comfort score histogram
│   │   │   │   ├── Density_of_Skewness.html  # Interactive skewness density plot
│   │   │   │   ├── Distance_to_Stop_Score_Answer_Frequency.html  # Interactive distance to stop score frequency plot
│   │   │   │   ├── Distance_to_Stop_Score_Histogram_Mean_Median.html  # Interactive distance to stop score histogram
│  │  │  │  ├─ Gender_Answer_Frequency.html  # Frequency distribution of gender responses  
│  │  │  │  ├─ Kurtosis_for_Each_Score_Type.html  # Kurtosis analysis for different score types  
│  │  │  │  ├─ Linear_Regression_Coefficients.html  # Coefficients from linear regression analysis  
│  │  │  │  ├─ Logistic_Regression_Odds_Ratios.html  # Odds ratios from logistic regression  
│  │  │  │  ├─ Mean_Scores_for_Each_Variable.html  # Mean values for each analyzed variable  
│  │  │  │  ├─ Move_Reason_Answer_Frequency.html  # Frequency distribution of reasons for moving  
│  │  │  │  ├─ Overall_Score_Answer_Frequency.html  # Frequency distribution of overall scores  
│  │  │  │  ├─ Overall_Score_Histogram_Mean_Median.html  # Histogram showing mean and median overall scores  
│  │  │  │  ├─ Pearson_Corr_Matrix_Heatmap.html  # Heatmap of Pearson correlation matrix  
│  │  │  │  ├─ Percentiles_for_Each_Score_Type.html  # Percentile distribution for each score type  
│  │  │  │  ├─ Range_and_Variance_for_Each_Score_Type.html  # Range and variance analysis for scores  
│  │  │  │  ├─ Reliability_Score_Answer_Frequency.html  # Frequency of reliability score responses  
│  │  │  │  ├─ Reliability_Score_Histogram_Mean_Median.html  # Histogram showing mean and median reliability scores  
│  │  │  │  ├─ Residuals_vs_Fitted_QQ_Plot_of_Residuals.html  # Residual analysis in regression models  
│  │  │  │  ├─ Safety_Score_Answer_Frequency.html  # Frequency of safety score responses  
│  │  │  │  ├─ Safety_Score_Histogram_Mean_Median.html  # Histogram showing mean and median safety scores  
│  │  │  │  ├─ Scatter_Plot_of_Absolute_Difference_of_Overall_Mean_Score.html  # Scatter plot showing score variations  
│  │  │  │  ├─ T_test_p_Values_by_Numerical_Variables_Gender_Comparison.html  # T-test p-values comparing gender-based numerical variables  
│  │  │  │  ├─ Ticket_Price_Score_Answer_Frequency.html  # Frequency of ticket price score responses  
│  │  │  │  ├─ Ticket_Price_Score_Histogram_Mean_Median.html  # Histogram showing mean and median ticket price scores  
│  │  │  │  ├─ Time_Waited_Score_Answer_Frequency.html  # Frequency of time-waited score responses  
│  │  │  │  ├─ Time_Waited_Score_Histogram_Mean_Median.html  # Histogram showing mean and median time-waited scores  
│  │  │  │  └─ index.html  # Index file for HTML reports  
│  │  ├─ Metrhsh_Stash  # Folder containing various measurement-related analyses  
│  │  │  ├─ Interactive_Plots  # Folder for interactive visualizations  
│  │  │  │  ├─ Average_Number_of_People_Boarded_vs_Unboarded.html  # Analysis of people boarding vs. unboarding per stop  
│  │  │  │  ├─ Average_People_Boarded_Per_Bus_Line.html  # Average boarded passengers per bus line  
│  │  │  │  ├─ Average_People_Unboarded_per_Bus_Line.html  # Average unboarded passengers per bus line  
│  │  │  │  ├─ Average_Speed_per_Bus_Line.html  # Average speed analysis for each bus line  
│  │  │  │  ├─ Average_Time_per_Stop_per_Bus_Line.html  # Average time spent at stops per bus line  
│  │  │  │  ├─ Box_Plot_of_People_Boarded_per_Line.html  # Box plot showing people boarded per bus line  
│  │  │  │  ├─ Box_Plot_of_People_Unboarded_per_Line.html  # Box plot showing people unboarded per bus line  
│  │  │  │  ├─ Bus_Count_per_Bus_Line.html  # Total bus count per bus line  
│  │  │  │  ├─ Bus_Count_per_Line_via_Tcycle.html  # Bus count per line analyzed via Tcycle  
│  │  │  │  ├─ Bus_Lane.html  # Analysis of bus lane efficiency  
│  │  │  │  ├─ Distribution_of_People_Boarded_and_Unboarded.html  # Distribution analysis of boardings/unboardings  
│  │  │  │  ├─ Frequency_per_Bus_Line.html  # Bus frequency per line  
│  │  │  │  ├─ Max_People_Boarded_Per_Bus_Line.html  # Maximum people boarded per bus line  
│  │  │  │  ├─ Max_People_Unboarded_per_Bus_Line.html  # Maximum people unboarded per bus line  
│  │  │  │  ├─ Max_Time_per_Stop_per_Bus_Line.html  # Maximum time spent at a stop per bus line  
│  │  │  │  ├─ Number_of_Buses.html  # Total number of buses in operation  
│  │  │  │  ├─ Number_of_Skips_per_Bus_Line.html  # Number of skipped stops per bus line  
│  │  │  │  ├─ Parked_Car.html  # Impact of parked cars on bus routes  
│  │  │  │  ├─ People_Boarded_per_1_Minute_Intervals.html  # Passenger boarding rates per minute  
│  │  │  │  ├─ Scatter_Plot_of_People_Boarded.html  # Scatter plot of boarded passengers  
│  │  │  │  ├─ Scatter_Plot_of_People_Unboarded.html  # Scatter plot of unboarded passengers  
│  │  │  │  ├─ Total_Distance_per_Bus_Line.html  # Total distance covered per bus line  
│  │  │  │  ├─ Total_Number_of_People_Boarded_vs_Unboarded.html  # Total passenger movement comparison  
│  │  │  │  └─ index.html  # Index for interactive visualizations  
│  │  ├─ Stop_Visualization  # Folder for bus stop visualizations  
│  │  │  ├─ Bus_Stop_Heatmap.html  # Heatmap showing bus stop activity  
│  │  │  ├─ Bus_Stop_Image.webp  # Image representation of bus stops  
│  │  │  └─ index.html  # Index file for bus stop visualizations  
└─ github_stuff  # Folder for GitHub-related configurations  
   └─ .gitattributes  # Git attributes file  

```

## How to Use the Repository

To get started with this project, follow the steps outlined below:

1. **Download the Repository**: You can download the repository by cloning it to your local machine. Use the following command to do so:

```bash
git clone https://github.com/PavlosGkougkoulis/Urban_Transport_Systems_Project.git
```

2. **Set Up the Environment**: Before running the analysis scripts, make sure you have the necessary libraries installed for both R and Python:

- **For R**: In RStudio, install the required packages using the following commands:

```R
install.packages("tidyverse")
install.packages("lubridate")
install.packages("ggplot2")
# Add any additional libraries required
```

3. **Run the Analysis**:

- **In R**: Open the relevant .R scripts in RStudio and run them to begin analyzing the data. You can modify the scripts to work with other datasets if needed.

4. **Access Data Visualizations**: The repository includes interactive plots and dashboards in the Interactive_Plots folder. Open the HTML files in any web browser to explore visualized data, such as bus schedules, passenger counts, and more.

5. **Contribute**: If you have suggestions, improvements, or additional analysis to contribute, feel free to fork the repository, make changes, and submit a pull request. Your contributions will help improve the project and further the goals of enhancing public transport services in Volos.

**Note:** For the main data analysis, download the relevant **plots**, **code**, **Technical Report**, and **Presentation** from the [Final_SAS_B_G_G_K](./Final_SAS_B_G_G_K/) folder.  
You can find the **code** [here](./Final_SAS_B_G_G_K/Data_Analysis/Code/) and the **plots** [here](./Final_SAS_B_G_G_K/Data_Analysis/Plots/).  


## Acknowledgments

- **ASTIKO KTEL Volou**: A special thank you to the management and staff of ASTIKO KTEL Volou for providing the data and support that made this analysis possible. Their collaboration has been crucial in ensuring the accuracy and relevance of the findings.

- **Contributors**: Thank you to the team members who have contributed to the development of this project. Their work in creating the analysis code, visualizations, and actionable recommendations has been fundamental to the success of this project.

## License  

This project is licensed under the [MIT License](LICENSE) - see the [LICENSE](LICENSE) file for details.
