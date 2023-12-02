---
layout: page
title: Week 5
permalink: /en/tasks/week5
---

{% include en_deadline_info.md deadline=site.en_wk5dl %}

This week, you get 3 points for returning the practical work.

## GitHub release

One way to publish your program is by creating a _release_ in GitHub.
To do this:

- Click on "Releases", which is on your repository's GitHub page
- Select _Create a new release_
- Input any relevant information
  - Put the current week as the tag. For example, for this week's (week 5) submission, your tag should be `viikko5`.
- If installing or running your code requires some extra steps (for example, placing a file somewhere or running a certain command), you can add them here. The instructions must also be in your README.
- When creating a release, GitHub will automatically zip the currently pushed source code and attach it to the release.

![Release](/assets/images/python/release.png)

Now, anyone can download your code easily by going to your GitHub repository, clicking on "1 release", and selecting the zip file. Make sure that a user that downloads your code from the releases tab and follows the instructions in the README can launch your program without any problems.

## Allowing issues in GitHub

Make sure that issues are enabled in your repository.
That is, your repository settings page should look like this:

![](/assets/images/issuet.png)

Issues are ways for yourself or others to comment on your project.
They were originally intended to report issues with a repository's code, but are also commonly used for to-do lists, feedback, bug reports, and so on.

## Practical work

This week, you will implement new functionality to the program and improve its documentation.

**There are 3 points available for this submission.** You should also take a look at the [grading criteria](/en/tasks/criteria).

### Practical work 1: GitHub release

Make a GitHub release for your project using the above instructions (0.25p).

- The release should have the latest version of your code (so, do this after you have committed all of your project changes for the week)
- There is a link to the release in the README.

### Practical work 2: Preparing for the code review

Next week, there will be a code review session, which is worth 2 course points.
So that you can participate, the following things must be in order:

- After this week's deadline, there must be a working version of your code in your repository, and it should implement at least a part of the functionality described in your spec document
- You must get more than 0 points from this week's submission
- You must have GitHub issues enabled. See the above instructions for details.

### Practical work 3: New functionality

Expand your project from last week (0.75p):

- You should be able to run your program using `poetry run invoke start`
- The program should be bigger than last week's version _and_ implement some more functionality that's in your spec document. That is, your program should include more functionality that's useful for the user.
- Mark the features that you have implemented as "done" in your spec document.

Implementation instructions can be found [here](/en/tasks/implementation).

### Practical work 4: Tests

Expand the tests (0.5p):

- You must be able to generate a coverage report for your code using `poetry run invoke coverage-report`
- There must be a `.coveragerc` file in your project's root directory, which defines which directories are included in the report. You must leave out the UI and tests from the coverage report.
- Remember to include an empty `__init__.py` file in each subdirectory under `src`
- The branch coverage must be at least 40%
- The tests should test something relevant to the functionality of your program

### Practical work 5: Code quality

Pay attention to the following (1p):

- The program logic is separate from the UI
  - Hints [here](/en/tasks/implementation) and in the [reference project]({{site.python_reference_app_url}}/blob/master/dokumentaatio/arkkitehtuuri.md)
- The code must reflect the logical structure of your program and proper naming should be used 
- There are less than 5 pylint errors

### Practical work 6: Documentation

Add a sequence diagram for at least one relevant functionality (0.5p):

- You can see an example in [the reference project]({{site.python_reference_app_url}}/blob/master/dokumentaatio/arkkitehtuuri.md#p%C3%A4%C3%A4toiminnallisuudet)
- Add the diagram to `arkkitehtuuri.md`
- There must be a link to `arkkitehtuuri.md` in the README.

### Practical work 7: Changelog

{% include en_changelog_info.md %}

### Practical work 8: Point reductions

Forgetting to do the following things will result in **points being deducted**:

- Code quality
  - The structure makes sense (e.g. having all of the code under the same directory)
  - The program logic is separate from the UI
- The time tracking sheet is up-to-date
  - **You must sum up your hours and mark the total in your file**
  - Do not include the time spent on weekly exercises (before week 4)
- There is a changelog entry under `changelog.md`
- GitHub issues are enabled
- The `README.md` file is proper
  - The file must have the same structure as that in the reference project, i.e.:
    - Short description of your project
    - Links to the spec document, architecture document and time tracking sheet
    - Link to your release
    - Instructions on how to run your project (running your code, running tests, generating coverage report, linting)
- The repository is clean
  - No extra garbage (e.g. output from the `pytest` or `coverage` commands)
  - Weekly exercises must be under `laskarit`
  - There is a relevant `.gitignore`

{% include en_practical_work_works_info.md %}

{% include en_plagiarism.md %}
