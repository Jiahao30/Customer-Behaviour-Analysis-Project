# Customer Behaviour Analysis Project

![Tableau](https://img.shields.io/badge/Tableau-E97627?style=for-the-badge&logo=Tableau&logoColor=white)
![MySQL](https://img.shields.io/badge/MySQL-005C84?style=for-the-badge&logo=mysql&logoColor=white)
![Microsoft Excel](https://img.shields.io/badge/Microsoft_Excel-217346?style=for-the-badge&logo=microsoft-excel&logoColor=white)
![Microsoft Word](https://img.shields.io/badge/Microsoft_Word-2B579A?style=for-the-badge&logo=microsoft-word&logoColor=white)
![Microsoft PowerPoint](https://img.shields.io/badge/Microsoft_PowerPoint-B7472A?style=for-the-badge&logo=microsoft-powerpoint&logoColor=white)
![GitHub](https://img.shields.io/badge/github-%23121011.svg?style=for-the-badge&logo=github&logoColor=white)

## Project Overview
The Customer Behaviour Analysis Project aims to build an insightful dashboard that provides a comprehensive overview of user engagement and learning patterns on the 365 Careers platform. The dashboard enables tracking of student engagement, learning trends, exam performance, and certification issuance over time, offering actionable insights that can guide strategic decision-making to improve user experience and educational outcomes on the platform.

## Project Structure
    ├── LICENSE
    ├── README.md                      <- README.
    ├── Importing data                 <- Code of the DB creation and queries.
    │   │
    │   ├── customer_engagement.sql    <- DB creation.
    │   └── customer_behaviour.xlsx    <- Data Dictionary and Relevant Terminology.
    │ 
    ├── dashboard_query                <- Queries to transform databases for dashboards .
    │   
    ├── dashboard_data_sources         <- Data source for creating dashboard.
    │   
    └── dashboard                      <- Final Dashboard.

### Problem Description
To better understand and analyse user behaviour on the 365 Careers platform, we need to create a comprehensive Customer Behaviour Analysis Report. This report aims to provide insights into key engagement and learning metrics, as well as their changes over time. The report will assist in making data-driven decisions, tracking student engagement and learning patterns, and identifying trends that could inform strategies to improve user retention and learning outcomes on the platform.

### Dataset Information
The dataset used in for this project contains comprehensive information about the students of 365 career platform and the database is obtained from `customer_engagement.sql`. After extracting and transforming the datasets there are 12 datasets containing over 245,000 rows as shown in the folder `dashboard_data_sources`. The specific data dictionary and related terminology are shown in `customer_behaviour.xlsx`.

### Project Workflow
**1. Data Collection:**
- **Steps:** Gather all relevant student data from the `customer_engagement.sql`. Extract data and save it in a structured format for analysis.
- **Tools:** Microsoft Excel, MySQL.

**2. Data Preprocessing:**
- **Steps:**
  - **Data Cleaning:** Handle missing values, correct inconsistencies, and remove duplicates.
  - **Data Transformation:** Based on the problem to be solved, extract the required data from the original database using the SQL query and collate it into the corresponding dataset, as shown in `dashboard_query`.
  - **Normalisation:** Standardise numerical values to ensure consistency across the dataset.
- **Tools:** MySQL.

**3. Exploratory Data Analysis (EDA)**
- **Steps:**
  - **Summarise:** Gain initial insights and understand data distributions and relationships.
  - **Visualisation:** Explore data visualisations and sketch for dashboards.
- **Tools:** Microsoft Excel, MySQL.

**4. Data Visualisation**
- **Preview:** [Tableau Public](https://public.tableau.com/app/profile/jiahao.shao/viz/CustomerBehaviourAnalysis_17277486130610/Overview)
- **Steps:** Create interactive dashboards to visualise customer behaviour data and trends.
  - **1. Overview Dashboard:**
  - This dashboard provides a snapshot of platform engagement, showing key metrics like:
    - **Engaged Students**, **Minutes per Student**, and **Certificates Issued**.
    - A **bar chart** visualises course performance (top/bottom five courses), and a **donut chart** shows the average course rating.
    - Filters for student status (free/paid) and date range.
  - **2. Engagement and Onboarding Dashboard:**
  - This dashboard tracks:
    - **Daily engagement trends** via a line chart with filters for free/paid students.
    - **Onboarding rates** over time, shown as a line chart by registration date.
    - Time period selection and granularity filters (custom, monthly, yearly).
  - **3. Cohort Engagement Dashboard:**
  - This dashboard examines **student retention**:
    - A **cohort analysis table** tracks retention over time.
    - A **retention curve** visualises engagement drop-off across cohorts.
    - Includes filters for student type and color-coded legends.
  - **4. Exams and Certificates Dashboard:**
  - This dashboard analyses exam and certification activity:
    - A **horizontal bar chart** shows monthly exam pass/fail rates.
    - A **vertical bar chart** displays the number of certificates issued by month.
    - A **funnel chart** tracks student progress from course enrollment to certification.
  - **5. Student Learning Dashboard:**
  - This dashboard explores learning engagement:
    - A **combo chart** shows total and average minutes watched per month.
    - Two **combo charts** track **conversion rates** and **subscription durations**, filtering between free and paid students.

**5. Interpretation and Reporting**
- **Steps:**
  - **Insight Generation:** Interpret visualisations to identify trends and patterns.
  - **Report Creation:** Compile a report outlining key findings, insights, and recommendations.
- **Tools:** Microsoft Word, Microsoft PowerPoint.

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) for details.

## Acknowledgements
This project is an adaptation of the concepts and methodologies taught by [365 Careers](https://www.udemy.com/user/365careers/) on Udemy. Special thanks for their guidance and instructional videos.

### Original Tutorial
[Customer Behavior Analysis with SQL and Tableau](https://www.udemy.com/course/customer-behavior-analysis-with-sql-and-tableau/)

### Disclaimer
Please note that this project is an adaptation of the concepts and methodologies taught by 365 Careers. Any code, data, or content not directly from 365 Careers is original work created for this project and is covered under the MIT License.

## Contact Me!
For any questions or feedback regarding this project, feel free to reach out:
- Email: jiahao.shao30@gmail.com
- LinkedIn: <b>[Jasper Shao](https://www.linkedin.com/in/jasper-shao/)</b>
- GitHub: <b>[Jasper Shao](https://github.com/Jiahao30)</b>







