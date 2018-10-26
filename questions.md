What are these things?
======================

- Transitions decide gestures and direction of animators. They are specific to a pair of view controllers
    - Animators deal *only* with content. They animate it according to a timing.
    - Interatives translate gestures into timing.
- Container controllers combine custom controls with child view controllers
    - Their use of animators is custom coded
- Presentation decorates and defines the area of the screen used
    - This is only applicable between otherwise independent view controllers

Who decides which items are used?
=================================

- Child view controller transitions are determined entirely by container view controllers. Use of animators must be custom-coded, usually via delegates.
- All others are a variation of one controller "presenting" another controller.
    - Which side decides on the presentation?


What are the semantics?
=======================

- Navigation is about drilling down among options [list of headlines]
- Tabs are about separating navigation state among equals [random access]
- Pages are about transitioning through a sequence of equals, one or two at a time. [list of details]
- Master-Detail is about selecting an item in a list, and "zooming in" on it. [headline-detail]
- Popover is about uncovering minutia related to a small element. [magnify]

- "Modal" is a general term for "replaces current flow"
    - Specific subflow paradigms should be used, intentionally.

- iTunes "currently playing" is a specific presentation style

Presentation has a significant impact on what parts of the screen can be interacted with.


Container Controller vs Presentation
====================================

- Screen paradigm
