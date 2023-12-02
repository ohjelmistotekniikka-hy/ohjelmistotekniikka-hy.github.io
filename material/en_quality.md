---
layout: page
permalink: /en/tasks/quality
title: Code quality requirements
---

The goal of the course is for you to make such good code, that any of your friends or students could take your code, maintain it, and expand it.
The ideal is Clean Code - clear, maintainable, and tested code.
This page describes what your final submission should look like, but it's worth following these requirements since the beginning.

## Clean Code

The following is a list of Clean Code requirements that you should strive to follow:

### Naming functions, classes, methods, attributes, parameters, and variables clearly and sensibly

- Use as descriptive names as possible
  - Classes should always be in _PascalCase_
- Methods, attributes, parameters, and variables should be in *snake_case*
- If a class only uses an attribute or a method internally, [it is good style](https://google.github.io/styleguide/pyguide.html#3162-naming-conventions) to put a `_`-sign or a `__`-sign before the name
- Variables that are used in a large portion of the code must be extremely well named
- Variables that are briefly used inside one short function can have shorter names
- If a method is used little, its name should be as descriptive as possible
- All of your names should be in English

### No long methods or functions

- Methods and functions should be less than 20 lines long without a good reason
- Long methods and functions should be split into separate parts
- Follow the Single Responsibility Principle - every function or bit of code does one simple task
  - This helps in writing tests, as well

### Avoiding copy-pasting

- It's almost always possible to get rid of duplication in code
- Depending on the context, you can create a method or parent class, which will take care of the repeating code. Inheritance is usually discouraged, and you should consider using composition instead (see [Composition over inheritance](https://en.wikipedia.org/wiki/Composition_over_inheritance))

### Single Responsibility

- Classes, methods, and functions should do only one thing each
- It is important to separate the UI and the program logic
  - Printing should happen in the UI
  - Nothing related to program logic should be done in the UI files
- One thing should not be done by different classes across your program
- For example, reading and writing to files should not be found from many different classes or functions
  - Instead, make a separate class which will read and write the files, and return the data you need

### Structure

- All of the code _cannot be_ in the same folder, and in no situation can it be in the same file
- Do not leave any code in the root of your repository. All code should be under the `src` directory.
- Files and folders should be named in *snake_case*
- Split your code across different files, for example:
  - One class per file
  - A group of functions that do similar tasks in the same file (for example, helper functions that do file operations)
- Group files that implement similar functionality together in a folder, for example:
  - Test files in their own directory
  - UI files in their own directory
  - A good example is the [reference project's]({{site.python_reference_app_url}}/tree/master/src) structure
  - [This page](/en/tasks/implementation) also has tips on how to split your code across multiple classes and modules

### Testing

- It is _forbidden_ to generate tests automatically
  - The intent is for you to learn how to test your own program code
  - Generated tests rarely test anything actually useful
  - The use of automatically generated tests or using test templates: 0 points
- Automated unit tests are _mandatory_
  - You will fail if you do not have tests
- Recall the test tasks from the course:
  - Test as many classes, functions, and methods as possible
  - Find odd edge cases and test them as well
  - Test invalid input
- You do not need to test the UI
- Remember to use proper [naming conventions](/en/tasks/week2)
  - For example, the `User` class must be tested by the `TestUser` class
  - You may create multiple test classes for any one class

## General quality requirements

First and foremost, your program must work correctly

- The program cannot crash
- The program cannot print exceptions to the command line, even if the error does not crash the program
- Check that your program does not accidentally use data that goes outside a range (e.g. if you delete a line from a text file, make sure your code does not reference a line that no longer exists)
- Be prepared for a malicious user to insert invalid input into your program
  - For example, if your code expects a number, a stupid user may insert text instead
- If you are making a game, the game rules must work correctly
  - For example, in a memory game you should not be able to turn a card that's already been turned
  - In tic-tac-toe, you cannot put a symbol in a square that already has a symbol in it
- If your program encounters a significant error that causes it to crash, it is okay for it to e.g.
  - Show a nice, friendly error message to the user
  - And close itself

If you find some bug or weird behaviour in your program, try to get rid of it.
You can use debuggers like [pdb](https://realpython.com/python-debugging-pdb/) to try and pinpoint the issue.
A simpler way is to just add `print` statements to try and see what code gets run and what variables are set.
If that still does not help, please ask the TAs or the course instructors to help.
However, if even that does not work, don't be upset!
In the real world, programs usually have some bugs left over in them.
Document the bugs that you find in the testing document, if you cannot fix them.
