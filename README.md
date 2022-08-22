# ansible-demo
A very simple and harmless ansible playbook for testing

# Important Notice

The vault password is `sup3rs3cr3t`. Of course, in normal situations, you are not supposed to it written down and unsecure -the only reason I'm doing this is because you won't be able to use the repository without knowing it!

# Running it

## Build docker image

First step is to build the docker image:

```shell
docker build -t ansible-demo .
```

Then you can run the script. The parameters are to run the demo playbook, but you can adapt to your needs.

```shell
./run_ansible.sh -i playbooks/inventory playbooks/playbook.yml
```
**IMPORTANT!** `172.17.0.1` is the default IP used to connect to the host from the container. This means we are running the playbook inside the container, but targeting the host, not the container itself.

