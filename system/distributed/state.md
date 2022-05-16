# Local
$$
DeltaEvent_{LR}=getDelta(LocalState,RemoteState) \\
=getTrack(VersionHash_{Local},VersionHash_{Remote})
$$

* LocalSync
$$
pull(VersionHash_{Origin},VersionHash_{Remote})
push(VersionHash_{Local},VersionHash_{Remote})
$$
> push(LR),pull(OR)

* FollowerPush
$$
push(VersionHash_{Local},VersionHash_{Remote})
$$
# Origin
{History,Head}
$$
DeltaEvent_{RO}=getDelta(OriginState,RemoteState) \\
=getTrackFromRemote(VersionHash_{Origin})
$$
