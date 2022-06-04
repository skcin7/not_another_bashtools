# Not Another BashTools!

**What Is `Not Another BashTools!`?:** A suite of utilities and tools to help make life using the bash shell easier.

**Public Git Repository:** [https://github.com/skcin7/not_another_bashtools](https://github.com/skcin7/not_another_bashtools)

NOTE: The public git repository is hosted at GitHub. Thank you to GitHub for providing it.

## How To Install

Installation is easy!

Step 1) Use the following one-liner to install it to your home directory (which uses `curl`):

```shell
cd ~ && mkdir -p .not_another_bashtools && curl -L https://github.com/skcin7/not_another_bashtools/raw/master/dist/v0.0.1-alpha.tar.gz | tar -xz -C .not_another_bashtools
```

Step 2) Add the following code to your `.bash_profile` or `.bashrc` file:

```shell
#
# Specify the path where Not Another BashTools! is located.
# The default path is `$HOME/.not_another_bashtools/` (in your home directory), but you may configure it to be wherever you like.
#
export NABT__PATH="$HOME/.not_another_bashtools"

#
# Add any custom configuration by use of the `nabt.ini.bash` file.
# This is optional, though if no initialization is provided, then default configuration is used.
# The custom configuration in this file overrides the default configuration for any of the variables set and uncommented.
#
source "${NABT__PATH}/nabt.ini.bash"

#
# This is what actually bootstraps (initializes) Not Another BashTools!
# Each time you create a new bash session, NABT will initialize.
# Normally the bootstrapping occurrs automatically, whenever you create a new bash session. You may optionally turn auto-bootstrapping off (in the initialization) in which case you will need to initialize it manually in each bash session you are in.
#
source "${NABT__PATH}/nabt.bootstrapper.bash"
```

That's it! Now Not Another BashTools! should be installed and ready to be used by you!

## Custom Configuration

Inside the `nabt.ini.bash` file, you will find several configuration variables which you can custom configure based on your needs.

* `NABT__GREETNAME` - The name that you get greeted by each time you open a new bash session. Omit this and a default greeting is used.
* `NABT__AUTOBOOTSTRAP` - Whether to automatically bootstrap (initialize) NABT each time you open a new bash session. If set to false, you must manually initialize NABT by running the `nabt__bootstrap` command.
* `NABT__VERBOSE` - Whether to print messages verbosely to the terminal. Set to false for silent mode.
* `NABT__CODE_COMMAND` - The default program you use to open/view/execute code. Should be a standard plain text editor, such as `vi`, `nano`, `subl`, or your default editor of choice for code.
* `NABT__UTILITIES` - Array of NABT utilities to be included each time it bootstraps. You may optionally include/exclude whichever utilities you want, simply by commenting in/out the ones you want to use/not use.

## How To Use

Not Another BashTools! comes with 2 special directories: `bin/` and `sh/`. Store binaries in `bin/` and shell scripts in `sh/`. They will be available to run via command line automatically.

The `inspire.sh` script comes built in. To run it, simply type `inspire.sh` in any bash session you are in, to be inspired with an inspirational message.

## Available Utilities

Not Another BashTools! comes with a bunch of utilties, which are available for you to use right out of the box. You comment in/out (in the custom configuration `nabt.ini.bash` file) the specific utilities that you want to use/not use.

* `nginx_helpers` - Helper methods for managing local NGINX web server environment.
* `parse_git_branch` - Parses the current directory to check if it's a git repository, and if so it prints the branch name directly in the terminal as you use it. Super handy for those that use `git` for source code control management.
* `php_helpers` - Helper methods for managing PHP environments, including switching PHP versions easily.

## Contributing

To contribute, create an issue in the Not Another BashTools! repository that is publicly hosted on GitHub. We can respond to the issue there. Thank you in advance for helping to make Not Another BashTools! a little bit better.

Thank you for using Not Another BashTools! I hope it has come in handy for you.

Bye!

~~ Nick