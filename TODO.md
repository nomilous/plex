Todo
====

* Properly disconnect (clean up tree)
* Properly disconnect on failed secret

* Label each node ( name )
* Maintain Routing knowledge in tree (which node contains the 'label'd subnode)

* Tag each node (allow multiple tags per node)
* Maintain Routing knowledge (for broadcast to all with 'tag')

* modify proxy_reconnect / remote_edge_change to properly propagate nested changes that ocurred while the rootward link was severed such that new or departed leaves are not known to the root (it makes sense to only propagate globalid/label/tags more than one tier rootward)