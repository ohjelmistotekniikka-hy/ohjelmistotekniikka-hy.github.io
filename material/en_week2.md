---
layout: page
permalink: /en/tasks/week2
title: Week 2
---

{% include en_deadline_info.md deadline=site.en_wk2dl %}

This week, you will get 2 points for submitting the exercises and 1 point for returning the practical work.

Make a `week2` folder under your `exercises` folder in your project repository.

## Poetry and dependencies

When you have big projects, it no longer makes sense to write all your code yourself. For example, programmers should not have to implement databases and testing code themselves every time they want such functionality in their projects. In order to not have to reinvent the wheel, _libraries_ were invented so that people could reuse others' code.

The source code for libraries can usually be found in version control systems such as GitHub. Packages are regularly updated and new _versions_ are born. Different library versions are published in registers, from which they are easy to install. In particular, for Python, [the Python Package Index](https://pypi.org/) (PyPI) is the standard place to find libraries.

The libraries you use in your project are called _dependencies_. You usually install dependencies into _virtual environments_, which are special locations on your disk so that conflicting modules on your computer don't get mixed up. We will use [Poetry](https://python-poetry.org/) for this.

### A warning about commands

On many computers, you run Python with the command `python3` instead of `python`. Check the version that you have by running the following:

```bash
python3 --version
```

If `python3` cannot be found for some reason, check if `python` works:

```bash
python --version
```

Finally, if this doesn't work, and you are on Windows, check whether this works:

```bash
py --version
```

If, in all of the above cases, the version shown was below 3.8, install the [latest Python version](https://www.python.org/downloads/). During this course, always use the command that gives you a Python version of at least 3.8.

### Installing

Before using Poetry, we need to install it. Even if you have Poetry already installed, follow the instructions for your operating system to ensure that the latest version is installed.

**Warning:** you may need to restart the terminal and/or your computer if Poetry doesn't work after installing.

#### Linux and macOS

Install Poetry by running the following:

```bash
curl -sSL https://install.python-poetry.org | POETRY_HOME=$HOME/.local python3 -
```

**Note:** if the `python3` command does not exist, use the `python` command instead. Before doing this, however, ensure that the Python version this gives you is at least 3.8 (as per the above instructions).

**Note:** if you are on MacOS, and you get the error `SSL: CERTIFICATE_VERIFY_FAILED`, open the Python installation directory by running `open /Applications/Python\ 3.9` (replace "3.9" with your Python version) and click on the `Install Certificates.command` file. Wait for it to finish and try again.

After installation, you must add Poetry to PATH. Do this by adding the following line to your `.bashrc` file, located in your home directory:

```bash
export PATH="$HOME/.local/bin:$PATH"
```

You can add the line either by using the Nano editor, or by running the following command:

```bash
echo "export PATH=\"\$HOME/.local/bin:\$PATH\"" >> $HOME/.bashrc
```

**Note:** if you are using zsh instead of bash, you must include this line in the `.zshrc` file instead of the `.bashrc` file. You can check which command line you have in use by running `echo $SHELL`. If you are, indeed, using zsh, and you want to run the above command, replace `$HOME/.bashrc` with `$HOME/.zshrc`.

**Note:** if you are using MacOS and bash, replace `$HOME/.bashrc` in the above command with `$HOME/.bash_profile`.

**Note:** if you are on melkki, replace `$HOME/.bashrc` in the above command with `$HOME/.profile`.

Restart the terminal and ensure that `poetry --version` works. The command should print the version of Poetry installed.

#### Windows

Run the following command in your command prompt:

```powershell
(Invoke-WebRequest -Uri https://install.python-poetry.org -UseBasicParsing).Content | py –
```

After this, you need to add Poetry to the PATH.
Use [this](https://www.architectryan.com/2018/03/17/add-to-the-path-on-windows-10/) instruction to add the string `%APPDATA%\Python\Scripts` to your PATH.

Restart the terminal and ensure that `poetry --version` works. The command should print the version of Poetry installed.

### Initialising a project

We will practice using Poetry by making a small example project.

Make a new folder _poetry-test_ anywhere (you don't have to put it in your repository).
Open the folder in your terminal and run this command:

```bash
poetry init --python "^3.8"
```

The `--python "^3.8"` setting tells Poetry that the minimum required version of Python for our project is 3.8.
The command will ask you questions, and you can either answer them or just press enter to skip them. You are always able to change these settings later.

Once that's done, check your folder. Poetry should have created a new file `pyproject.toml` that has something like this inside:

```toml
[tool.poetry]
name = "poetry-testi"
version = "0.1.0"
description = ""
authors = ["Kalle Ilves <kalle.ilves@helsinki.fi>"]
readme = "README.md"

[tool.poetry.dependencies]
python = "^3.8"

[build-system]
requires = ["poetry-core"]
build-backend = "poetry.core.masonry.api"
```
This is just a text file, and can be opened with Notepad or VScode, and it tells poetry what settings you picked.

The `[tool.poetry]` section contains general information related to the project, such as its name, description, and maintainers. Under this section is another section that lists the dependencies for the project. In the `[tool.poetry.dependencies]` section, we see the `python = "^3.8"` setting which was set when we ran `poetry init`. The `^3.8` means that the project requires a Python version of at least 3.8.

Now, set up the project by running

```bash
poetry install
```

Running this command will initialise everything in the project, like the virtual environment and installing dependencies. You must always run this command before starting to use a new project.

You will most likely run into the following error message upon running the above command:

```
Installing the current project: poetry-testi (0.1.0)
The current project could not be installed: [Errno 2] No such file or directory: '~/poetry-testi/README.md'
If you do not want to install the current project use --no-root
```

This happens because Poetry tries to also install the current project, and there is no `poetry-testi` module in your folder. You can safely ingore this message, since it's [not an error](https://github.com/python-poetry/poetry/pull/8369), but rather a warning. If you want peace of mind, however, you may instead run the command

```bash
poetry install --no-root
```

This will just install the dependencies, which is what we want, and refrain from outputting errors.

After running the command, you will get a `poetry.lock` file in your folder. This file contains all of the version information for the project's dependencies. This allows for Poetry to install the correct versions of libraries in the future. For this reason, when you use Poetry in your practical work, make sure to commit the `poetry.lock` file to git.

### Installing dependencies

Let's install a new dependency. For your project later on, you can find these by googling or searching on GitHub/PyPI.

We will install the Python [cowsay](https://pypi.org/project/cowsay/) module as a test. To do this, run the following commmand in the same folder as your `pyproject.toml` is:

```bash
poetry add cowsay
```

To reiterate, the command to install libraries is `poetry add <library>`. After running this, we notice that the `pyproject.toml` file has a new entry:

```toml
[tool.poetry.dependencies]
python = "^3.8"
cowsay = "^2.0.3"
```

By default, `poetry add` installs the latest version of any given package, which was `2.0.3` at the time of writing. Usually this is what we want. However, if we for whatever reason needed an older version, we could install it by running

```bash
poetry add cowsay==1.0
```

And to remove the package from our environment, we could run

```bash
poetry remove cowsay
```

However, let's keep it installed for now.

### Running commands in a virtual environment

Inside your `poetry-test` folder, create a directory `src` and put a file named `index.py` inside that. Add the following code within:

```python
import cowsay

cowsay.tux("Poetry is awesome!")
```

If you just run this code directly, you will get an error:

```bash
python3 src/index.py
```

Results in:

```
ModuleNotFoundError: No module named 'cowsay'
```

This is because the package is installed in the virtual environment, while we are working in our normal environment. To fix this, we have to tell Poetry to run the program in its virtual environment using the following [run](https://python-poetry.org/docs/cli/#run) command:

```bash
poetry run python3 src/index.py
```

If you need to repeatedly run commands, it mihgt be more useful to open a command prompt _inside_ your virtual environment. To do this, run the [shell](https://python-poetry.org/docs/cli/#shell) command:

```bash
poetry shell
```

When we enter the virtual environment, we get the following prefix to our command prompt:

```bash
$ (poetry-testi-IhtScY6W-py3.9)
```

Now, you can run all the commands as you would normally.

```bash
python3 src/index.py
```

You can leave the prompt by typing `exit`.

### Dependencies during development

Using Poetry, we can separate dependencies based on their use case. A very common way is to group dependencies into those required during _development_ and those required to _run_ your project. The former are useful for you as a developer to write your code, but are not necessary to run the program, so they can be discarded when you release your code.

By default, the `poetry add` command installs everything under the `[tool.poetry.dependencies]` seciton. In addition to these, we can install dependencies that are only required during development.

This happens by giving the `poetry add` command a `--group dev` flag. For example, the [pytest](https://pytest.org/) module that we will be using shortly can be installed using the command:

```bash
poetry add pytest --group dev
```

This will place pytest under a separate group, `[tool.poetry.group.dev.dependencies]`:

```toml
[tool.poetry.group.dev.dependencies]
pytest = "^6.1.2"
```

This is useful, since we can reduce the number of dependencies needed if we just want to run the program. For this, we could run `poetry install --without dev` to install only the dependencies needed to run, but not e.g. test the program.

### Common problems

Oftentimes, Poetry issues can be resolved as follows:

1. Make sure you have the latest version installed by running `poetry self update`
2. Ensure that the `pyproject.toml` file has the right Python version requirement:

   ```toml
   [tool.poetry.dependencies]
   python = "^3.8"
   ```

   **If the version is incorrect**, change it to be correct and run `poetry update`

3. Clear the cache by running `poetry cache clear pypi --all` and `poetry cache clear PyPi --all`

4. List the virtual environments available using `poetry env list` and remove them all using `poetry env remove <name>`. For example, as follows:

   ```bash
   $ poetry env list
   unicafe-jLeQYxxf-py3.9 (Activated)
   $ poetry env remove unicafe-jLeQYxxf-py3.9
   Deleted virtualenv: /Users/kalleilv/Library/Caches/pypoetry/virtualenvs/unicafe-jLeQYxxf-py3.9
   ```
   When all virtual environments are deleted, run `poetry install`

After all these steps, try to run your Poetry command again.

### Keyring problem

If the `poetry install` command asks for a keyring password, run `export PYTHON_KEYRING_BACKEND=keyring.backends.fail.Keyring` and then run `poetry install` again. You can put the first command in your `.bashrc` (or similar) file, so that you don't have to run it every time you restart your terminal

## Unit tests and testing

In your project, you will need to write [tests](https://docs.python.org/3/library/unittest.html) (like the automated tests in the Intro and Advanced programming courses!) to test whether your code works as you expect it to. Let's learn how to do that.

*Remember that using ChatGPT or other AI tools like GitHub Copilot to write tests is forbidden on this course.*

As an example, let's use the `PaymentCard` class, which has functions to add money and pay for food:

```python
# Prices are in cents
CHEAP = 250
YUMMY = 400


class PaymentCard:
    def __init__(self, balance):
        # The balance is in cents
        self.balance = balance

    def eat_cheap(self):
        if self.balance >= CHEAP:
            self.balance -= CHEAP

    def eat_yummy(self):
        if self.balance >= YUMMY:
            self.balance -= YUMMY

    def add_money(self, amount):
        if amount < 0:
            return

        self.balance += amount

        if self.balance > 15000:
            self.balance = 15000

    def __str__(self):
        balance_in_euros = round(self.balance / 100, 2)

        return "The card has {:0.2f} euros on it".format(balance_in_euros)
```

**Note:** All the money amounts in this code are in cents.

---
### Task 1: Initialisation

In your repository that you saved to LabTool, create a folder called `payment_card` under the `exercises/week2` folder.

Open the command prompt and run `poetry init --python "^3.8"`.
Again, skip all the questions by pressing enter.
Install the `pytest` library that we will use for testing by running

```bash
poetry add pytest --group dev
```

Now, make the following folder structure in your `payment_card` folder:

```
payment_card/
  src/
    payment_card.py
    tests/
      __init__.py
      payment_card_test.py
  ...
```
(This diagram means that inside the `payment_card` folder you have a folder `src`, inside which is `payment_card.py` and a folder `tests`, inside which are the two other files).

Copy the above `PaymentCard` class code into the `payment_card.py` file.

### Task 2: Writing tests

Let's run some tests. Run `poetry shell`, and when that opens the poetry command line, run `pytest src`. It should tell you that no tests were run (because there aren't any tests yet).

Open the `src/tests/payment_card_test.py` file and paste the follwing into it:

```python
import unittest
from paymentcard import PaymentCard

class TestPaymentCard(unittest.TestCase):
    def setUp(self):
        print("Set up goes here")

    def test_hello_world(self):
        self.assertEqual("Hello world", "Hello world")
```

In your command prompt, run `pytest src` again. The one test you made should succeed. Note: for this command to work, you need to run it from the `payment_card` directory.

Pytest finds tests by looking in the folder you tell it (in our case, `src`) and searching for tests recursively in all subdirectories. For tests to be found, they **must** be named as follows:
- Files should end in `_test`, e.g. `payment_card_test.py`
- Test classes should begin with `Test`, e.g. `TestPaymentCard`
- Test functions should begin with `test_`, e.g. `test_hello_world`


Note also that the empty `__init__.py` file is necessary, or the tests won't work. If you forget to include this file, the tests will fail with the following error message:

```
ModuleNotFoundError: No module named 'payment_card'
```

If your test folder has subfolders, all of those must have an empty `__init__.py` file.

Let's make a test that checks whether the constructor for the `PaymentCard` class sets everything up correctly. That is, we will write a test that checks whether the initial balance is 10€. To do this, make the contents of the `payment_card_test.py` file the following:

```python
import unittest
from payment_card import PaymentCard

class TestPaymentCard(unittest.TestCase):
    def setUp(self):
        print("Set up goes here")

    def test_constructor_sets_the_balance_right(self):
        # create a card with 10€/1000cents on it
        card = PaymentCard(1000)
        answer = str(card)

        self.assertEqual(answer, "The card has 10.00 euros on it")
```

The first two lines of code in `test_constructor_sets_the_balance_right`
just run the class to be tested.
The last line, `self.assertEqual(answer, "The card has 10.00 euros on it")`, is the test itself. It says that if the values of `answer` and the string are equal, then the test passes; otherwise, it doesn't.

There are many different [asserts](https://docs.python.org/3/library/unittest.html#assert-methods) available, not just `assertEqual`. For example, you can compare things to be greater, less than, etc.

Now, run the test again using `pytest src`. It should pass!

An alternative way of running this test would be:

```python
def test_constructor_sets_the_balance_right(self):
    card = PaymentCard(1000)

    self.assertEqual(str(card), "The card has 10.00 euros on it")
```

This is slightly more compact.

Check that the tests actually work as intended. Change it to the following, and run the tests again; they should fail.

```python
def test_constructor_sets_the_balance_right(self):
    card = PaymentCard(1000)

    self.assertEqual(str(card), "The card has 9.00 euros on it")
```

The test will tell you what failed and exactly where the error was. This is very useful for debugging!

```
FAILED src/tests/payment_card_test.py::TestPaymentCard::test_constructor_sets_the_balance_right - AssertionError: 'The card has 9.00 euros on it' != 'The card has 10.00 euros on it'
```

Change it back. Add another test that checks whether the `eat_cheap` method works as intended:

```python
def test_eat_cheap_reduces_balance_right(self):
    card = PaymentCard(1000)
    card.eat_cheap()

    self.assertEqual(str(card), "The card has 7.50 euros on it")
```

Once again, we create a card object, after which we call the method that interests us. Finally comes the test itself, which checks if the final balance is what we expect it to be.

### Notes

- While it's possible to put many `assertEqual` calls into one test, it's good style for one test function to test one thing.
- Name the test functions well so that it's clear what they are testing.
- All test functions must start with `test_`
- The tests are independent of each other; what operations one does doesn't affect the others
- When developing your bigger project, run your tests regularly to make sure that your changes don't break anything. This is a really good way of debugging your code!

It's also not really good style to test the balance (a number value) based on the string representation/message "The card has 7.50 euros on it", which is a string. It would be way better if we could test it directly. One way to do this is the following:

```python
def test_eat_cheap_reduces_balance_right_2(self):
    card = PaymentCard(1000)
    card.eat_cheap()

    # Test whether the balance variable is correct
    self.assertEqual(card.balance, 750)
```

But, there's another issue: what if the programmer later decides that the `balance` variable is in euros, instead of cents? After all, this variable is some internal thing that we shouldn't really be touching. Let's fix this issue by creating a function in the `PaymentCard` class that tells you the balance in euros always, regardless of what the internal balance implementation is.

```python
class PaymentCard:
    # ...

    def balance_in_euros(self):
        return self.balance / 100
```

Let's change our test to use this new method:

```python
def test_eat_cheap_reduces_balance_right_2(self):
    card = PaymentCard(1000)
    card.eat_cheap()

    # Test whether the balance variable is correct
    self.assertEqual(card.balance_in_euros(), 7.5)
```

### More tests

Let's add two more tests:

```python
def test_eat_yummy_reduces_balance_right(self):
    card = PaymentCard(1000)
    card.eat_yummy()

    self.assertEqual(card.balance_in_euros(), 6.0)

def test_eat_cheap_doesnt_make_balance_negative(self):
    card = PaymentCard(200)
    card.eat_cheap()

    self.assertEqual(card.balance_in_euros(), 2.0)
```

The first test checks that the `eat_yummy` function works as intended. The second one checks that the balance is still the same if you don't have enough money to pay for a meal.

### Initialisation

Note that some of the code above is redundant: the first three tests all create a card with 10€ on it. We can move it to the setup function:

```python
class TestPaymentCard(unittest.TestCase):
    def setUp(self):
        self.card = PaymentCard(1000)

    def test_constructor_sets_the_balance_right(self):
        self.assertEqual(str(self.card), "The card has 10.00 euros on it")


    def test_eat_cheap_reduces_balance_right(self):
        self.card.eat_cheap()

        self.assertEqual(self.card.balance_in_euros(), 7.5)

    def test_eat_yummy_reduces_balance_right(self):
        self.card.eat_yummy()

        self.assertEqual(self.card.balance_in_euros(), 6.0)

    def test_eat_cheap_doesnt_make_balance_negative(self):
        card = PaymentCard(200)
        card.eat_cheap()

        self.assertEqual(card.balance_in_euros(), 2.0)

```

The `setUp` method is run **before every test**. Note how the new card is saved into `self.card` so that the other functions can access it. As such, they don't have to create this object every time themselves.

Note also how `test_eat_cheap_doesnt_make_balance_negative` creates a new object and doesn't care about the one made in the setup, since it wants to test a different situation with less money.

### More tests

Add two more tests: one that tests that adding money to the card works, and the other that the balance doesn't exceed the maximum:

```python
def test_able_to_add_money(self):
    self.card.add_money(2500)

    self.assertEqual(self.card.balance_in_euros(), 35.0)

def test_balance_does_not_exceed_maximum(self):
    self.card.add_money(20000)

    self.assertEqual(self.card.balance_in_euros(), 150.0)
```

### Task 3: Even more tests

Add the following tests to the test file (make an individual test for each):

- Eating a tasty lunch (`kortti.syo_maukkaasti`), which charges the account 4€, does not make the balance go negative. You can take inspiration from the `test_syo_edullisesti_ei_vie_saldoa_negatiiviseksi` test.
- Trying to add a negative sum to your account doesn't do anything
- You are able to buy a cheap (2.5€) lunch if your balance is exactly 2.5€
- You are able to buy an expensive (4€) lunch if your balance is exactly 4€

**Note:** Always write your `assertEqual` commands so that the first parameter is the *outcome of the tested program* and the second is the *correct outcome*. That way, the failed test messages will display correctly.

### Tests are independent

Above, we mentioned that the tests are independent of each other. What does this actually mean?

The payment card is tested by multiple small test methods, each of which starts with the `test_` prefix. Each test takes care of some small detail, e.g. that the card balance decreases by the proper amount.
The intention is that each test starts from a "clean slate", which means that before every test the `setUp` method is run, which creates a new card.

Each test starts from a fresh situation, where the card has just been created. Then, the test function calls whatever function it wants to test with whatever data it wants it to use. Finally, the test asserts some fact about what it wants to see.

### Have we tested enough?

We think that we have written enough tests for our program. How can we be sure?

We will return to this in a following section, which talks about test coverage. As a spoiler, our tests actually test everything apart from the situation where we try to add a negative amount of money to the card.

### Example of the whole test file (excluding the exercise)

```python
import unittest
from payment_card import PaymentCard

class TestPaymentCard(unittest.TestCase):
    def setUp(self):
        self.card = PaymentCard(1000)

    def test_constructor_sets_the_balance_right(self):
        self.assertEqual(str(self.card), "The card has 10.00 euros on it")

    def test_eat_cheap_reduces_balance_right(self):
        self.card.eat_cheap()

        self.assertEqual(self.card.balance_in_euros(), 7.5)

    def test_eat_yummy_reduces_balance_right(self):
        self.card.eat_yummy()

        self.assertEqual(self.card.balance_in_euros(), 6.0)

    def test_eat_cheap_doesnt_make_balance_negative(self):
        card = PaymentCard(200)
        card.eat_cheap()

        self.assertEqual(card.balance_in_euros(), 2.0)

    def test_able_to_add_money(self):
        self.card.add_money(2500)

        self.assertEqual(self.card.balance_in_euros(), 35.0)

    def test_balance_does_not_exceed_maximum(self):
        self.card.add_money(20000)

        self.assertEqual(self.card.balance_in_euros(), 150.0)
```

### Task 4: Card and cash register

First, add/commit/push the first 3 tasks.

**Note:** this task will be completely separate from the previous tasks! We will create all the files again and write new tests, **do not** copypaste anything from the previous sections.

This problem aims to simulate a [Unicafe](https://unicafe.fi/) cash register.
In the cash register, you can buy cheap and yummy lunches.
You can do this with either cash or a card.

The payment cards can be topped up with money by paying cash to the cash register.
Below is the implementation of the payment card that we will be using:

```python
class PaymentCard:
    def __init__(self, balance):
        # balance is in cents
        self.balance = balance

    def add_money(self, amount):
        self.balance += amount

    def take_money(self, amount):
        if self.balance < amount:
            return False

        self.balance = self.balance - amount
        return True

    def balance_in_euros(self):
        return self.balance / 100

    def __str__(self):
        balance_euros = round(self.balance / 100, 2)

        return "The card has {:0.2f} euros on it".format(balance_euros)
```

The cash register, in turn, is implemented as follows:

```python
class CashRegister:
    def __init__(self):
        self.money = 100000
        self.cheap = 0
        self.yummy = 0

    def eat_cheap_with_cash(self, amount):
        if amount >= 240:
            self.money = self.money + 240
            self.cheap += 1
            return amount - 240
        else:
            return amount

    def eat_yummy_with_cash(self, amount):
        if amount >= 400:
            self.money = self.money + 400
            self.yummy += 1
            return amount - 400
        else:
            return amount

    def eat_cheap_with_card(self, card):
        if card.balance >= 240:
            card.take_money(240)
            self.cheap += 1
            return True
        else:
            return False

    def eat_yummy_with_card(self, card):
        if card.balance >= 400:
            card.take_money(400)
            self.yummy += 1
            return True
        else:
            return False

    def add_money_to_card(self, card, amount):
        if amount >= 0:
            card.add_money(amount)
            self.money += amount
        else:
            return

    def money_in_euros(self):
        return self.money / 100
```

**Now, download the code to your computer.** You can do this by running the following commands in the _exercises/week2_ folder:

```bash
wget https://github.com/ohjelmistotekniikka-hy/ohjelmistotekniikka-hy.github.io/raw/master/material/en_unicafe.zip
unzip en_unicafe.zip
rm en_unicafe.zip
```

Alternatively, you can download the code as follows:

1. Download the zip file [here](/material/en_unicafe.zip)
1. Unzip it
1. Move it so that under `week2` you have the folder `unicafe`, under which are the files `poetry.lock` and `pyproject.toml`, as well as the folder `src` which has a bunch of stuff inside it.

Add and commit these new files to the repository.
Use `git status` to make sure that the working directory is clean:

```bash
On branch master
Your branch is ahead of 'origin/master' by 3 commits.
  (use "git push" to publish your local commits)
nothing to commit, working tree clean
```

Change to the `unicafe` directory and install the required dependencies by running:

```
poetry install
```

You can run the tests in the terminal by going into the virtual environment by running `poetry shell` and running the command `pytest src`.
If everything is okay, you will get a message about the passed tests:

```
collected 1 item

src/tests/payment_card_test.py .                          [100%]

====================== 1 passed in 0.03s ======================
```

### Task 5: .gitignore

If, after running the tests, you run the command `git status`, you may notice that the root of your project has a new folder, `.pytest_cache` (follow these instructions even if this folder doesn't appear yet).

```bash
On branch master
Your branch is ahead of 'origin/master' by 4 commits.
  (use "git push" to publish your local commits)
Untracked files:
  (use "git add <file>..." to include in what will be committed)

	.pytest_cache/

nothing added to commit but untracked files present (use "git add" to track)
```

The `.pytest_cache` folder contains temporary files used by pytest.
We do not want to include this in our version control, since it is trash to us.
These files will also be constantly changing, and result in unnecessary changes to our repository every time we commit.

To tell git to ignore this whole folder, we can use an aptly named [.gitignore](https://www.atlassian.com/git/tutorials/gitignore) file, where you can define which files and folders git should forget about.
Every individual file and folder goes on its own line.

Go to the **root of your repository**, create a `.gitignore` file, open it with an editor, and add the following line:

```
.pytest_cache
```

Do this even if the `.pytest_cache` folder does not exist for you.
Now, when you run `git status`, the result should be:

```bash
On branch master

Initial commit

Untracked files:
  (use "git add <file>..." to include in what will be committed)

	.gitignore
```

So, even though the folder `/exercises/week2/unicafe` has a subdirectory `.pytest_cache`, git no longer cares about it.

Do the same for `__pycache__`, which is a directory that has temporary files that Python uses when running itself.
That is, add the following line to the `.gitignore` file:

```
__pycache__
```

### Task 6: Back to testing

Now, open your project folder with an editor such as Visual Studio Code.

Open the `src/tests/payment_card_test.py` file.
Add the following tests to the `TestPaymentCard` class:

- The payment card balance is correct at the beginning
- Adding money to the card increases the balance correctly
- Taking money from the card works:
  - The balance decreases correctly if there is enough money
  - The balance does not change if there is not enough money
  - The methods returns `True` if there is enough money, and otherwise `False`

Run the tests in the virtual environment's terminal using the command `pytest src`. 

## Komentojen suorittaminen Visual Studio Codessa

Visual Studio Coden voi avata Linux-ympäristössä esim. siirtymällä hakemistoon _unicafe_ ja antamalla komennon `code .`. Visual Studio Codesta löytyy sisäänrakennettu terminaali. Terminaalin saa avattua valitsemalla päävalikosta _Terminal_ ja aukeavasta alavalikosta _New Terminal_. editorin alalaitaan pitäisi ilmestyä terminaali, jossa voit suorittaa komentorivikomentoja.

Terminaalin avaaminen saattaa automaattisesti avata komentorivin virtuaaliympäristössä, ainakin jos olit virtuaaliympäristössä silloin kun avasit itse Visual Studio Coden. Jos olet virtuaaliympäristössä, on komentorivin syöterivin alussa projektin nimi ja jokin satunnainen merkkijono suluissa, esimerkiksi `(unicafe-sF0cl2di-py3.9)`. Jos et ole virtuaaliympäristössä pääset siihen tutulla `poetry shell`-komennolla. Tämän jälkeen voit suorittaa komentoja suoraan Visual Studio Codessa:

![Visual Studio Code terminaali]({{ "/assets/images/python/vscode-terminaali.png" | absolute_url }})

Toinen, ehkä parempi tapa on seuraava: lisää hakemisto _unicafe_ Visual Studio Coden "workspaceen" _File_-valikon kautta, tallenna tämä workspace samaan _unicafe_-hakemistoon ja avaa Visual Studio Coden terminaali uudelleen. Valitse oikea virtuaaliympäristö Visual Studio Coden ikkunan oikeasta alareunasta (kun _maksukortti.py_ tai _kassapaate.py_ on avattuna). Tämän jälkeen testauksen tulisi onnistua. (Kurssin Ohjelmistotuotanto materiaalissa on aiheeseen liittyvä [esimerkki](https://ohjelmistotuotanto-hy.github.io/tehtavat2/#bonus-vs-coden-konfigurointi).)

## Coverage ja testikattavuus

Olemme tyytyväisiä, uskomme että testitapauksia on nyt tarpeeksi. Onko tosiaan näin? Onneksi on olemassa työkaluja, joilla voidaan tarkastaa testien rivi- ja haarautumakattavuus. _Rivikattavuus_ mittaa mitä koodirivejä testien suorittaminen on tutkinut. Täydellinen rivikattavuuskaan ei tietenkään takaa että ohjelma toimii oikein, mutta on parempi kuin ei mitään. _Haarautumakattavuus_ taas mittaa mitä eri suoritushaaroja koodista on käyty läpi. Suoritushaaroilla tarkoitetaan esimerkiksi if-komentojen valintatilanteita.

Koska haarautumakattavuus antaa tyypillisesti realistisemman kuvan testien kattavuudesta, käytämme kurssilla sitä testikattavuuden mittarina.

### Testikattavuusraportti

Testikattavuuden kerääminen testien suorituksesta onnistuu [coverage](https://coverage.readthedocs.io/en/latest/)-työkalun avulla. Sen asentamisen projektin kehityksen aikaiseksi riippuvuudeksi onnistuu tuttuun tapaan komennolla:

```bash
poetry add coverage --group dev
```

Testikattavuuden kerääminen `pytest src`-komennolla suoritetuista testeistä onnistuu virtuaaliympäristössä komennolla:

```bash
coverage run --branch -m pytest src
```

Komennon `--branch` flagillä pystymme keräämään testien [haarautumakattavuuden](https://coverage.readthedocs.io/en/latest/branch.html). Huomaa, että `pytest src`-komento rajaa testien etsinnän projektin juurihakemistossa sijaitsevaan _src_-hakemistoon. Komennon suorittamisen jälkeen voimme tulostaa komentoriville raportin kerätystä testikattavuudesta komennolla:

```bash
coverage report -m
```

Tulostuksesta huomaamme, että raportissa on suuri määrä projektin kannalta turhia tiedostoja. Voimme konfiguroida, mistä tiedostoista testikattavuutta kerätään projektin juurihakemiston _.coveragerc_-tiedostossa. Jos haluamme sisällyttää testikattavuuteen vain projektin _src_-hakemiston, on konfiguraatio seuraava:

```
[run]
source = src
```

**HUOM:** _src_-hakemiston **alahakemistoissa** (ei siis itse _src_-hakemistossa) tulee olla tyhjät <i>\_\_init\_\_.py</i>-tiedostot, jotta testikattavuuteen sisällytetään kaikki halutut tiedostot. [Referenssisovelluksessa]({{site.python_reference_app_url}}) tapauksessa <i>\_\_init\_\_.py</i>-tiedostot on lisätty seuraavasti:

```
src/
  entities/
    __init__.py
    todo.py
    ...
  repositories/
    __init__.py
    todo_repository.py
    ...
  services/
    __init__.py
    todo_service.py
  ...
```

### Tiedostojen jättäminen raportin ulkopuolelle

Voimme jättää testikattavuuden ulkopuolelle tiedostoja ja hakemistoja. Järkevää voisi olla esimerkiksi jättää testihakemisto, käyttöliittymän koodin hakemisto ja _src/index.py_-tiedosto testikattavuuden ulkopuolelle. Tämä onnistuu seuraavalla muutoksella _.coveragerc_-tiedostoon:

```
[run]
source = src
omit = src/**/__init__.py,src/tests/**,src/ui/**,src/index.py
```

Nyt komentojen `coverage run --branch -m pytest src` ja `coverage report -m` suorittaminen sisällyttää vain haluamamme _src_-hakemiston tiedostot.

### Visuaalisempi testikattavuusraportti

Komentoriviltä luettavaa raporttia selkeämmän esitysmuodon voi generoida komennolla:

```bash
coverage html
```

Komennon suorittaminen luo projektin juurihakemistoon hakemiston _htmlcov_. Raporttia voi katsoa selaimessa avaamalla hakemiston tiedoston _index.html_ selaimen kautta. Selaimessa aukeava raportti näyttää kutakuinkin seuraavalta:

![](/assets/images/python/coverage-raportti.png)

Raportista näemme, että koko koodin haaraumakattavuus on 95%. Yksittäisen tiedoston haaraumakattavuuden näemme taulukon "coverage"-sarakkeesta. Jos klikkaamme taulukosta yksittäisen tiedoston nimeä aukeaa tiedoston koodi ja testien siinä kattamat haarat. Katetut haarat näkyvät vihreinä palkkeina rivinumeron vieressä. Haarat, joita ei ole katettu ollenkaan, on korostettu punaisella värillä. Sen sijaan, jos haara on osittain katettu, se on korostettu keltaisella värillä. Viemällä hiiri rivin päälle, nähdään tarkempi selitys, miksi haaraa ei ole täysin katettu:

![](/assets/images/python/coverage-tiedosto.png)

Kuvan tilanteessa if-ehto ei koskaan saanut arvoa `True`, joten kyseistä haaraa ei testeissä käsitelty.

---
### Tehtävä 7: Testikattavuus

Unicafe-projektiin on valmiiksi konfiguroitu käytettäväksi [coverage](https://coverage.readthedocs.io/en/latest/)-työkalu, joka mittaa testien haarautumakattavuuden. Testikattavuuden konfiguraatiossa käytettävä, _.coveragerc_-tiedoston sisältö on projektissa seuraava:

```
[run]
source = src
omit = src/tests/**,src/index.py
```

Testikattavuuden kerääminen testeistä onnistuu virtuaaliympäristössä komennolla `coverage run --branch -m pytest src`. Komennon suorittamisen jälkeen kattavuusraportin voi muodostaa komennolla `coverage html`. Komennon suorittaminen luo projektin juurihakemistoon hakemiston _htmlcov_. Avaamalla hakemiston tiedoston _index.html_ selaimessa aukeaa seuraavan näköinen raportti:

![Testikattavuusraportti]({{ "/assets/images/python/unicafe-coverage.png" | absolute_url }})

Huomaa, että oma raporttisi tuskin näyttää täysin tältä (etenkin kattavuusprosenttien osalta) edellisten tehtävien testien toteutuksen jälkeen. Yksittäistä moduulia klikkaamalla näet punaisella korostuksella haarat, joita testit eivät kata vielä lainkaan ja keltaisella korostuksella haarat, joita testit kattavat vain osittain.

**Jos maksukortin koodissa on vielä rivejä tai haarautumia (merkitty punaisella) joille ei ole testiä, kirjoita sopivat testit.**

Jotta `coverage`-komennon generoimat tiedostot eivät päättyisi versionhallintaan, lisää _.gitignore_-tiedostoon vielä seuraavat rivit:

```
.coverage
htmlcov
```

### Tehtävä 8: Kassapäätteen testit

Laajennetaan unicafe-projektin testaus kattamaan myös kassapääte.

Tee testihakemistoon testitiedosto <i>kassapaate_test.py</i> ja sinne testiluokka `TestKassapaate`. Tee testit jotka testaavat ainakin seuraavia asioita:

- Luodun kassapäätteen rahamäärä ja myytyjen lounaiden määrä on oikea (rahaa 1000 euroa, lounaita myyty 0)
  - Huomaa, että luokka tallentaa rahamäärän sentteinä
- Käteisosto toimii sekä edullisten että maukkaiden lounaiden osalta
  - Jos maksu riittävä: kassassa oleva rahamäärä kasvaa lounaan hinnalla ja vaihtorahan suuruus on oikea
  - Jos maksu on riittävä: myytyjen lounaiden määrä kasvaa
  - Jos maksu ei ole riittävä: kassassa oleva rahamäärä ei muutu, kaikki rahat palautetaan vaihtorahana ja myytyjen lounaiden määrässä ei muutosta
- _seuraavissa testeissä tarvitaan myös Maksukorttia jonka oletetaan toimivan oikein_
- Korttiosto toimii sekä edullisten että maukkaiden lounaiden osalta
  - Jos kortilla on tarpeeksi rahaa, veloitetaan summa kortilta ja palautetaan _True_
  - Jos kortilla on tarpeeksi rahaa, myytyjen lounaiden määrä kasvaa
  - Jos kortilla ei ole tarpeeksi rahaa, kortin rahamäärä ei muutu, myytyjen lounaiden määrä muuttumaton ja palautetaan _False_
  - Kassassa oleva rahamäärä ei muutu kortilla ostettaessa
- Kortille rahaa ladattaessa kortin saldo muuttuu ja kassassa oleva rahamäärä kasvaa ladatulla summalla

Huomaat että kassapääte sisältää melkoisen määrän "copypastea". Nyt kun kassapäätteellä on automaattiset testit, on sen rakennetta helppo muokata eli refaktoroida siistimmäksi koko ajan kuitenkin varmistaen, että testit menevät läpi. Refaktoroi koodisi siistimmäksi jos haluat.

### Tehtävä 9: 100% testikattavuus

Varmista testikattavuuskomentojen avulla, että kassapäätteen testeillä on 100% haarautumakattavuus. Suorita siis virtuaaliympäristössä komennot `coverage run --branch -m pytest src` ja `coverage html`, jonka jälkeen avaa selaimessa _htmlcov/index.html_-tiedosto.

Jos testikattavuus ei ole vielä 100%, tee lisää testejä kunnes tilanne korjautuu. Tallenna edellisessä esimerkissä olevan testikattavuusraportin kuvan tyylinen [screenshot](https://www.take-a-screenshot.org/) projektisi kattavuusraportista palautusrepositoriosi hakemistoon _laskarit/viikko2_.

---
## Harjoitustyö

Kurssin pääpainon muodostaa viikolla 2 aloitettava harjoitustyö. Harjoitustyössä toteutetaan itsenäisesti ohjelmisto omavalintaisesta aiheesta. Tavoitteena on soveltaa ja syventää ohjelmoinnin perus- ja jatkokursseilla opittuja taitoja ja harjoitella tiedon omatoimista etsimistä. Harjoitustyötä tehdään itsenäisesti, mutta tarjolla on runsaasti [pajaohjausta](/#ajankohtaista).

Harjoitustyön on edettävä [viikottaisten tavoitteiden mukaan](/#aikataulu). Työ on saatava valmiiksi kurssin aikana ja sitä on toteutettava tasaisesti, muuten kurssi katsotaan keskeytetyksi. Samaa ohjelmaa ei voi jatkaa seuraavalla kurssilla (eli {{ site.next_course }}), vaan työ on aloitettava uudella aiheella alusta. Muista varata riittävästi aikaa (10-15h viikossa) koko periodin ajaksi.

Koko kurssin arvostelu perustuu pääasiassa harjoitustyöstä saataviin pisteisiin. Osa pisteistä kertyy [aikatauluun](/#aikataulu) määriteltyjen viikoittaisten välitavoitteiden kautta, osa taas perustuu työn lopulliseen palautukseen.

### Harjoitustyön kieli ja ohjelmointikieli

Harjoitustyön ohjelmointikieli on Python.

Web-sovelluksia kurssilla ei sallita. Sovelluksissa sallitaan toki webissä olevat komponentit, mutta sovelluksen käyttöliittymän tulee olla niin sanottu työpöytäsovellus.

**Ohjelmakoodin muuttujat, luokat ja metodit kirjoitetaan englanniksi**. Dokumentaatio voidaan kirjoittaa joko suomeksi tai englanniksi.

### Ohjelman toteutus

Toteutus etenee "iteratiivisesti ja inkrementaalisesti". Tämä tarkoittaa, että heti alussa toteutetaan pieni osa ohjelman toiminnallisuudesta. Ohjelman ydin pidetään koko ajan toimivana, uutta toiminnallisuutta lisäten, kunnes tavoiteltu ohjelman laajuus on saavutettu. Ohjelman rakenteeseen kannattaa kysyä vinkkejä pajasta, sekä ottaa mallia ohjelmoinnin jatkokurssin harjoitustehtävistä ja materiaalista. Muutamia vihjeitä on myös kurssin [referenssiprojektissa]({{site.python_reference_app_url}}) sekä [täällä](/fi/tasks/implementation).

Iteratiiviseen tapaan tehdä ohjelma liittyy kiinteästi automatisoitu testaus. Aina uutta toiminnallisuutta lisättäessä ja vanhaa muokatessa täytyy varmistua, että kaikki vanhat ominaisuudet toimivat edelleen. Kaiken testaaminen käsin uudelleen ja uudelleen ei ole ajankäytöllisesti järkevää, ja siksi ohjelmakoodille onkin syytä laatia jatkuvasti testejä ohjelmoinnin edetessä. Testit on syytä pitää kattavina ja ajan tasalla.

Jotta ohjelmaa pystyisi testaamaan, on tärkeää että sovelluslogiikkaa [ei kirjoiteta käyttöliittymän sekaan](/fi/tasks/implementation)!

Eräs mahdollisuus on tehdä aluksi tekstikäyttöliittymä ja vasta saatuasi ohjelman perustoiminnallisuuden toteutettua voit siirtyä graafisen käyttöliittymän toteutukseen. Graafinen käyttöliittymä on mahdollista myös jättää pois, mutta tämä [vaikuttaa arvosanaan](/fi/tasks/criteria). Graafisen käyttöliittymän toteutukseen löytyy ohjeita [täällä](/fi/tasks/tkinter). Pelin toteutukseen Pygame-kirjastolla löytyy ohjeita [täältä](/fi/tasks/pygame).

[Arvosanan kannalta suositeltavaa](/fi/tasks/criteria) on, että ohjelmasi tallettaa tietoa joko tiedostoon tai tietokantaan. Vihjeitä tiedon tallettamiseen [täällä](/fi/tasks/implementation#tietojen-tallennus).

Harjoitustyön tavoitteena on tuottaa ohjelma, joka voitaisiin antaa toiselle opiskelijalle ylläpidettäväksi ja täydennettäväksi. Lopullisessa palautuksessa on oltava lähdekoodin lisäksi dokumentaatio ja automaattiset testit.

Toivottava dokumentaation taso käy ilmi [referenssiprojektissa]({{site.python_reference_app_url}}).

### Hyvän aiheen ominaisuudet

- **Itseäsi kiinnostava aihe**
  - Innostava aihe auttaa huonoinakin hetkinä
- "Riittävän laaja"
  - Vältä eeppisiä aiheita, aloita riittävän pienestä. Yksi periodi on yllättävän lyhyt aika
  - Valitse kuitenkin aihe, jonka perustoiminnallisuuden saa toteutettua nopeasti, mutta jota saa myös laajennettua helposti
  - Hyvässä aiheessa on muutamia logiikkaluokkia, tiedoston tai tietokannankäsittelyä ja logiikasta eriytetty käyttöliittymä
- Kurssilla pääpaino on Ohjelmoinnin Perusteissa ja Jatkokurssilla opituissa asioissa
  - Käytettävyys
  - Toimivuus ja varautuminen virhetilanteisiin
  - Luokkien vastuut
  - Ohjelman selkeä rakenne
  - Laajennettavuus ja ylläpidettävyys
- **Tällä kurssilla ei ole tärkeää:**
  - Tekoäly
  - Grafiikka
  - Tietoturva
  - Tehokkuus
- **HUOMIO!** Kannattaa yrittää välttää aiheita, joissa pääpaino on tiedon säilömisessä tai käyttöliittymässä. Paljon tietoa säilövät, esim. yli 3 tietokantataulua tarvitsevat sovellukset ovat vaikeita testata tämän kurssin esitietovaatimusten puitteissa, ja ne sopivat yleensä paremmin kurssille Tietokannat ja web-ohjelmointi. Käyttöliittymäkeskeisissä aiheissa (esim. tekstieditori) voi olla vaikea keksiä sovelluslogiikkaa, joka on enemmän tämän kurssin painopiste (myös siksi koska käyttöliittymää ei tällä kurssilla testata ja testaus on kurssin keskeinen aihe - jos ei ole sovelluslogiikkaa, on vaikea myös kirjoittaa sille testejä)

### Esimerkkejä aiheista

Oman aiheen ei ole pakko olla allaolevasta listasta. Listassa on kuitenkin erilaisia esimerkkejä, joista voi toteuttaa oman versionsa.

- Hyötyohjelmat
  - Aritmetiikan harjoittelua
  - Tehtävägeneraattori, joka antaa käyttäjälle tehtävän sekä mallivastauksen (esim. matematiikkaa, fysiikkaa, kemiaa, ...)
  - Opintojen seurantajärjestelmä
  - Code Snippet Manageri
  - Laskin, funktiolaskin, graafinen laskin
  - Budjetointisovellus
  - HTML WYSIWYG-editor (What you see is what you get)
- Reaaliaikaiset pelit
  - Tetris
  - Pong
  - Pacman
  - Tower Defence
  - Asteroids
  - Space Invaders
  - Yksinkertainen tasohyppypeli, esimerkiksi The Impossible Game
- Vuoropohjaiset pelit
  - Tammi
  - Yatzy
  - Miinaharava
  - Laivanupotus
  - Yksinkertainen roolipeli tai luolastoseikkailu
  - Sudoku
  - Muistipeli
  - Ristinolla (mielivaltaisen kokoisella ruudukolla?)
  - 2048
- Korttipelit
  - En Garde
  - Pasianssi
  - UNO
  - Texas Hold'em
- Omaan tieteenalaan, sivuaineeseen tai harrastukseen liittyvät hyötyohjelmat
  - Yksinkertainen fysiikkasimulaattori
  - DNA-ketjujen tutkija
  - Keräilykorttien hallintajärjestelmä
  - Pelin hahmogeneraattori, joka tallentaa tiedostoon (esim. D&D hahmolomake)
  - Fraktaaligeneraattori

### Harjoitustyö 1: Alustava määrittelydokumentti

Harjoitustyön tekeminen aloitetaan päättämällä aihe ja kuvaamalla se _alustavassa määrittelydokumentissa_, eli työlle tehdään [vaatimusmäärittely](/fi/tasks/week1#vaatimusmäärittely).

Mikään ei tietenkään estä sitä, että aloitat jo ohjelmoinnin tai vaikkapa koodaat koko työn valmiiksi. Tämän viikon deadlinen pisteytyksessä ollaan kiinnostuneita ainoastaan määrittelydokumentista.

**HUOM:** jos aloitat jo ohjelmoinnin, muista että ohjelmakoodi tulee kirjoittaa englanniksi! Ohjelman käyttöliittymä ja dokumentaatio voivat olla suomeksi tai englanniksi. Ohjeet ohjelmoinnin aloittamiseen löytyvät [viikon 3](/fi/tasks/week3#harjoitustyö) materiaalista.

Palautus tapahtuu lisäämällä oman aiheen _alustava määrittelydokumentti_ ensimmäisen viikon [laskareiden](/fi/tasks/week1#labtool) päätteeksi [Labtooliin]({{site.labtool_link}}) rekisteröimääsi palautusrepositorioon.

Määrittelydokumentti tehdään samaan tapaan kuin [referenssiprojektissa]({{site.python_reference_app_url}}/blob/master/dokumentaatio/vaatimusmaarittely.md) eli [markdown](https://guides.github.com/features/mastering-markdown/)-muodossa. Sijoita _vaatimusmaarittely.md_-tiedosto repositorioon _dokumentaatio_-hakemistoon ja lisää repositorion _README.md_-tiedostoon _vaatimusmaarittely.md_ -tiedostoon vievä linkki.

Määrittelydokumenttiin kannattaa ottaa mallia [referenssiprojektista]({{site.python_reference_app_url}}/blob/master/dokumentaatio/vaatimusmaarittely.md), eli sen tulee sisältää:

- _Sovelluksen tarkoitus_ eli pieni tekstuaalinen yleiskuvaus sovelluksesta
- _Käyttäjät_ eli tieto erilaisista _käyttäjärooleista_, joita järjestelmässä on
  - Tosin jos sovelluksessasi on vain yhdenlaisia käyttäjiä, ei kohtaa tarvita. Näin lienee tilanne monissa harjoitustöiden aiheissa kuten peleissä.
- Suunnitellut toiminnallisuudet
  - Toiminnallisuudet voi kuvata ranskalaisina viivoina samaan tapaan kuin referenssiprojektissa
  - Referenssiprojektissa on kuvattu perusversion eli jo "kurssin alkupuolella" toteutettavan ydintoiminnallisuuden toiminnallisuudet tarkemmin
  - Perusversiota laajentavat jatkokehitysideat ovat omassa listassaan

Voit myös tehdä referenssiprojektin tapaan _käyttöliittymäluonnoksen_, se ei ole kuitenkaan pakollinen.

### Harjoitustyö 2: Työaikakirjanpito

Pidä säännöllisesti kirjaa käyttämistäsi työtunneista. Käytettyjen työtuntien määrä ei vaikuta arvosanaan, _mutta_ vajavaisesti pidetty työaikakirjanpito alentaa työn arvosanaa. **Tuntikirjanpitoon ei merkitä laskareihin käytettyä aikaa.**

Lisää repositorion _README.md_-tiedostoon linkki [työaikakirjanpitoon]({{site.python_reference_app_url}}/blob/master/dokumentaatio/tuntikirjanpito.md) ja sijoita tiedosto _dokumentaatio_-hakemistoon.
