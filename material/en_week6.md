---
layout: page
title: Week 6
permalink: /en/tasks/week6
---

{% include en_deadline_info.md deadline=site.en_wk6dl %}

This week, you can get 3 points from the practical work and 2 points for the code review.

**⚠️ During this week there will be a [code review](#code-review), which starts on {{site.en_code_review_start_date}}.**

## Docstrings and documentation

> “Code is more often read than written.”
> — [Guido van Rossum](https://fi.wikipedia.org/wiki/Guido_van_Rossum)

When you're going full steam ahead, programming a fancy new project, you may often think that once you've written a piece of code, you'll never have to return to it again.
In reality, a piece of code can live in a project for many years, during which you and other developers will have to read and improve on the code you've written.
It may take a very long time to undertsand some code, especially if it's messy!
Clean code is a good start, but having relevant documentation is just as important.

### Documentation using comments

Comments are very useful and are universally accepted.
However, code comments have to be relevant to not "stink up" your project with irrelevant commentary.
Here is an example of what **not** to do:

```python
class Machine:
    def __init__():
        self._tank = FuelTank()
        # fill tank with 40 units
        self._tank.fill(40)
        self._engine = Engine(self._tank)

    def drive(self):
        self._egine.start()
        # check if engine is running
        running = self._engine.engine_is_running()

        # if engine is running, use energy
        if running:
          self._engine.use_energy()
```

A comment should never explain what a single line of code is doing: that should be evident from your variable names.
Instead, comments should tell you what an individual module, class, or method/function does on a logical level and what kind of interface it has (that is, what arguments it takes in and what it returns).
These types of useful comments are called [docstrings](https://www.python.org/dev/peps/pep-0257/) in the Python world.
There are many different formats for dosctrsings, but in this course we will be using the [Google format](https://google.github.io/styleguide/pyguide.html#38-comments-and-docstrings).

Let's see how this works with our favourite `PaymentCard` class:

```python
class PaymentCard:
    """Class that keeps track of the balance on a card

    Attributes:
        balance: The starting balance on the card.
    """

    def __init__(self, balance):
        """Constructor, which creates a new payment card.

        Args:
            balance: The initial balance on the card.
        """

        self.balance = balance

    def add_money(self, amount):
        """Increases the money on the card by the specified amount

        Args:
            amount: The amount of money to be added.
        """

        self.balance += amount

    def take_money(self, amount):
        """Decreases the money on the card by the specified amount

        If the card does not have enough money, the balance is left unchanged.

        Args:
            amount: The sum to take from the card.

        Returns:
            True, if the card had enough money, otherwise False.
        """

        if self.balance < amount:
            return False

        self.balance = self.balance - amount
        return True

    def __str__(self):
        """Creates a text representation of the card.

        Returns:
            String, that tells the balance on the card in euros.
        """

        balance_euros = round(self.balance / 100, 2)

        return f"Balance: {balance_euros}"
```

Documentation is always done on the line right after the definition of a class, method, or function.
Documentation always starts and ends with the `"""` signs.
The first lines cover a general overview of the functionality.
With classes, then come the attributes (what variables the class has), which are under a `Attributes` section.
Attributes are written in the format `attribute_name: Attribute description`.
Methods and functions are documented in exactly the same way, except instead of attributes you have arguments (variables passed into the function).
These are documented under an `Args` section instead of an `Attributes` section.
Return values from functions and methods go uner a `Returns` section.
Note the capitalisation and indentation in the example!

If you are using VSCode, you can install the [Python Docstring Generator](https://marketplace.visualstudio.com/items?itemName=njpwerner.autodocstring) extension.
This will automatically generate a docstring template for you when you type `"""` and press TAB after a function or class definition.

{% include en_code_review.md %}

## Practical work

Remember that the end of the course is approaching, and so is the final submission deadline.
You should take some time to review the [grading criteria](/en/tasks/criteria).
During the last week, you will have time to develop your program, but you should also leave plenty of time for documentation.

This week, you will further expand your project and improve its documentation.

**There are 3 points on offer this week for the practical work.** Remember that, in addition to your weekly points, you will get points for your final submission based on the [criteria](/en/tasks/criteria).

### Practical work 1: New functionality

Expand your project from last week (0.75p):

- You should be able to run your program using `poetry run invoke start`
- The program should be bigger than last week's version _and_ implement some more functionality that's in your spec document. That is, your program should include more functionality that's useful for the user.
- Mark the features that you have implemented as "done" in your spec document.
- After you are done, create a release in GitHub again.

Implementation instructions can be found [here](/en/tasks/implementation).

### Practical work 2: Tests

Expand the tests (0.5p):

- You must be able to generate a coverage report for your code using `poetry run invoke coverage-report`
- There must be a `.coveragerc` file in your project's root directory, which defines which directories are included in the report. You must leave out the UI and tests from the coverage report.
- Remember to include an empty `__init__.py` file in each subdirectory under `src`
- The branch coverage must be at least 60%
- The tests should test something relevant to the functionality of your program

### Practical work 3: Code quality

Pay attention to the following (0.5p):

- The program should not have lots of copy-pasting or repetition in it
- The program structure is reasonable
  - Classes, methods, and functions should follow the [single responsibility principle](https://en.wikipedia.org/wiki/Single-responsibility_principle), i.e. one component cannot do too many things
  - Classes, methods, and functions that are too big should be split into bits
- Keep in mind the usual [code quality requirements](/en/tasks/quality) 

### Practical work 4: Documentation

Begin writing docstring documentation for your project (0.5p):

- To get the points, at least half of your classes, methods, and functions have docstrings
- Tests do not need docstrings

Create a preliminary architecture description (0.5p):

- The document should contain a high-level overview (e.g. what file does what) of your program structure and program logic
- You may use the previous weeks' class and sequence diagrams
- You may take inspiration from the [reference project]({{site.python_reference_app_url}}/blob/master/dokumentaatio/arkkitehtuuri.md#sovelluslogiikka)
- A good length for this week is 1-2 pages of text and diagrams

Create preliminary usage instructions (0.25p):

- The instructions can assume that the code will be run by hand, so you do not yet need to include installation/configuration instructions
- A good length for this is about one page
- You may once again take inspiration from the [reference project]({{site.python_reference_app_url}}/blob/master/dokumentaatio/kayttoohje.md)

### Practical work 5: Changelog

{% include en_changelog_info.md %}

### Practical work 6: Point reductions

Forgetting to do the following things will result in **points being deducted**:

- Code quality
  - The structure makes sense (e.g. having all of the code under the same directory)
  - The program logic is separate from the UI
  - Pylint is in use
    - There are less than 5 pylint errors
    - UI and test code can be left out of linting
- The time tracking sheet is up-to-date
  - **You must sum up your hours and mark the total in your file**
  - Do not include the time spent on weekly exercises (before week 4)
- There is a changelog entry under `changelog.md`
- The `README.md` file is proper
  - The file must have the same structure as that in the reference project, i.e.:
    - Short description of your project
    - Links to the spec document, architecture document, user instructions, and time tracking sheet
    - Link to your releases
    - Instructions on how to run your project (running your code, running tests, generating coverage report, linting)
- The repository is clean
  - No extra garbage (e.g. output from the `pytest` or `coverage` commands)
  - Weekly exercises must be under `laskarit`
  - There is a relevant `.gitignore`
- Docstring documentation has been started

{% include en_practical_work_works_info.md %}

{% include en_plagiarism.md %}
