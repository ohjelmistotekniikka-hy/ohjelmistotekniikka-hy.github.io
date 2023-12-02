---
layout: page
permalink: /en/tasks/criteria
title: Grading criteria and course completion
---

There are a total of 60 points available during the course.
These are awarded as follows:

- Weekly submissions 16p
- Code review 2p
- Documentation 13p
  - Specification
  - Architecture
  - Usage and installation instructions
  - Test document
  - Docstring documentation
  - Explanation as to your use of ChatGPT and other AI tools
- Testing 5p
  - Tests
- Final submission 24p
  - Functionality
  - Code quality

In addition, a bonus point is available for submitting course feedback.

You need 30 points to pass with a grade of 1.
To get a grade of 5, you need approximately 55 points.

In addition, you are required to get at least 10 points from your final submission in order to pass.

## Final submission

The 24 points from the final submission are awarded as follows:

- User interface 4p
  - 0p simple text-based user interface
  - 1-2p extensive text-based user interface
  - 2-3p simple graphical user interface
  - 4p extensive graphical user interface
- Saving and reading data 4p
  - 0p no saving or reading data
  - 1p just reading files
  - 2p reading and writing files
  - 3p just reading from a database
  - 4p reading and writing to a database
  - 3-4p internet (e.g. saving to Google Docs or another online data storage)
  - The precise points given depend on how complex the saving/reading logic is
- Complexity of the program logic 3p
- Scope of your program (how large it is) 4p
- Using external packages 1p
  - The idea of this point is to get you to find and use a package that you don't know anything about
  - This does not include packages covered in the course, such as those used for testing, coverage, formatting, linting, or documentation
  - Just using Pygame, TkInter, SQLite, or the packages used by the reference project also does not give you this point
- Release 1p
  - The final version of your code is on GitHub as a release with the name `loppupalautus`, which has your source code attached
- Code quality 4+1p
  - Check the quality guidelines [here](/en/tasks/quality)
  - 4p good abstractions (e.g. using a good software design pattern, such as the repository design pattern), clear file and directory structure, testable and expandable code, no evident copy-pasting
  - +1p at most three pylint errors
- Error handling 2p
  - 2p The application works consistently, does not crash if you give it unexpected input, does not throw errors and gives relevant error messages to the user
- **Do not leave any unused, commented out code in your project**, or any unused code in general (e.g. functions or classes that have become obsolete after a refactoring of your code)
  - If these are found, a point reduction of -1 or -2 points will be applied depending on the amount of unused code
- An excessive amount of ChatGPT or other AI model usage may result in point reductions (if most of your code is written by yourself, you have nothing to fear).

### Points obtained from scope and complexity

- How large is large enough?
- The course's [reference project]({{site.python_reference_app_url}}) would score about 2 points, since it's program logic is fairly straightforward and would get only one point for complexity
- The scope cannot really be defined in terms of the number of classes, methods, or functions. It always dpeends on the type of application you are developing and its complexity
- One way to extend your project and increase its complexity is to make it configurable with parameters. For example,
  - The filename or the databse name that the application writes to can be set by the user, instead of being hardcoded
  - In a game, levels of varying difficulty are not hardcoded but are read from files that can be modified by the user
  - In a pacman game, the number of ghosts is not hardcoded to be 4, but can be set by the player
  - You can implement configurability either by adding options to the user interface or by using [configuration files](/en/tasks/implementation)

## Points obtained from tests

You must write your tests yourself.
Generating them is forbidden on this course.
To get full points (5p), the following is required:

- Good test coverage: branch coverage about 70%
  - The tests must test relevant content; simple tests that increase the coverage but don't do anything (e.g. tests with no `assert` statements) do not bring any points
- Enough testing on both the unit and integration level
  - Test how individual classes do their job
  - Test how multiple classes work together to do some bigger functionality
- The program logic is tested with some realistic scenario
- The tests test something relevant
  - If the tests are designed to only increase coverage, they will not award points
- Dependencies are handled properly
  - If your project uses a database, there should be a "test database" in use. More information can be found on the [implementation instructions](/fi/tasks/implementation#sovelluksen-konfiguraatiot) page.
  - Mock components are also sometimes useful. There is an example on these in the [dependency injection](/fi/tasks/implementation) part

## Points obtained from documentation

The documentation yields a maximum of 13 points, which are awarded as follows:

- Specification document 2p
  - **Updated to match the functionality of the end product**
  - An old spec document that has not been updated yields 0 points
- Architecture description 4p
- Usage and installation instructions 1p
  - The TA must be able to install and use your program solely based on these instructions
- Test document 2p
- Docstring documentation 2p
  - Most of the classes, attributes, methods, and functions are documented using docstring comments
  - Private methods or functions (that have a `_` or a `__` before their name) do not need to be documented
  - Tests do not need to be dosctring documented
- Repository and README 1p
  - The repository and README satisfies the requirements outlined during the course
- Explanation as to your use of ChatGPT and other AI tools 1p

[The reference project]({{site.python_reference_app_url}}) is a good example of how documentation should be done.

**Note:** do not copy-paste the reference project's documentation and modify it. Instead, write the documentation by yourself from scratch. Copy-pasting the documentation will result in a fail.

## Making sure the project works

- There are differences in how comptuers work, and it is not enough that your code works on your machine
- Your practical work must be runnable, installable, and testable by hand through the command line on a Linux computer (more specifically, the latest version of Cubbli Linux, which the university laptops run). If your code does not work on this computer, it will not be checked and you will lose the points for your submission.
- You can test your code using a freshers' laptop, a university desktop computer, or remotely using [VMWare](https://helpdesk.it.helsinki.fi/ohjeet/tietokone-ja-tulostaminen/tyoasemapalvelu/etakaytettavat-tyopoydat-vdi-ja-vmware) (choose Cubbli Linux)
