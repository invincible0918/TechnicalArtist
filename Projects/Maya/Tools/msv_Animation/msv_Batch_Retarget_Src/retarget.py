from blue.dcc.maya.core.msvAnimationRetarget import HIKCharacter, HIKSource, MetaRigDestination, MetaRigSource, BinderDestination
from Red9.core.Red9_Meta import getMetaNodes
from shared.dcc.maya.core.msvTime import get_current_time_range


rig = None
if getMetaNodes(mTypes='MsvMetaRig'):
    meta_nodes = getMetaNodes(mTypes='MsvMetaRig')
    for obj in meta_nodes:
        if obj.rigName == '{rig_name}':
            rig = obj

source_mapping = MetaRigSource.create_from_meta_rig(rig)
source_mapping.enable()

destination_mapping = BinderDestination.create_from_file('{binder_file}')
destination_mapping.enable()

MetaRigDestination.connect_mappings(source_mapping, destination_mapping)

start, end = get_current_time_range()
destination_mapping.bake_data(start=start, end=end)
