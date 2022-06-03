# Not Another BashTools!

## Public Website

Git Repository: https://github.com/skcin7/not_another_bashtools

Public Website: https://skcin7.github.io/not_another_bashtools/

Both the repository and website are hosted at GitHub. Thanks to them for providing them.

## How To Use

Use the following one-liner to install it to your home directory (which uses `curl`):

```shell
cd ~ && mkdir -p .not_another_bashtools && curl -L https://github.com/skcin7/not_another_bashtools/raw/master/dist/0.0.1-alpha.tar.gz | tar -xz -C .not_another_bashtools
```

Now, add the following code to your `.bash_profile` or `.bashrc`:

```shell
#
# Specify the path where Not Another BashTools! is located.
#
export NABT__PATH="$HOME/.not_another_bashtools"

#
# Add any custom Not Another BashTools! configuration. This is optional, though if it is omitted, then default configuration will be used.
# The configuration set in this file overrides any of the default configurations.
#
source "${NABT__PATH}/nabt.ini.bash"

#
# This is what actually bootstraps (initializes) Not Another BashTools! each time you create a new bash session in your terminal.
#
source "${NABT__PATH}/nabt.bootstrapper.bash"
```

## Configuration

Inside the `nabt.ini.bash` file, you will find several configuration variables which you can change.

* `NABT__GREETNAME` - The name that you get greeted by each time you open a new bash session. Omit this and a default greeting is used.
* `NABT__AUTOBOOTSTRAP` - Whether to automatically bootstrap (initialize) NABT each time you open a new bash session. If set to false, you must manually initialize NABT by running the `nabt__bootstrap` command.
* `NABT__VERBOSE` - Whether to print messages verbosely to the terminal. Set to false for silent mode.
* `NABT__CODE_COMMAND` - The default program you use to open/view/execute code. Should be a standard plain text editor, such as `vi`, `nano`, `subl`, or your default editor of choice for code.
* `NABT__UTILITIES` - Array of NABT utilities to be included each time it bootstraps. You may optionally include/exclude whichever utilities you want, simply by commenting in/out the ones you want to use/not use.

## How To Use

Not Another BashTools! comes with 2 special directories: `bin/` and `sh/`. Store binaries in `bin/` and shell scripts in `sh/`. They will be available to run via command line automatically.

The `inspire.sh` script comes built in. To run it, simply type `inspire.sh` in any terminal window, to be inspired by having an inspirational quote printed out to you.

## Utilities

Not Another BashTools! comes with a few available utilties right out of the box. You comment in/out the ones you want to use/not use.

* `nginx_helpers` - Helper methods for managing local NGINX web server environment.
* `parse_git_branch` - Parses the current directory to check if it's a git repository, and if so it prints the branch name directly in the terminal as you use it. Super handy for those that use `git` for source code control management.
* `php_helpers` - Helper methods for managing PHP environments, including switching PHP versions easily.

## Contributing

To contribute... create an issue in the Not Another BashTools! GitHub repository page. We can respond to the issue there. Thank you in advance for helping to make Not Another BashTools! a little bit better.