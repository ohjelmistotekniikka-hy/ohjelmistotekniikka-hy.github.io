## Software engineering

When making a small program for your own use, how you work is not very important. However, when the software is larger, and especially when it is being produced by several people for an external user or a client, hacking stuff together is no longer optimal. What is needed is some systematic method to guide software developers and ensure that the software is fit for the purpose of its users.

Software engineering involves a number of different activities during which the focus is slightly different. These activities, or _phases_ as they are sometimes called, are as follows

- _Specification_, where the goal is to figure out how you want your code to work
- _Design_, where the goal is to figure out how the specified project should be build
- _Implementation_, where the defined and designed software is coded
- _Testing_, where the goal is to ensure that the software is not too buggy and that it works as specified in the specification
- _Operations_, where the software is already in use and bug fixes and possible extensions are made.

Let's look at each stage in a little more detail.

Let's use the simple [todo]({{include.reference_app_url}}) application built for the course as an example.

### Specification

During the specification phase, the future users or customers of the application are asked to identify the functionality they want in the application. In other words, the customer's requirements for the functionality of the program are set. In addition, the constraints imposed on the system by the environment in which the program is used and the implementation technology are identified.

The result of the specification process is usually a document of some kind in which the requirements are recorded. The document can take many forms, from a thick file of papers to a set of post-it notes.

#### Todo application specification document

Our example application is a classic _TodoApp_, i.e. an application that allows users to keep track of their own work in progress, or _todos_.

It is usually a good idea to start the specification by identifying the different types of _user roles_ in the system. For the time being, our application does not have anything other than normal users. In the future, a user role with administrator privileges may be added to the application.

Once the user roles in the application are known, we will consider what functionalities we want each user role to be able to do with the application.

Examples of normal user functionalities of the Todo application are

- the user can create an account in the system
- the user can log into the system
- after logging in, the user can see their own tasks or todos
- the user can create a new todo
- the user can mark a todo as done, in which case the todo disappears from the list

The administrator's functionalities could be e.g.

- the administrator can see statistics on how the application is being used
- the administrator can delete a normal user account

Software requirements also include _environmental constraints_. The following constraints apply to the Todo application

- the software must work on machines running Linux and OSX operating systems
- user and todo data are stored on the local machine disk

The user interface of the application is usually outlined during the specification phase.

