# application

bloc facade ACL

```dot
digraph{
    node [shape = hexagon]
    subgraph cluster0{
        label = Facade
        SendArticleBloc SendIdeaBloc SendArtBloc
    }
}
```

```dot
digraph{
    node [shape = hexagon]
    subgraph cluster0{
        label = SendBloc
        SendArticleEvent SendIdeaEvent SendArtEvent
    }
}
```

> Bloc.event,Bloc.State 不能调用Bloc

```dot
digraph{
    subgraph cluster0{
        label = SendBloc
        SendBloc[shape = hexagon]
        SendArticleEvent->SendBloc->SendState
    }
}
```

> Bloc 是 一个边界的概念
> x->f->y

> time->   space

# Domain
aggregate domain ACL

```dot
digraph{
    subgraph cluster0{
        label = Domain
        Domain[shape = hexagon]
        UseCase->Domain->Driven
    }
}
```
> 不能有UseCase调用Domain

# Query
...


GroupSendButton-> GroupToggleBloc ->
GroupArticleSendButton-> GroupArticleSendEvent -> GroupArticleSendBloc
-> NaviationState

end


ArticleEditStory->SendButton->SendEvent->SendBloc->
(SendUseCase)->SendDomain->SendUseDriven->
SuccessBloc.SendSuccessEvent -> SuccessBloc->ToastState,didSuccessEvent->PopState

