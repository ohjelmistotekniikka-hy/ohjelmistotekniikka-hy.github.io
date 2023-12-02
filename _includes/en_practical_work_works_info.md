## Make sure the project works as intended

**NOTE:** In order to receive weekly points for the assignment, the application must work on the university's computer and the TAs must be able to run your code on them! You can test this on any [Cubbli](https://helpdesk.it.helsinki.fi/ohjeet/tietokone-ja-tulostaminen/tyoasemapalvelu/cubbli-helsingin-yliopistossa) computer, such as the freshers' laptop, or on the computers in your institution's computer classes. You can also test on a [virtual workstation](https://vdi.helsinki.fi) using either a browser or the VMWare Horizon client.

In the virtual workstation, testing of your own application can be done using the browser as follows:

1. Log into [virtual workstation](https://vdi.helsinki.fi/portal/webclient/#/home) and select Cubbli Linux
2. Start the terminal and check the version of Python in use with the command `python3 --version`. If the version is below 3.8, update the version using the instructions [here](/en/tasks/implementation)
3. Make sure that Poetry is installed by running `poetry --version`. If the installation is missing, follow [these](/en/tasks/week2) Linux installation instructions
4. Clone your repository to the directory of your choice using the `git clone` command
5. Go to your project's directory and install the dependencies using the `poetry install` command. Note that the command must be run in the directory where the `pyproject.toml` file is located.

If the connection to the virtual workstation fails, you should try another browser. Users have reported that at least Google Chrome works quite well. Installing [VMWare Horizon Client](https://customerconnect.vmware.com/en/downloads/info/slug/desktop_end_user_computing/vmware_horizon_clients/horizon_8) may also help.

**Note:** If you are running an application which uses an SQLite database on a virtual desktop, you may encounter the error `database is locked`. You can probably fix the issue by following [these](/en/tasks/implementation) instructions.