---
layout: page
permalink: /en/release
title: GitHub release
---

One way to publish your project is by creating a GitHub release.

- On the GitHub page of your repository, click on the text that says "0 releases"
- Choose _Draft a new release_
- Provide information for the release
  - For the tag, use the current week. For example, a release during the 5th week should be tagged as `week5`
- If your program needs extra files or a specific command to run, you should mention thse in the text. Installation instructions must be in the `README.md` file of your repository.
- GitHub will automatically include your project's source code along with the release.

![Release](/assets/images/python/release.png)

Now, your code is easily downloadable by anyone by going to your GitHub repository, clicking on "1 release", and clicking the download button.
A user must be able to run your project by downloading the source code from the release and following the instructions in the `README.md` file.

You should manually test your code as follows: pretend you are a completely different user. Download the files in the release, and follow your instructions in the `README.md` file to try and run the program. Make sure the program runs as intended.
_Do not assume anything_, for example that the user knows that you need to put a certain file in a certain folder for the project to work. All such information must be in the README.
