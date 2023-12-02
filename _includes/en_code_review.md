## Code review

A maximum of two points can be awarded for the code review.

The purpose of this code review is to learn how to read another person's code, and how to interpret another developer's entire project.
A career in programming requires you to know how to read code fluently.
Unfortunately, reviewing code is not often covered in other courses.
A well-done code review is an efficient way to notice problems in your code and improve the code quality.

_Do not include the time spent on the code review in your time tracking sheet._

### Instructions

The start date of the review is {{site.en_code_review_start_date}}. You will get access to your partner's code on this date _at the latest_.

Your task is to read through another student's assignment and provide constructive feedback. You should also try to run the program.

- Download your partner's zipped project to your computer
  - Mark down the date and time when you downloaded the project
  - Unzip the project
  - Instead of downloading the zip from the releases, you can use the `git clone <link>` command to clone the repository to your computer directly

![](/assets/images/review1.png)

- Start by reading the project spec document
- Read as much of the code and tests as possible
  - Try to also run the tests
- Try to understand what each class and method does
  - **Be persistent: you won't always know what's going on, and this isn't expected of you!**
  - The most challenging part is probably the relationship between the classes. Try to read the class diagrams for help

Once you're familiar enough with the project you're reviewing, it's time to give your partner feedback on their code.
You do not need to comment about the documentation, appearance or the functionality of the program.
The most important thing is to pay attention to the good practices learned in Introduction to Programming and Advanced Course in Programming.
Also, make sure that the code satisfies the [code quality requirements](/en/tasks/quality) for this course.

### Feedback

The most important thing in the feedback is to tell the author how they can improve their code.
The more specific the feedback, the more valuable it is to your partner.
You can give tips on how things could be done differently or how you would have implemented something.
If you find evident bugs or code that does something unintentional, write about that, too.
You should examine the code carefully and provide specific suggestions for improvement.
**Please also include positive feedback!**

Feedback is provided as an issue on GitHub:

- Go to your partners' repository in your browser
- Open the _Issues_ tab
- Select _New Issue_ from the right-hand sidebar
- Put "Code Review" as a title
- Type your feedback in the comment box. You can and should use markdown here for clarity: use the Preview tab to see what it will look like
  - Above the comment box, there is a link to a useful Markdown reference
  - If you have specific code that you want to highlight, you can use Markdown's code blocks
  - The comment box also supports images
  - To be on the safe side, please copy your feedback to a text file on your computer
- **Include the date and time that you downloaded the project at the beginning of the feedback**
- Submit your feedback by selecting _Submit new issue_
- Finally, add a link to your feedback in Labtool

Your feedback is a public GitHub issue, and can be viewed by anyone. The TAs will read and grade your feedback as soon as possible after the deadline.

A score of 0-2 will be assigned for the code review.
A minimum of 6 high-quality and constructive feedback comments is sufficient for 1.5 points.
Full marks also require at least one usable suggestion for improvement.

Feedback can be written in whatever style you like, but try to write clearly.
Split feedback that belongs to different classes and methods into separate paragraphs.
If you write in bullet points, write complete sentences or preferably several sentences.
Do not attack the other person in your feedback!
Similarly, **don't take the feedback you receive personally** - your project is still in progress and can be edited.
Even the person giving feedback sometimes misunderstands or gives incorrect instructions.

**Note:** The project you are reviewing may change or be updated while you are writing feedback.
Therefore, the feedback should include the time the project was downloaded.
This means that you do not have to actively check whether your partner has updated their code: it is okay if your feedback is outdated after the author pushes some changes.
Similarly, remember that the feedback you receive may be for an older version that you have already changed.
