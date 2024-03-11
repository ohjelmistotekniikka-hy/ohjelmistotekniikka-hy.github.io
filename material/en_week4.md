---
layout: page
title: Week 4
permalink: /en/tasks/week4
---

{% include en_deadline_info.md deadline=site.en_wk4dl %}

This week, returning the practical work yields 3 points.

## Pylint and analysing your code quality statically

In addition to writing tests, taking care of your code quality is important.
This can be done manually by, for example, documenting quality requirements or via a code review.
However, for bigger projects, manual review is impractical.
Instead, we can use _static analysis_, where your code's quality is analysied automatically without running it.
Static analysis is widely used for quality assurance and for noticing mistakes in programs.
For Python code, the [pylint](https://www.pylint.org/) library is perhaps the most popular.
Using pylint, one can set up requirements for your code quality, and the program will check these automatically.

> Pylint is a tool that checks for errors in Python code, tries to enforce a coding standard and looks for code smells. It can also look for certain type errors, it can recommend suggestions about how particular blocks can be refactored and can offer you details about the code's complexity.

### Using pylint in your software

Pylint is very simple to use in a Poetry project.
We begin by installing it as a development dependency:

```
poetry add pylint --group dev
```

You then give pylint a set of [rules](http://pylint.pycqa.org/en/2.6/technical_reference/features.html) that it must follow.
The rules are defined in a `.pylintrc` file, which is located in the root of your project.
Create this file and copy the contents of [this](https://github.com/ohjelmistotekniikka-hy/ohjelmistotekniikka-hy.github.io/tree/master/materiaali/python/.pylintrc) file into it.
These contents differ slightly from the default ones, that you would get by running `pylint --generate-rcfile`.

To run the checks, open the poetry shell by running `poetry shell` in your terminal.
After this, you can run pylint's quality checks by running `pylint src`.
You must run this command in the root of your project (i.e., the same folder where `pyproject.toml` is located).
Pylint will output a score for your code.

```
Your code has been rated at 10.00/10 (previous run: 10.00/10, +0.00)
```

### Turning off quality checks

Generally, you should aim to fix the issues that pylint tells you about.
The vast majority of the time, this will result in better quality code.
Occasionally, though, we can accept the dips in code quality and turn off some checks.
There are multiple ways to do this.

Let's take the following `src/index.py` file as an example:

```python
x = 3
print(x)
```

Running `pylint src`, we notice that it complains about the following:

```
src/index.py:1:0: C0103: Constant name "x" doesn't conform to UPPER_CASE naming style (invalid-name)
```

Pylint thinks that in the `src/index.py` file, on line 1, the variable `x` should have been named `X` since it's a constant.
We could just fix the issue and be done with it, but if for whatever reason you do not want to do that, you can also add a comment after the line:

```python
x = 3 # pylint: disable=invalid-name
print(x)
```

Now, `pylint src` reads that you want to ignore the `invalid-name` error for that line and no longer complains.

You can also turn off linting for entire files and folders.
Try modifying [this row]({{site.repo_url}}/tree/master/material/.pylintrc#L13) in the `.pylintrc` file.
We can, for example, leave out the UI code located in `src/ui` and the tests under `src/tests` by adding the following:

```
ignore=CVS,ui,tests
```

**In your project, do not turn off linting for anything but UI features and tests!**

Fix all the issues that pylint notices in your project code.
There are very few cases where turning off linting is actually a good idea.

### Integrating pylint into VSCode

If you have [Visual Studio Code](https://code.visualstudio.com/) in use, you can simply check that the [Python](https://marketplace.visualstudio.com/items?itemName=ms-python.python) addon is installed. You may also need to install the Pylint addon.

![Visual Studio Code Python addon](https://ohjelmistotekniikka-hy.github.io/assets/images/python/vscode-python-lisaosa.png)

One the addons are installed, VSCode will tell you about pylint's detections automatically by underlining them in red.
By hovering your mouse over the problematic code, you can get some more information on the error:

![Visual Studio Code pylint](https://ohjelmistotekniikka-hy.github.io/assets/images/python/vscode-pylint.png)

If you encounter issues with this, take a look at VSCode's [linting instructions](https://code.visualstudio.com/docs/python/linting).

### Automatic formatting

The most popular style guide for python is [PEP 8](https://www.python.org/dev/peps/pep-0008/).
This guide tells you how to, for example, use whitespace, indentation, variable naming, line length, etc. to make your code look pretty.
While it is important that you follow these instructions, it is quite tedious to fix all of your code manually.
Thankfully, there is a module that will automate this process: [autopep8](https://pypi.org/project/autopep8/).

To install autopep8, run:

```bash
poetry add autopep8 --group dev
```

After this, launch the poetry shell and run the follwing in the `src` directory:

```bash
autopep8 --in-place --recursive src
```

You can also make an Invoke command for this, so that you can run autopep8 with the command `poetry run invoke format`.

In addition, you can do this with one button press directly in VSCode by following [these instructions](https://code.visualstudio.com/docs/editor/codebasics#_formatting).

### Common issues

- If pylint complains that `pygame has no X member`, you should open the `.pylintrc` file and change the row `extension-pkg-whitelist` to say `extension-pkg-whitelist=pygame`.

## Practical work

During this week, you will implement new functionality for your program, improve documentation, and pay attention to your code's quality using linting.

**There are 3 points on offer from this week's practical work submission.** You should also take a look at the [assessment criteria](https://ohjelmistotekniikka-hy.github.io/python/arvosteluperusteet) for your project, which will be used to give points to your final submission.

### Practical work 1: New functionality

Expand your project from last week (0.75p):

- You should be able to run your program using `poetry run invoke start`
- The program should be bigger than last week's version _and_ implement some more functionality that's in your spec document. That is, your program should include more functionality that's useful for the user.
- Mark the features that you have implemented as "done" in your spec document.

Implementation instructions can be found [here](/en/tasks/implementation).

### Practical work 2: Testing

Add more tests to the program (0.5p):

- You should be able to create a coverage report for your program using `poetry run invoke coverage-report`
- In the root folder of the project, there should be a `.coveragerc` file, which defines what files are included in the report. Any functionality related to UI and tests should be [excluded from coverage reporting](https://ohjelmistotekniikka-hy.github.io/python/viikko2#tiedostojen-j%C3%A4tt%C3%A4minen-raportin-ulkopuolelle)
- In your `src` folder (and all the folders under it, and all the folders under those...) there should be an empty `__init__.py` file, so that the test coverage report works.
- The branch coverage must be at least 20%
- The tests should test something relevant related to your functionality

### Practical work 3: Code quality

Pay attention to the following things related to code quality (1p):

- The program logic should be separate from the UI code
  - Find some hints [here](/en/tasks/implementation) and in the [reference project]({{site.python_reference_app_url}}/blob/master/dokumentaatio/arkkitehtuuri.md)
  - For example, the UI components and the program logic should be in separate files
- The program [structure](/en/tasks/quality) should be logical and be named properly
- Pylint should be in use
  - Use [this]({{site.repo_url}}/tree/master/materiaali/python/.pylintrc) `.pylintrc` file
  - You will get full points for this part if there are fewer than 10 pylint errors
  - You may leave out the UI and test files from linting
  - You may not use `pylint: disable` comments without a well-justified reason
  - You must be able to run the pylint tests using an Invoke command, `poetry run invoke lint`

### Practical work 4: Documentation

Create a class diagram or package diagram to describe your (preliminary) program structure (0.75p):

- Your diagram should just show the classes relevant to your program logic
- If you want, you may also include a [package structure](/en/tasks/week3) diagram
- You can find an example in the [reference project]({{site.python_reference_app_url}}/blob/master/dokumentaatio/arkkitehtuuri.md#sovelluslogiikka)
- Add a file called `arkkitehtuuri.md` under the `dokumentaatio` folder in your project, and insert the image into the file. The rest of the file can just be empty
- Include a link to the `arkkitehtuuri.md` file in the `README.md` file, similarly to how it's done in the [reference project]({{site.python_reference_app_url}}).

### Practical work 5: Changelog

{% include en_changelog_info.md %}

### Practical work 6: Point reductions

Forgetting to do the following things will result in **points being deducted**:

- The time tracking sheet is up-to-date
  - There must be a sum of total hours used
  - You should not include the time spent on the weekly exercises in weeks 1-3
- There is a changelog entry for this week in the `changelog.md` file
- The `README.md` file is professional
  - The file should have the same structure as the [reference project]({{site.python_reference_app_url}})'s `README.md` file, excluding the information that hasn't been covered or implemented yet
  - All extra information, such as links to the weekly exercises, have been removed
- The repository is clean
  - No extra trash (e.g. the output files of the `pytest` and `coverage` commands)
  - All weekly exercises are under `laskarit`
  - There is a reasonable `.gitignore` file

## Extra code review

There is going to be a code review on [week 6](/en/tasks/week6#code-review). The point is to give feedback on someone else's work.
This is useful for both the author of the code and the one reading it. If you want, you can already do a code review on weeks 4 and 5, if someone else agrees to give you their code to review. This is **completely optional and extra**, but you can get an extra course point for this (added to the points in week 5). 

**If you want to do a code review:**
  1. Go to the [Moodle page]({{site.moodle_link}}) and see if there are any projects under the "Ylimääräinen koodikatselmointi" section that are not yet reserved. If you can find one, write your name after it to reserve it. See what topics the author wants feedback on.
  2. Use the code review instructions to give your feedback as GitHub issues. For the extra code review, two high-quality and constructive comments and one improvement suggestion are enough. These should include comments on any questions that the code author may have asked. Instead of having "Code review" as a title, put "Extra code review" as a title.
  3. Go to your own project's `README.md` file and add a bolded line of text saying "Extra code review" and a link to your review at the bottom.

**If you want your code to be reviewed:**
  Go to the Moodle page and add a link to your repository under "Ylimääräinen koodikatselmointi".
  After the link, write a question or topic that you want feedback on from the reviewer.

{% include en_practical_work_works_info.md %}

{% include en_plagiarism.md %}
