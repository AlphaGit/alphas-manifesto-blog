I absolutely love the Stack Exchange forums. I am even subscribed to some of the newsletters, not only because they inform me, but also because they challenge what you know.

And here's the perfect example. [Can we get the inverse of the function that a neural network represents?](https://ai.stackexchange.com/q/17566/190). The obvious answer is "mostly, no, information is lost in the process".

But the community is amazing, and they answered the _right_ question: what if it _was_ possible?

And there's a gold nugget behind that assumptions.

<!-- more -->

Explain: neural networks, how they loose information. Example with CNNs.

How sometimes they preserve, only compress, information. Example with AutoEncoders.

Adversarial attack analysis, and how inveritibility would help. Explainability and how invertibility would help. Legal aspects, how invertibility would help.

Characteristics that a NN needs to have to be invertible. Monotonic. Information preservation, information loss. Information preservation maps input to output (and so, output to input). Information loss maps sets of input to output. Hence, output to sets of inputs.

Maybe NNs cannot be inverted as functions, but approximated as other kind of functions. This is how IBM creates explainability: they train a network that explains ("interprets") the behavior of another one and they evolve together. If the process could be mechanical, there wouldn't be approximation or guessing -- we could actually run a formula that would explain how NN outputs are mapped to spaces of inputs.
