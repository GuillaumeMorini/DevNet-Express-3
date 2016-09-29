#!/usr/bin/env python
import os
from keystoneclient.v2_0 import client as keystone_client
from keystoneclient.auth.identity import v2 as keystone_auth
from keystoneclient import session as keystone_session
from novaclient.v2 import client as nova_client

os_auth_url =  os.environ.get('OS_AUTH_URL')
os_tenant_id = os.environ.get('OS_TENANT_ID')
os_tenant_name = os.environ.get('OS_TENANT_NAME')
os_username = os.environ.get('OS_USERNAME')
os_password = os.environ.get('OS_PASSWORD')

if os_auth_url == None: 
  print "Please set OpenStack environment variables.  E.g: source ~/ProjectName-openrc.sh"
  exit(0)

auth = keystone_auth.Password(auth_url=os_auth_url, username=os_username, password=os_password, tenant_name=os_tenant_name )
sess = keystone_session.Session(auth=auth)
c = keystone_client.Client(session=sess)
print "\nTenants"
print "================="

for tenant in c.tenants.list():
  print "Raw Tenant: %s" %  tenant
  print "Tenant Name: %s" %  tenant.name
  print "Tenant ID: %s" %  tenant.id
 
