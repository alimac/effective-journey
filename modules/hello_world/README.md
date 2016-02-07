# Hello World module

## Module dependencies

* Drupal 7 core
* content type vocab hello world module

## Description

This module exposes a _Hello World_ block which by default will appear in
the _Sidebar second region_ of all _Hello World Article_ nodes. The content
of the block will include:

* _Hello World!_ block title in bold typeface
* list of links to _Hello World Article_ nodes taged with enabled terms of
the _Sections_ vocabulary

Additionally, when viewing a _Hello World Article_, the phrase "Content starts
here!" will appear in an italic typeface as the first line of content on
the page.

## Development approach

The approach I took for writing this module started with tests. To begin,
I built a Vagrant-based Drupal 7 environment, including a build script for
reinstalling Drupal 7. Next, I used Behat to write tests for steps 1-5
of the exercise. This allowed me to repeatedly test my assumptions, such
as whether the specified modules were installed, whether Bartik was set as
the default theme, and whether the requirements were met.

Writing Behat tests had several advantages:

* test scenarios meant less clicking around in the GUI (to generate terms or
nodes)
* it helped identify regressions and address them
* clearly marked acceptance criteria for each requirement
* allowed me to use Circle CI (with a private GitHub repo)

Throughout the development process I refactored the tests to add complexity.
For example, initially the _Hello World_ block appeared on every type of node.
After confirming that it did, I refined the test to check that the block only
appears on _Hello World Article_ nodes, and wrote code to that effect. This
allowed me to see incremental progress in the project, and feel confident as
a developer, knowing what the next steps were.

### Tools

* PhpStorm
* Vagrant
* Composer
* Coder and phpcs
* Behat, Mink and Drupal Extension
* Chrome developer tools
* GitHub and Circle CI

## Implementation approach

The module makes us of the following hooks:

* `hook_block_info`
* `hook_block_view`
* `hook_install`
* `hook_node_view`

### hook_block_info

Provides basic information about the block, including default region.

### hook_block_view

Displays the block. Contents come from a helper function which runs a database
query.

### hook_install

Sets the block visibility, so that it only appears on _Hello World Article_
content type nodes.

### hook_node_view

Displays the 'Content starts here!' message on _Hello World Article_ nodes.
Originally, I used `hook_page_alter`, but the code was less readable. I chose
to use `hook_node_view` because it resulted in less code and was easier to
read.
