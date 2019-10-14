CL SWANK
==========

This is a temporary work-around to avoid the issue that CL doesn't work well in MacOS X Catalina.


# Usage

Pull the image and run a container:
```
docker run -d -p 10022:22 --name swank irixjp/cl-swank
```

Set password for root user:
```
docker exec -it swank bash
passwd
```


Connect ssh to the container with a local port forward:
```
ssh -N -f -p 10022 -L 4005:localhost:4005 root@localhost
```

Finaly, connect the port wiht `slime-connect -> localhost -> 4005`

