---
layout: page
permalink: /en/tasks/week1
title: Week 1
---

{% include en_deadline_info.md deadline=site.en_wk1dl %}

You will get 1 point for returning this week's exercises.

## About the course

This is a new English translation of the Finnish software development project course. Please report any issues to the teacher or directly on GitHub. Instructions are at the bottom of the page!

After completing the course, you will
- Know the process behind software development
- Be familiar with the waterfall and agile model of software development
- Be able to use version control for software development
- Be able to use the UML-modelling technique for requirements specification and project planning
- Be familiar with the different steps behind testing
- Be able to implement automated tests for simple software projects
- Know the principles behind software plannign and be able to apply them to simple projects

The prerequisites for the course are Computing Tools for CS students, Advanced Course in Programming, Introduction to Databses as well as Databases and Web Programming. As all of these courses are not available to English-speaking students, it is OK to participate in this course without having met all of the prerequisites.

During the first three weeks, you will get to practice unit testing and making UML diagrams. There will also be tasks concerning version control, but these are optional if you have done the proper prerequisite courses. You will start your own project work during week 2. The project work will bring most of the grade for this course, and there is no exam. You can find the criteria for this course [here](/en/tasks/criteria).

{% include en_material_engineering.md reference_app_url=site.python_reference_app_url %}

---

## First week's tasks

Read the tasks under the **"Command line basics"** and **"Version control"** sections.
If you are familiar with everything covered there, you do not need to do these tasks.
**If you at all doubt your skills, do all of the tasks in each section!** You will not get points for this; however, you will be using these skills throughout the course. Thus, you need to be very familiar with how these basics work in order to succeed in the upcoming weeks.

In case you are already familiar with the two section, **you must still do the following**:
1. Create a local Git repository for your practical work and weekly exercises. You can call it `software-development-project`, for example.
2. Create a `README.md` file in your repository. Give it the title "Software development, practical work" and write a one-sentence description of your project (this can later change, of course). Format the document using Markdown, so that there is some **bolded** and _italic_ text.
3. Create a subdirectory with the name `exercises` and add a file called `week1.md`. Write in this file that you are already familiar with the command line and version control.
4. Add and commit all of the files to your repository
5. Create a GitHub repository
6. Push your local repository to it
7. Edit the `README.md` file on GitHub and add a link to the `laskarit` folder to it.
8. Register your personal information and the GitHub repository link in [Labtool]({{site.labtool_link}}).

