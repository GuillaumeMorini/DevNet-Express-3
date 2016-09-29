# Some examples: 

### Nova
```
nova list
nova boot --flavor m1.large \
  --image centos7 --key-name \     
  tco-gold centos07-01
nova net-list
nova flavor-list
nova flavor-create r3.large 42 \   16384 32 2
```
### Glance
```
glance image-list
```

### Cinder
```
cinder list
```

