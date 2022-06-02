## The Average American Teen Over the Years

### Authors

Ken Oh, kenoh17@uw.edu   
Elizabeth Shirakian, eshira@uw.edu   
Wyatt Powell Steere, wyattps@uw.edu   
J.R. Lim, jrlim@uw.edu

### Date

Spring 2022

!["high school students"](https://constructionexec.com/assets/site_18/images/article/110619032504.jpg?width=1280)


### Abstract

Our main question is "how has the behavior and overall life of the average American teenager changed over time?" To address this question, we will use the data provided by the Youth Risk Behavior Surveillance System (YRBSS). This question is important because it can be used to discover the various trends in the modern-day teenager. The trends that are found can be addressed and and used to improve the overall life of the average American teen.

### Keywords

Keywords: Health risks; American youth; high school; behavior

### Introduction  

Our project is about high school students' behavior, such as drug use, sex, and other habits. We will be taking a closer look at the trend of these behaviors in students over the years, from 1991 to 2019. Some research questions are:

- What could be some causes for students' behavior to increase or decrease in certain areas?
- What could be the cause for people generally thinking teen behavior is getting worse?
- Should the behavior of teens continue to be monitored or studied?
- Is there a way to check that the sample is an accurate representation of all teens?

These questions are motivated mainly by the idea that teen behavior is getting worse. It's interesting to see that it actually isn't getting worse compared to 1991, and makes us wonder why. What changed between then and now, and how come so many people have the notion that teens are bad kids who do drugs and have bad habits? Even as teens ourselves, we thought most kids our age were doing drugs and having sex often. We're also wondering whether or not they should continue this study despite seeing that behavior is in fact, not getting worse. It's important to understand the reasons behind increase and decrease in bad behavior in order to help teens who currently face the same problems.

### Related Work  

Given the relevance of this topic within today's society, several other researchers and organizations have conducted their own studies to determine whether today's youth population are adamantly better or worse than previous generations. Each survey considers different criteria, but there are overlapping basis points within them all, such as sexual activity, alcoholic consumption, and substance use. *Vox* journalists, Sarah Kliff, Soo Oh, and Sarah Frostenson, compiled the data from the given data by the CDC, along with other sources, and concluded that today's teens are more behaved than previous generations (Kliff, Oh, Frostenson, 2016). Richard Fisher of the *BBC* determined that teenagers today don't have to worry about physical and mental hardships that teenagers in the 20th Century had to worry about, specifically regarding the presence of war-time crises and encouragement of higher-education opportunities (Fisher, 2022). Lastly, a third article was posted by Diana Divecha of the *Greater Good Magazine* regarding her own beliefs on why teenagers today are more tame than their predecessors. She draws connections between the digital age of today's world to the poorer mental health states of today's teens, which diminishes their social lives, forcing them to stay inside, rather than physically socializing with others (Divecha, 2017). The link to the first article can be found [here](https://www.vox.com/a/teens), second article [here](https://www.bbc.com/future/article/20220124-why-teens-arent-what-they-used-to-be), and third [here](https://greatergood.berkeley.edu/article/item/how_teens_today_are_different_from_past_generations).

### The Dataset

> Where did you find the data? Please include a link to the data source  

We found this data on CDC's Youth Risk Behavior Surveillance System (YRBSS)'s page. The link to the data source can be found here: http://www.cdc.gov/healthyyouth/data/yrbs/data.htm

> Who collected the data?  

This data was collected by the Youth Risk Behavior Surveillance System (YRBSS) via surveys conducted by the CDC as well local governments.

> How was the data collected or generated?  

The national survey was conducted by the CDC. The local surveys were conducted by the departments of health and education in the associated state, territorial and freely associated state, or tribal government. These surveys are a representation of 9th to 12th graders attending public high school. Because of the massive size of the dataframe, we had to cut it down in order to work with it. We did this by working in excel with several features there such as the search and find / replace feature. We also used the VBA editor and several other options to delete every other row in the dataset to preserve the nature in which the data was collected. We also cut down the number of columns by deleting a few non helpful questions.

> Why was the data collected?  

This data was collected to monitor health behaviors in high schoolers (9th to 12th grade) and monitor the main causes of death, disability and social problems among Americans in this age group.

> How many observations (rows) are in your data?  

12924 observations (cut down from 148736)

> How many features (columns) are in the data?  

99 features (cut down from 116)

> What, if any, ethical questions or questions of power do you need to consider when working with this data?  

An ethical problem when considering this data has to do with the survey questions being asked to high schoolers. There are parents who would not be comfortable with questions like “Have you ever been physically forced to have sexual intercourse when you did not want to?” or “During the past 3 months, with how many people did you have sexual intercourse?” being asked to their 14-year-old children. There is an option for parents to opt their children out from taking this survey, but the YRBSS survey presents itself as “monitoring health behaviors that contribute to the leading causes of death, disability, and social problems among youth”, so parents may not be aware of the specific question (i.e. about drugs and sex) being asked to their children.

> What are possible limitations or problems with this data?

The main problem with this data is the accuracy. The surveys that this data is based on asks 14- to 19-year-olds about their drug use, tobacco use, drinking habits, sexual behaviors, dietary behaviors, etc. These are questions that many teenagers may feel uncomfortable giving their truthful answers to. Some may even feel the need to lie. Even if they are assured that their answers to the survey are anonymous, some teens, especially younger ones, may still believe that their parents will see their answers, causing them lie. This dishonesty will lead to discrepancies in the data. Additionally, teenagers who choose not to answer certain questions (i.e. regarding drug usage), will also lead to problems in the data since the outcome will seem like teenagers drink, use drugs, have sex, etc. less than they actually do. Additionally, the survey asks teens about other illegal activity that they could be jailed for (i.e. driving underage when drunk, or carrying a gun on school property). Students who have done these activities may feel uncomfortable with sharing their true answers. Another limitation with this specific dataset is that for some question, the majority of responses are blank, they are N/A values, like for the question “were you in a physical fight”. This lack of answers leads to bad data for these specific questions.


### Implications

The possible implication for studying the changing health habits of the average American teen is that after studying the trends, policymakers may create resources to help teens with certain issue. The dataset we are working with includes the demographics of the teens taking the survey, so policymakers will be able to view the analysis of the data and create policies and programs to help the youth under their jurisdiction. This project may also prompt technologists to help American youth. Technologists can take our study of the data and depending on the results, find ways to promote better health habits in American teens by, for example, promoting anti-vaping ads on high scholars’ technological devices. Designers can also use our study of the data provided by the YRBSS. Designers may be able to create and design info graphics or sites for teenagers, promoting better health habits and life choices.


### Limitations & Challenges

While there are many that could arise within the data collection process, the most significant one could be the underrepresentation of certain groups within the American youth population. According to the dataset's overview, only about 10,000 high school students are surveyed every other year in this nationwide survey. This amount is far from the full amount of public high school students within the given year which possibly creates unexpected biases in the results. There could be possible student populations that actually reverse the narratives set by the data, showing that today's teenage population are actually less-behaved, to an extent, than previous generations. Also relating to the underrepresentation issue, another challenge that we would need to address is the absence of non-high school attending teenagers within the surveyed populations. This missing group of teenagers may possibly sway the results one way or another, but continue to be "strangers in the dataset." As a group, we need to keep this limitations in mind when working with the data because we cannot use the results as a complete basis for the behavior of teenagers today. Without these limitations accounted for, the results cannot be completely trusted.