(To get the first week's exercise points, it is enough to do the above. If you do not know how to do the above, follow the instructions below, which will guide you through the whole process.)

If you've skipped the first week, you can already start reading the tasks of week 2. However, note that these will only be graded during the second week's submission; do not do them now.

## Command line basics (do this if you are not familiar with the tasks)

While there are many graphical interfaces these days, it's extremely important that every programmer knows how to use the _command line_ or _terminal_.
If you have never used the terminal, you can find a good introduction [in the Computing Tools for CS Studies course](https://tkt-lapio.github.io/command-line/). You should look through tasks 1-13 to get a good grasp of the concepts needed.

After this task you should be familiar with the following:

- Root directory
- Home directory
- Parent directory
- Child directory
- Working directory
- .. and \*

In addition, you will need to know what the following commands do:

- `pwd`
- `cd`
- `ls`, `ls -a`, `ls -l`, `ls -t`
- `mkdir`
- `touch`
- `cp`
- `rm`, `rm -r`
- `mv`

You will need to know how to use the command line during this course and in your future studies.

### Task 1: Command line practice

The [second part of the Computing Tools material](https://tkt-lapio.github.io/git-en/) can be of use here as well.

Create an ssh connection to `melkki.cs.helsinki.fi`, `melkinpaasi.cs.helsinki.fi`, or `melkinkari.cs.helsinki.fi`. On Linux, Mac, and Windows 10 this is achieved by opening the command line and running `ssh username@address`. On older Windows versions you will need to install [putty](http://www.putty.org).

After you have connected, do the following:

- Create a `courses` folder in your home directory
  - **Note:** some people may get a 'permission denied' error. If this happens, contact _it-support@cs.helsinki.fi_ and tell them that you have "no permissions to the home directory on Melkki"
  - Try also logging into another server, e.g. `melkinpaasi.cs.helsinki.fi`
- Create a `softwaredev` folder under `courses`
- Create a `week1` folder under `softwaredev`
- Go back to your home directory and create a `temp` folder there
- Go into the `temp` folder
- Get the file at the `https://raw.githubusercontent.com/ohjelmistotekniikka-hy/ohjelmistotekniikka-hy.github.io/master/material/en_unicafe.zip` address using [wget](https://en.wikipedia.org/wiki/Wget)
  - Wget works by giving it the URL as a parameter
- Extract this zip file using the `unzip` command
  - This also works by giving it the filename to unzip as a parameter
- After running the program, there should be a `unicafe` folder
- Move the folder to be under `courses/softwaredev/week1`
- Delete the zip-file
- Delete the `temp` folder

**Go to the _home folder_ and run the command _tree courses_. Copy-paste this to a safe place, you will need it later.**

### Tab completion

You should **always use tab completion when possible**! The tab key looks something like this:

![](https://github.com/mluukkai/otm2016/raw/master/img/tab.jpg)

By pressing tab, you can complete a command or parameter name so that you don't have to write it yourself.
For example, if you are changing into a directory called `software_development_spring_2024_final_submission_1`, it is enough for you to write `cd sof` and press tab. If there are no other files or folders starting with `sof` in the same directory, then the name will autocomplete. If there are, you may have to write a few more letters. You can also see all the different options by pressing tab multiple times.

You can also autocomplete command names using tab completion. For example, to open the `chromium-browser` app, you can write `chro` and press tab. The full name autocompletes.

You should also use the **up arrow** to cycle through the previous commands you have typed.

### Terminal tabs

You can open multiple terminal tabs by clicking around in the terminal menu or by simply typing `CTRL+SHIFT+TAB`.

## Version control (do this if you are not familiar with the tasks)

We will now learn about version control.

What is version control? A quote from [https://www.atlassian.com/git/tutorials](https://www.atlassian.com/git/tutorials):

> Version control systems are a category of software tools that help a software team manage changes to source code over time. Version control software keeps track of every modification to the code in a special kind of database. If a mistake is made, developers can turn back the clock and compare earlier versions of the code to help fix the mistake while minimizing disruption to all team members.

While the above talks about software development teams, you should always use version control even if you are coding on your own.
This is very useful for having versions of both your code and of non-code files, such as documentation.
In this course, you will be storing everything in version control.

The most popular modern version control system is [git](https://git-scm.com). Let's get familiar with how it works!

**Note:** You must do these tasks on a computer with Git installed. This is the case on most Linux and Mac systems. If unsure, you can check whether it's installed by running the following command in your terminal:

```bash
git --version
```

If this does not output a version number, follow the [Git installation instructions](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git). On Windows, it is easiest to just use [Windows Subsystem for Linux](https://tkt-lapio.github.io/en/#windows-subsystem-for-linux).

If the git version is less than 2.23.0, you will not be able to use the `git restore` command in the upcoming sections. You can still use the `git reset HEAD` and `git checkout` commands, however. Further information can be found in the [Computing Tools material](https://tkt-lapio.github.io/git-en/).

### Task 2: Configuring Git

Open the terminal on your own computer. **The following is done locally on your computer, NOT on Melkki!**

Tell Git **your username** and **email** by running:

```
 git config --global user.name "Your Name"
 git config --global user.email you@example.com
```

Ensure that the configuration is correct by running `git config -l`.

Tell Git to use colours using `git config --global color.ui` and **set the default text editor to Nano** using `git config --global core.editor nano`

If you prefer using Vim, you can leave the latter unchanged.

Also, run the following command:

```
git config --global push.default matching
```

This will change how the `git push` command behaves. More on this later.

### Task 3: Repository

Make a folder for practicing to use Git and move into it:

- `mkdir git_practice`
- `cd git_practice`

**Note:** ensure that there is nothing in the folder by running the `ls` command. This should output nothing.

Create a local git repository by running `git init`.

Git will tell you that it has initialised a repository:

```
user@computer:~/git_practice$ git init
Initialised empty Git repository in /home/ad/fshome4/u4/m/user/Linux/git_practice/.git/
```

Now, if you run the `ls -la` command, you should see that a new `.git` folder has appeared.
Git uses this folder for all of it's internal functionality; don't touch it. 

**Note:** since the folder name (`.git`) starts with a dot, the `ls` command will not show it by default. Try seeing how the `ls -l` and `ls -la` commands differ from each other!

Remain in the `git_practice` directory.

Make a new file called `file.txt`, e.g. by running `touch file.txt`. After this, run the `git status` command:

```
user@computer:~/git_practice$ touch file.txt
user@computer:~/git_practice$ git status
On branch master

No commits yet

Untracked files:
  (use "git add <file>..." to include in what will be committed)

	file.txt

nothing added to commit but untracked files present (use "git add" to track)
user@computer:~/git_practice$
```

Git will tell you that there is a file that is _untracked_, which means that it hasn't been added to version control yet.

Let's follow the instructions (...to include in what will be committed) and run `git add file.txt`.

Then look at the status again with `git status`:

```
user@computer:~/git_practice$ git add file.txt
user@computer:~/git_practice$ git status
On branch master

No commits yet

Changes to be committed:
  (use "git rm --cached <file>..." to unstage)

	new file:   file.txt
```

Git now tells you that the file has been added and is ready to be _committed_.

### Task 4: Commits

By committing, you are adding the changes you have made to the git repository.

Let's commit by running the command `git commit -m "Create file.txt"`

```
user@computer:~/git_practice$ git commit -m "Create file.txt"
[master (root-commit) 0e12cfa] Create file.txt
 1 file changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 file.txt
```

Run `git status` again:

```
user@computer:~/git_practice$ git status
On branch master
nothing to commit, working tree clean
```

Git tells you that the working tree is clean, which means that all of the changes have been committed and that your real directory is the same as what Git has stored in its memory.

### Task 5: Working directory, index and staging

**Remember to use tab completion and the up arrow!**

When you make changes to files, these are reflected only in your _working directory_ (i.e. the computer's file system).

- Make a change to file.txt
  - Use the command `nano file.txt` to open an editor and write a few lines of whatever text you want
  - Save by pressing `CTRL+O`
  - Close by pressing `CTRL+X`
- Make a new file called `second.txt`

Run `git status`:

```
user@computer:~/git_practice$ git status
On branch master
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git restore <file>..." to discard changes in working directory)
	modified:   file.txt

Untracked files:
  (use "git add <file>..." to include in what will be committed)

	second.txt

no changes added to commit (use "git add" and/or "git commit -a")
```

Git now tells you, that there is a new _untraced_ file and that there are changes to an already tracked file, that are not yet _staged for commit_.

Let's add all of our changes to the staging area. You can do a bulk-add of all the files in the folder by running `git add .`

Run `git status` again:

```
user@computer:~/git_practice$ git status
On branch master
Changes to be committed:
  (use "git restore --staged <file>..." to unstage)
	modified:   file.txt
	new file:   second.txt
```

Now both the changes in the old file and the new file are ready to commit.

You can commit your changes again using the `git commit` command. As before, you must give it a _commit message_ which is a string that tells people what changes you have made:

`git commit -m "Add second.txt and change file.txt"`

Run `git status` again.

**Note:** if you forget to put `-m "Commit message"`, Git will open a text editor and will assume that you want to write a commit message there. If you did not change the editor in the beginning, you will find yourself inside _vim_ and will probably need to Google how to get out of it.

Files and changes to them can be in _three different states_ according to Git.

- First, files and their changes are only on the _working directory and Git does not see them until you run the `git add` command on them
- After this, the files are ready to commit. In Git terms, the changes that are ready to commit are in the _staging area_.
- The `git commit` command moves the changes from the staging area to the repository and creates a new _commit_. Every commit has a message that describes what changes have been made.

The following picture describes the whole process:

![](https://github.com/mluukkai/otm2016/raw/master/img/lh3-2.png)

### Git log

Each new `git commit` creates a new commit, or a new state for your repository.
We can view a list of past commits by running `git log`:

```
user@computer:~/git_practice$ git log
commit 6aff75ab51d14d7cb9a72867ba13d9782d06c7ff (HEAD -> master)
Author: Matti Luukkainen <mluukkai@iki.fi>
Date:   Sun Oct 7 19:33:32 2018 +0300

    Add second.txt and change file.txt

commit 9e6a83d058c9564e8a390f8766845d45b365f360
Author: Matti Luukkainen <mluukkai@iki.fi>
Date:   Sun Oct 7 19:32:12 2018 +0300

    Create file.txt
user@computer:~/git_practice$
```

Git's log tells you every commit's time, author, message, and _hash_. We will use the hashes later to revert to previous versions of the repository.

You can navigate the log with the arrow keys, and exit by typing `q`.

### Task 6: Practice

Run the `git status` command as often as possible. Don't forget to tab complete!

- Create a file named `third.txt` and put some text in it
- Add and commit it
- Change the contents of `second.txt` and `third.txt` and commit the changes
- Create a new folder called `stuff` and add some files with text in it
- Add the changes and commit them
  - Note that it's enough to add the folder, all of the files inside it will then get added automatically
- Look at the git log

### Tehtävä 7: gitk

You can also view the git commits graphically using the `gitk` tool. This is optional.
This tool should work natively on Windows and Linux, and can be installed [like this on Mac](https://www.geekbitzone.com/posts/git/gitk-for-macos/).

![]({{ "/assets/images/lh3-1.png" | absolute_url }})

Here is a similar view on OSX's [Sourcetree](https://www.sourcetreeapp.com) app:

![]({{ "/assets/images/lh1-1a.png" | absolute_url }})

You can do the following tasks either using Gitk or using the terminal, in the same way you have done before. 

- Copy a load of text from somewhere online and paste it into `file.txt`
- Add and commit `file.txt`
- Remove part of the text and add some more text
- Add and commit `file.txt`
- You will be able to see the difference between the versions in Gitk or sourcetree. You can also view the difference in the terminal using the command `git diff HEAD~1`.

### Task 8: Deleting and renaming file

- Delete the `second.txt` file
- Run `git status`
- Commit the change
  - Instad of `git add`, you will need to run `git rm`
- Ensure that everything is as it should be using `git status`
- Rename `file.txt` to `first.txt`
  - You can rename a file using the `mv` command
- Run `git status`
  - How does Git treat renaming files?
- Commit the changes

### Task 9: git add -p

- Make a bunch of changes to `first.txt` and `third.txt`
  - Make both additions and deletions
- Add them to the staging area using `git add -p`
  - Git now shows every change separately in _patch_ mode and asks whether you want to add it to commit
  - Accept each one by pressing _y_ and enter
- Commit the changes
- Note that completely new files will not get added with `git add -p`

### Task 10: Undoing changes

Sometimes, you make changes to files and then realise you want to get rid of them completely.

- Make some change to `first.txt`, **do not** add it to the staging area
- Run `git status`

```
user@computer:~/git_practice$ git status
On branch master
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git restore <file>..." to discard changes in working directory)
	modified:   first.txt

no changes added to commit (use "git add" and/or "git commit -a")
```

As expected, git tells you that we have made changes that are not yet staged for commit.

- We now decide that we want to get rid of these changes. Run `git restore first.txt`
- When we run `git status` again, we notice that the changes are undone and that the working directory is clean:

```
user@computer:~/git_practice$ git restore first.txt
user@computer:~/git_practice$ git status
On branch master
nothing to commit, working trean clean
```

- Check again that the file contents have been restored

We can also undo a change that has been added, but not committed.

- Make changes to `third.txt` and add it to the staging area. **Do not** commit.
- The Git status should show the following:

```
user@computer:~/git_practice$ git status
On branch master
Changes to be committed:
  (use "git restore --staged <file>..." to unstage)

	modified:   third.txt

user@computer:~/git_practice$
```

We can see the undo instruction from git's output.

- Run `git restore --staged third.txt`, as the instructions say
- Let's look again at `git status`

```pre
user@computer:~/git_practice$ git status
On branch master
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git restore <file>..." to discard changes in working directory)

	modified:   third.txt

no changes added to commit (use "git add" and/or "git commit -a")
```

Now, the file is not staged, but it is in the working directory. We can reset it in exactly the same way as we did before:

- Run `git restore third.txt`
- Run `git status`
- Ensure that the file contents have actually been reset

Here is a diagram explaining the above process:

![]({{ "/assets/images/v1-RestoreGit.png" | absolute_url }})

### Task 11: Harjoittelua

- Make a `files` folder in your repository and inside it creat the files `file1`, `file2`, and `file3`
- Add different contents to each file
- Add and commit the changes
  - Remember how you can add a whole folder of files all at once
- Change the contents of `file1` and delete `file2`
- Undo!
- Change the contents of `file3`, add to the staging area
- Undo!
- Remove `file1` and rename `file2` to `file22`
- Add and commit

Finally, run the `git log --stat | cat` command and **copy-paste the output to a safe place**, you will need it later!

### Task 12: GitHub

All of the practice we have doen was on our local machine. However, for the purposes of this course, we will want to upload our code online for others to see. This is done easily using a [GitHub](https://github.com) repository.

Before continuing, create a new folder on your machine (**outside** of the git practice folder we were just using) called `software-development-project`. Go inside it and run `git init` to make a new repository.

**Note: do not create the new repository inside the practice repository we were using above!**

The following commands, when run from the home directory, create a new folder, initialise it as a git repository, and create a new empty file called `README.md` inside it, which is added and committed.

```
cd
mkdir software-development-project
cd software-development-project
git init
touch README.md
git add .
git commit -m "Initial commit"
```

Let's now move onto GitHub.

- Create a GitHub account if you do not have one already
- Create a new GitHub repository
  - You can find this under the plus symbol in the top-right corner
- **Do not select** the _Initialize this repository with a README_ option

![]({{ "/assets/images/lh1-2a.png" | absolute_url }})

- Create the repository by pressing the green _Create repository_ button

We now add the GitHub repository as a remote repository for our local repository.

- The instructions on GitHub will tell you exactly how to do this
- Ensure that the "Quick setup..." section has **SSH** selected

![]({{ "/assets/images/lh1-3a.png" | absolute_url }})

- Copy the first line from the _...or push an existing repository from the command line_ section
- In my own example, the command is the following:

```bash
git remote add origin git@github.com:mluukkai/ot-harjoitustyo.git
```

- Paste this onto the command line and run by pressing enter
- Run `git remote -v`
- This will tell you that the GitHub repository has been added under the name `origin`

```bash
user@computer:~/ot-harjoitustyo$ git remote  -v
origin	git@github.com:mluukkai/ot-harjoitustyo.git (fetch)
origin	git@github.com:mluukkai/ot-harjoitustyo.git (push)
```

- `origin` is just the default name for a remote repository. You could have named it anything you like.
- We can upload our current repository state to GitHub using the `git push` command
  - On the first time, you may also need to append `--set-upstream origin master` or `--set-upstream origin main` to the end of the push command
- Let's try!

```bash
user@computer:~/ot-harjoitustyo$ git push --set-upstream origin master
Warning: Permanently added the RSA host key for IP address '192.30.253.112' to the list of known hosts.
Permission denied (publickey).
fatal: Could not read from remote repository.

Please make sure you have the correct access rights
and the repository exists.
```

### Tehtävä 13: Julkinen avain

Pushing does not work. GitHub wants to authenticate us using a public key, but we haven't told it what our public key is.

- Create a key by running `ssh-keygen`
  - You do not need to type anything else, just press enter when it asks you questions
- Your public and private keys are stored in the `.ssh` folder in your home directory
- Navigate to this directory and list the files
- The `id_rsa.pub` file contains your public key, which you need to copy
  - You can view the contents by running `cat id_rsa.pub`
- Run the `ssh-add` command
- Go to GitHub, click on your profile picture in the top-right corner, and select "Settings"
- Select _SSH and GPG keys_
- Create a new _SSH key_
  - Give it a title _title_ (e.g. "laptop key") and paste the contents of `id_rsa.pub` under the _key_ section
- Run `git push` again:

```
user@computer:~/ot-harjoitustyo$ git push
Counting objects: 3, done.
Writing objects: 100% (3/3), 213 bytes | 106.00 KiB/s, done.
Total 3 (delta 0), reused 0 (delta 0)
remote:
remote: Create a pull request for 'master' on GitHub by visiting:
remote:      https://github.com/mluukkai/ot-harjoitustyo/pull/new/master
remote:
To github.com:mluukkai/ot-harjoitustyo.git
 * [new branch]      master -> master
Branch master set up to track remote branch master from origin.
```

Now, pushing should work. Refresh your GitHub repository page to see the uploaded commits.

### Task 14: More files

- Make a folder named `exercises` in the new repository
  - Inside it, make a folder named `week1`
  - At the end of the command line practice, there was the following instruction: "Go to the _home folder_ and run the command _tree courses_. Copy-paste this to a safe place, you will need it later."
  - Make a file named `commandline.txt` inside of the `exercises/week1` folder. Paste the output of this `tree` command into this file.
  - At the end of the git practice section, you were told to store the output of `git log --stat | cat`
  - Make a file named `gitlog.txt` inside of the `exercises/week1` folder. Paste the output of this `git log` command into this file.
- Write some text in the README.md file
  - You must format it using the [markdown format](https://guides.github.com/features/mastering-markdown/)
  - Use the [markdown format](https://guides.github.com/features/mastering-markdown/) reference to write a title, some text, some bolded text, and some italic text
  - We will soon see it rendered on the screen
- Commit
  - Remember to add all the files first
- Push the code to GitHub using `git push`

### Task 15: Files in GitHub

- Go to your GitHub repository page
  - Or reload the page if you already have it open
- You will see your files here. The contents of your README.md file will be rendered below.
- You can edit file contents here directly by opening a file and pressing the pen symbol
- In the `README.md` file, add links that point to the `exercises/week1/commandline.txt` and `exercises/week1/gitlog.txt` files
  - You can get the file URLs by opening them in GitHub and simply copy-pasting the URL from the browser's address bar
  - You can make a link in Markdown by following [these instructions](https://guides.github.com/features/mastering-markdown/)
- Your repository should look more-or-less as follows:

![]({{ "/assets/images/lh1-4a.png" | absolute_url }})

If everything worked correctly, clicking the links inside the README file will take you to the correct files directly.

### Updating your local repository

- The changes we made on GitHub have created a new commit
- The remote repsitory is now _ahead_ of the local repository
- You can copy the changes from GitHub to your computer using `git pull`
- Do this and make sure the changes have actually been copied over

### Task 16: More GitHub

- Make a change to the local repository, for example by adding something to the README file
- Add and commit
- Upload the changes to GitHub using `git push`
- Ensure that the changes are visible
- Your local and remote repositories are now in the same state again

### Task 17: Desynchronisation

- Sometimes, you may make a change locally, and a change remotely. In this case, we say that the local and remote repositories are out of sync.
- Let's make this annoying situation happen on purpose
- Make a change to `README.md` locally, add and commit
  - **Do not** push this to GitHub
- Make a change to **some other file** than the README directly on GitHub
  - For example, make a small change to `gitlog.txt`
- Try to run `git push`
- You will get an error

```
user@computer:~/ot-harjoitustyo$ git push
To git@github.com:mluukkai/ot-harjoitustyo.git
 ! [rejected]        master -> master (fetch first)
error: failed to push some refs to 'git@github.com:mluukkai/ot-harjoitustyo.git'
hint: Updates were rejected because the remote contains work that you do
hint: not have locally. This is usually caused by another repository pushing
hint: to the same ref. You may want to first integrate the remote changes
hint: (e.g., 'git pull ...') before pushing again.
hint: See the 'Note about fast-forwards' in 'git push --help' for details.
user@computer:~/ot-harjoitustyo$
```

- You will probably encounter this in the future
- This is not a serious issue. As the changes have been made to **different files**, we can get off easy
- Let us try to pull the remote changes using `git pull`
- We will probably get the following error

```
hint: You have divergent branches and need to specify how to reconcile them.
hint: You can do so by running one of the following commands sometime before
hint: your next pull:
hint: 
hint:   git config pull.rebase false  # merge (the default strategy)
hint:   git config pull.rebase true   # rebase
hint:   git config pull.ff only       # fast-forward only
hint: 
hint: You can replace "git config" with "git config --global" to set a default
hint: preference for all repositories. You can also pass --rebase, --no-rebase,
hint: or --ff-only on the command line to override the configured default per
hint: invocation.
fatal: Need to specify how to reconcile divergent branches.
```

- Git will ask how we want to resolve the issue (you can find more info on the different methods [here](https://www.atlassian.com/git/tutorials/merging-vs-rebasing))
- Let us pick the first by running `git config pull.rebase false`
- Run `git pull` again
  - Pulling will create a new commit that resolves the issue
  - Save and exit out of the text editor
- Push these changes to GitHub
- The remote and local respositories are now in sync again

If the changes had been made to the same file, we would have gotten a merge conflict. These always need to be resolved manually, and are somewhat tought to deal with. We will not discuss merge conflicts deeper during this course.

To avoid merge conflicts:
- Before beginning to work on something, run `git pull` in your repository
- After you have finished working and committed all of your changes, run `git push` in your repository

By following these two simple steps, you will avoid 99% of all version control issues that can happen.

### More git

If you are interested in learning more, here are some good Git resources to try:

- <https://www.atlassian.com/git/tutorials/>
- <http://learngitbranching.js.org>
- <http://ohshitgit.com>

## Labtool

Register your personal information and repository link to [Labtool]({{site.labtool_link}}).
This is the way that the TAs can see your code and give you points for this week!

