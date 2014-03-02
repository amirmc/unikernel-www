Unikernel to serve static website for amirchaudhry.com

This is a test repo to get the travis workflow up and running.
Content is taken from the `mirage_skeleton` repo
(specifically, the `static_website` folder)


##################################################
# 
# Original README content
#

Put static files into the htdocs/ directory.

For a Xen DHCP kernel, do:

$ env DHCP=true mirage configure --xen
$ make
$ make run

edit `www.xl` to add a VIF, e.g. via:

```
vif = ['bridge=xenbr0']
```

And then run the VM via `xl create -c www.xl`
