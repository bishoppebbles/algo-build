# algo build

Bash script to automate most of the `algo` Ubuntu deployment instructions documented by [Trail of Bits](https://github.com/trailofbits/algo).  This is for the deployment option to run `algo` on your own Ubuntu server (option 12).

## Usage

```shell
# copy the build script to your algo server
scp -i .ssh/algo.pem algo_build.sh root@<server_ip>:/root

# connect to the algo server
ssh -i .ssh/algo.pem root@<server_ip>

# run the build script
chmod 744 algo_build.sh
./algo_build.sh

# copy the config files locally
scp -i .ssh/algo.pem -r root@<server_ip>:/root/algo/configs/<server_ip> ./
```
