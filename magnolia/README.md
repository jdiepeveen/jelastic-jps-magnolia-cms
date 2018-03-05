[![Magnolia CMS](../images/magnolia_logo.png)](../magnolia)
## Magnolia CMS
The JPS package deploys an environment containing:

### Environment Topology

![magnolia-environment-topology](../images/magnolia-environment-topology.png)

### Specifics

Layer                |    Server   | Number of CTs <br/> by default | Cloudlets per CT <br/> (reserved/dynamic) | Options
-------------------- | ------------| :----------------------------: | :---------------------------------------: | :-----:
bl                   |   Nginx     |       1                        |           1 / 8                           | -
cp-author            |   Tomcat    |       1                        |           1 / 12                          | -
cp-public            |   Tomcat    |       1                        |           1 / 12                          | -
sqldb                |   Percona   |       1                        |           1 / 8                           | -

* bl - Load balancer
* cp - Computing node
* sqldb - Database 

### Deployment
In order to get this solution instantly deployed, click the "Get It Hosted Now" button, specify your email address within the widget, choose one of the [Jelastic Public Cloud providers](https://jelastic.cloud) and press Install.

[![GET IT HOSTED](https://raw.githubusercontent.com/jelastic-jps/jpswiki/master/images/getithosted.png)](https://jelastic.com/install-application/?manifest=https%3A%2F%2Fgithub.com%2Ftrimm%2Fjelastic-jps-magnolia-cms%2Fraw%2Fmaster%2Fmanifest.yaml)

To deploy this package to Jelastic Private Cloud, import [this JPS manifest](../../raw/master/manifest.yaml) within your dashboard ([detailed instruction](https://docs.jelastic.com/environment-export-import#import)).

More information about Jelastic JPS package and about installation widget for your website can be found in the [Jelastic JPS Application Package](https://github.com/jelastic-jps/jpswiki/wiki/Jelastic-JPS-Application-Package) reference.