---
layout: page
permalink: /en/credit-transfer
title: Credit transfer
---

It is possible to perform a _credit transfer_ for the course; i.e., to get the study credits with a grade of _PASS_.
To perform a credit transfer, you must have completed a software engineering project on your own and have documented it.
The programming language is free to choose, as long as there is thorough documentation concerning how to run the program. 

If you would like to perform a credit transfer, contact Kai Korpimies by email (kai.korpimies@helsinki.fi).

## Requirements

### Scope

- You must have used at least **80 hours** on implementing, testing, and documenting the project
- The project must have a user interface, whether through the command line or graphical
- You must have automated tests implemented for the project, such that at least 60% of the lines of code and the branches of execution are tested. User interface code does not have to be tested, and can be left out of the tests and the above figure, as long as the code for the functionality and the user interface are separate from each other.

### Code quality

- Your code must follow the [code quality requirements](/en/quality) in the course material. You may need to adjust these requirements based on programming language.
- You must document the project using comments, for example using [Docstrings](/en/tasks/viikko6#docstrings-and-documentation)). Classes, methods, and functions must be documented.

### Version control and repository

- The project code must be on GitHub. The repository can be public or private. If it is private, add the user `kkorpim` as a collaborator.
- Create a [GitHub release](/en/release) for your project. Explain in the `README.md` file, where your release can be found and what you need to do to run it.
- Add a `README.md` file to the repository, which looks something like the one in the [reference project]({{site.python_reference_app_url}}). The following things must be included:
- Short description of the project
- Links to documentation
- Instructions to run the program
- Instructions to run the tests

### Dokumentation

Every documentation document should have a link to it in the `README.md` file. The following are required:

- **Architecture diagram**, which is something like in the [reference project]({{site.python_reference_app_url}}/blob/master/dokumentaatio/arkkitehtuuri.md). You must also have a [program logic]({{site.python_reference_app_url}}/blob/master/dokumentaatio/arkkitehtuuri.md#sovelluslogiikka) description and diagram. If the project is extremely large, focus on some important aspect of it.
- **Instructions**, which are something like in the [reference project]({{site.python_reference_app_url}}/blob/master/dokumentaatio/kayttoohje.md)
- **Test document**, which is something like in the [reference project]({{site.python_reference_app_url}}/blob/master/dokumentaatio/testaus.md).
- **Time tracking sheet**, which shows how many hours you have used on the project. [The reference project]({{site.python_reference_app_url}}/blob/master/dokumentaatio/tuntikirjanpito.md) is ideal, but also a less precise document is okay. The most important thing is that you can see how many hours have been used on what. Remember that the minimum time required for a credit transfer is **80 hours**.
- You can also replace this time tracking sheet with a convincing explanation that you have, indeed, used at least 80 hours on the project.
