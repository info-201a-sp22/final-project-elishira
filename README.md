# The Average American Teen Over the Years
## INFO 201 "Foundational Skills for Data Science" — Spring 2022

**Authors:**

Ken Oh, kenoh17@uw.edu

Elizabeth Shirakian, eshira@uw.edu

Wyatt Powell Steere, wyattps@uw.edu

J.R. Lim, jrlim@uw.edu

Link: https://eshira.shinyapps.io/final-project-elishira/

# Introduction

Our project is about high school students' behavior, such as drug use, sex, and other habits. We will be taking a closer look at the trend of these behaviors in students over the years, from 1991 to 2019. Some research questions are:

* What could be some causes for students' behavior to increase or decrease in certain areas?
* What could be the cause for people generally thinking teen behavior is getting worse?
* Should the behavior of teens continue to be monitored or studied?
* Is there a way to check that the sample is an accurate representation of all teens?
 
These questions are motivated mainly by the idea that teen behavior is getting worse. It's interesting to see that it actually isn't getting worse compared to 1991, and makes us wonder why. What changed between then and now, and how come so many people have the notion that teens are bad kids who do drugs and have bad habits? Even as teens ourselves, we thought most kids our age were doing drugs and having sex often. We're also wondering whether or not they should continue this study despite seeing that behavior is in fact, not getting worse. It's important to understand the reasons behind increase and decrease in bad behavior in order to help teens who currently face the same problems.

## Related Work
Given the relevance of this topic within today's society, several other researchers and organizations have conducted their own studies to determine whether today's youth population are adamantly better or worse than previous generations. Each survey considers different criteria, but there are overlapping basis points within them all, such as sexual activity, alcoholic consumption, and substance use. Vox journalists, Sarah Kliff, Soo Oh, and Sarah Frostenson, compiled the data from the given data by the CDC, along with other sources, and concluded that today's teens are more behaved than previous generations (Kliff, Oh, Frostenson, 2016). Richard Fisher of the BBC determined that teenagers today don't have to worry about physical and mental hardships that teenagers in the 20th Century had to worry about, specifically regarding the presence of war-time crises and encouragement of higher-education opportunities (Fisher, 2022). Lastly, a third article was posted by Diana Divecha of the Greater Good Magazine regarding her own beliefs on why teenagers today are more tame than their predecessors. She draws connections between the digital age of today's world to the poorer mental health states of today's teens, which diminishes their social lives, forcing them to stay inside, rather than physically socializing with others (Divecha, 2017). The link to the first article can be found here, second article here, and third here.

## The Dataset
We found this data on CDC's Youth Risk Behavior Surveillance System (YRBSS)'s page. The link to the data source can be found here: http://www.cdc.gov/healthyyouth/data/yrbs/data.htm

### Who collected the data?
This data was collected by the Youth Risk Behavior Surveillance System (YRBSS) via surveys conducted by the CDC as well local governments.

### How was the data collected or generated?

The national survey was conducted by the CDC. The local surveys were conducted by the departments of health and education in the associated state, territorial and freely associated state, or tribal government. These surveys are a representation of 9th to 12th graders attending public high school. Because of the massive size of the dataframe, we had to cut it down in order to work with it. We did this by working in excel with several features there such as the search and find / replace feature. We also used the VBA editor and several other options to delete every other row in the dataset to preserve the nature in which the data was collected. We also cut down the number of columns by deleting a few non helpful questions.

### Why was the data collected?

This data was collected to monitor health behaviors in high schoolers (9th to 12th grade) and monitor the main causes of death, disability and social problems among Americans in this age group.

### How many observations (rows) are in your data?

12924 observations (cut down from 148736)

### How many features (columns) are in the data?

99 features (cut down from 116)

### What, if any, ethical questions or questions of power do you need to consider when working with this data?

An ethical problem when considering this data has to do with the survey questions being asked to high schoolers. There are parents who would not be comfortable with questions like “Have you ever been physically forced to have sexual intercourse when you did not want to?” or “During the past 3 months, with how many people did you have sexual intercourse?” being asked to their 14-year-old children. There is an option for parents to opt their children out from taking this survey, but the YRBSS survey presents itself as “monitoring health behaviors that contribute to the leading causes of death, disability, and social problems among youth”, so parents may not be aware of the specific question (i.e. about drugs and sex) being asked to their children.

### What are possible limitations or problems with this data?

The main problem with this data is the accuracy. The surveys that this data is based on asks 14- to 19-year-olds about their drug use, tobacco use, drinking habits, sexual behaviors, dietary behaviors, etc. These are questions that many teenagers may feel uncomfortable giving their truthful answers to. Some may even feel the need to lie. Even if they are assured that their answers to the survey are anonymous, some teens, especially younger ones, may still believe that their parents will see their answers, causing them lie. This dishonesty will lead to discrepancies in the data. Additionally, teenagers who choose not to answer certain questions (i.e. regarding drug usage), will also lead to problems in the data since the outcome will seem like teenagers drink, use drugs, have sex, etc. less than they actually do. Additionally, the survey asks teens about other illegal activity that they could be jailed for (i.e. driving underage when drunk, or carrying a gun on school property). Students who have done these activities may feel uncomfortable with sharing their true answers. Another limitation with this specific dataset is that for some question, the majority of responses are blank, they are N/A values, like for the question “were you in a physical fight”. This lack of answers leads to bad data for these specific questions.


# Conclusion / Summary Takeaways

## Major Takeaways

Our main focus questions going into this project were:

- What could be some causes for students' behavior to increase or decrease in certain areas?
- What could be the cause for people generally thinking teen behavior is getting worse?
- Should the behavior of teens continue to be monitored or studied?
- Is there a way to check that the sample is an accurate representation of all teens?

After analyzing our datasets, we were able to solve our questions and came to these conclusions:

Shifts in teenagers' behaviors could be accredited to the varying presences of drugs, alcohol, and contraceptives in certain states, or the specific region that the survey is taken from. For starters, drugs and alcohol may be more readily accessible in rural areas through under-the-table exchanges compared to in the city. Due to this, the survey results in that specific area may widely contradict the results in another part of the same state.  

Without even looking at the data, we knew that there was an underlying belief that today's teenagers are generally less-behaved than teenagers from previous generations. The main reason for this is possibly rooted in the trends that have been depicted in the popular media in recent years. 

We believe that teens should still be regularly monitored because it provides health experts with benchmarks on how future generations compare to past ones acted. As seen in the data, today's teens are not as problematic compared to past generations, marking a downward shift in the data. This may change, though, as time goes on because the trends can shift upwards just as easily as they shifted downward.

To verify if the sample is an accurate representation of all teens, we would need to expand the sample size so that it accounts for more teenagers in more parts of each state. As it currently is presented, not every state participates in the survey which means that not every state's teenager is represented. Some of the notable states that aren't included are Washington, Oregon, Iowa, and Minnesota. Aside from this, not every part of the included states participate in the survey. A majority of the states only focus on the rural parts, while others primarily focus on the urban parts. An increase in sample size would need take place in order to confidently conclude that the sample is accurate representation of all teens. 

## Most Important Insight

As the title of the dataset suggested, today's teens are alright. While continuing to monitor them does no harm, today's older generations should be less worried about the future of the world because our teenagers are more behaved than how they acted years ago. To give a few numbers, today's teenager compared to the average teenager born in the 1990's, is 15% less likely to have ever tried alcohol and roughly only 11% have smoked, compared to 23% back then. 43% fewer teenage girls are also having children. These figures go to show that people should not worry about regulating teenage behavior because they are already regulating it themselves. 

