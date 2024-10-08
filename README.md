A widget that resets it's child on request.

A reset goes like:
1. Child is replaced with a resetWidget (defaults to a loading spinner with opaque background).
2. 1 second passes.
3. child is reintroduced, it's state reset (disposed->init'd).

Request a reset like this:

```dart
context.read<Reset>().value();
```
