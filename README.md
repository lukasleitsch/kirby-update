## Update multiple Kirby sites with one script

Kirby Update is a bash script that allows updating multiple kirby sites. The bash script checks out the current version of kirby and the panel from GitHub. After the checkout the changes will be commited and kirby and the panel folder synchronize to the server via rsync. To make the skript working, it is required that Kirby and the panel are  included as git submodule into your project. You don't know git submodule? Read the article [Work with Git](https://getkirby.com/docs/cookbook/working-with-git) especially the section *Updating Kirby*.

For each site is one config file necessary. The config files are located in `config.d`. In this folder you find an example. The script runs over all the config files and kirby will be updated. While running, the script stops and you can review the site. First local and than on the live server.

The rsync use aliases and ssh keys for the server. You have to add the server´s SSH files in `~/.ssh` with the following syntax:

```
Host leitsch
	HostName <IP or DOMAIN>
	Port 22
	User <USERNAME>
```

In this example is `leitsch` the alias name of the server. The alias is necessary in the config file. Create a new config file for one site and change the setting to your environment. 

And now have fun with the easy way to update multiple kirby sites.