In previous versions of the course, user requirements were documented [as use cases](https://en.wikipedia.org/wiki/Use_case). In this course, we will take a slightly lighter approach, and record the desired functionality of the system as a free-form feature list using bullet points. See the example [specification document]({{include.reference_app_url}}/blob/master/dokumentaatio/vaatimusmaarittely.md) for details.

### Design

Software design is usually divided into two distinct phases.

_Architectural design_ defines the structure of the program at a rough level:

- The major structural components of the program
- How the components are connected, i.e. what the interfaces between the components are
- What dependencies the program has on, for example, databases and external interfaces

Architectural design is refined by _component design_, which considers the structure of the individual components of the software, i.e. what classes the components consist of, how the classes call each others' methods and what helper libraries the classes use.

The design of the software, in particular its architecture, is often documented in some way. Sometimes, however, the documentation is very light, e.g. a diagram drawn on a whiteboard, or it may even be absent altogether.

### Testing

During and after implementation, the system is tested. There are many different aspects of testing, i.e. the main areas of interest. These different perspectives are often referred to as _levels of testing_. The terminology for testing varies slightly, but the most common are three levels of testing: unit testing, integration testing and system testing.

_Unit testing_ examines the behaviour of individual methods and classes. Unit testing is often done by the programmer of the class under test and a good way to do this is to unit test the class while the class is being programmed.

When separately programmed components (i.e. classes or collections of classes) are combined, _integration testing_ is performed to ensure the interoperability of the separate components. Integration testing is also usually done by programmers.

_System testing_ tests the system as a whole and verifies that it works as defined in the specification document. In system testing, the tests are performed from the same perspective as the end-user, i.e. the tests are performed through the software interface. System testing is often performed by testing professionals.

### Waterfall model

The traditional way to build software is using a step-by-step _waterfall model_. In the waterfall model, the above steps of software production are performed in sequence:

![](/assets/images/l-1.png)

In the waterfall model, the first step is to define the requirements and then to write a specification document, which aims to document all the requirements for the program as precisely as possible. At the end of the definition phase, the specification document is frozen. The frozen specification document is often used as a basis for estimating the resources required to develop the programme and may also be used as a basis for contracting the price of the development.

The specification is followed by a design phase, which is also carefully documented. As a rule, no further changes are made to the specification during the design phase. Sometimes this is necessary. The aim is to make the design so complete that there is no longer any need to change the plans during the programming phase.

After design, the individual components of the program are implemented and unit tested. The individual components are then joined together, i.e. integrated, and integration testing is carried out.

After integration, the software is system tested, i.e. it is tested that the software as a whole works as defined in the specification document.

The waterfall model is problematic in a number of ways. The model works on the assumption that the requirements of the program can be fully defined before design and programming begins. This is often not the case. It is almost impossible for customers to express exhaustively all their requirements for the programme. At the very least, there is a very high risk that the programme will be poorly usable. It is also often the case that, even if the requirements of the programme are in place at the time of specification, the environment will change so dramatically during the development of the programme (e.g. via a company merger) that by the time the software is completed, it is obsolete. It is also very common that it is only after using the finished programme that customers begin to understand what they would have wanted from the software.

In addition to changing customer requirements, another major problem is that in the waterfall model, testing of the software starts relatively late in the process. Especially in integration testing, it is typical that bad problems are found in the software, which take a long time and are costly to fix.

### Agile software development

The weaknesses of the waterfall model have led to the introduction of _agile software development methods_, which have become more common in recent years.

Agile methods start from the assumption that requirements cannot be exhaustively defined at the beginning of the software development process. Since this cannot be done, it is not even attempted, but the aim is to work in such a way that the customer's requirements can be refined little by little during the software development process and the end result is as close as possible to what is desired.

Agile software development usually proceeds by first outlining the requirements of the program and perhaps sketching the initial architecture of the system. This is followed by a series of _iterations_ (also commonly referred to as sprints), during which the program is built piece by piece. In each iteration, a small part of the program requirements is designed and implemented. The requirements may also be refined throughout the process.

A single iteration, typically lasting 1-4 weeks, adds a small part of the desired functionality of the whole system. Typically, the most important, challenging, and risky functionalities are implemented in the first iterations. One iteration includes the refinement, design, implementation and testing of the requirements selected for implementation.

Each iteration produces a functional system that has been tested for the implemented features. After each iteration, the customer can test the system. This allows to see at an early stage whether the development is moving in the right direction and to refine and add requirements if necessary.

Each iteration therefore involves definition, design, programming and testing, and after each iteration the customer provides feedback on whether the development is going in the right direction:

![](/assets/images/l-2.png)

In agile software development, documentation is usually not as central as in traditional methods.

Instead of documentation, testing and so-called continuous integration play a very important role. In general, the aim is to immediately test new components added to the system and to integrate them into the overall system; this is known as _continuous integration_. New versions of the system are thus created on a daily basis.

The aim is to ensure that the new components work by means of thorough automated testing. Sometimes even "test first", i.e. test cases are programmed to test the functionality of a new component even before it is implemented. Once the test cases are completed, the component is implemented, and once the component passes the test cases, it is integrated into the rest of the system.

There are many different agile software development methodologies, the best known of which is Scrum.

Agile methods are the dominant way of making software today. In recent years, Lean methods have emerged alongside agile methods, which slightly refine the idea of agility. We will return to this topic in more detail in the Ohjelmistotuotanto course (currently only offered in Finnish).

The exercises in this course will be partly in the spirit of agile methods, i.e. the requirements definition and design will be kept light and the implementation of the program will start at an early stage. As far as possible, the aim is to make a working version of the program at the end of each iteration, i.e. week, and then extend it week by week. Some of the documentation required for the course will be produced along the way.
