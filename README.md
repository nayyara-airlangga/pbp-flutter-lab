# Assignment 7: Flutter Basic Elements

## Stateless and Stateful Widgets

To put it simply, stateless does not have a state and remains immutable during its lifetime, unless re-rendered due to an external change. In other words, a stateless widget does not depend on an internal state and it can only change contents if influenced by an external change. Stateful widgets themselves are immutable, but they have an internal state object which can influence the re-rendering of the widget's content, meaning the contents can change depending on the internal state of the widget as well as from external changes.

## Widgets I used directly

1. `Center`: Aligns a child widget to the center of the available space occupied by `Center` itself.
2. `Row`: Positions children widgets on a horizontal axis.
3. `Visibility`: Controls the visibility of its child widget.
4. `Text`: Renders a block of text on the screen.
5. `FloatingActionButton`: A floating button on the screen, usually on the bottom of the screen used to trigger a particular event.

## `setState` and what it does

`setState` is a way to change a widget's internal state which will trigger a rebuild of the widget and its children. The variables that are affected during a state change are the ones being changed inside of the function body `setState` receives.

## `const` and `final`

Both are used to say that a variable will be immutable. The difference is in the strictness. `const` requires that the value of its variable be known at compile time. It signifies a constant. `final` allows the variable to have a value that is computed during runtime, but will make the variable immutable for the rest of its lifetime. `final` is suitable for values that we want to make immutable after its initial assignment.

## Implementation details

1. Create the app using `flutter create counter_7`.
2. Rename `title` property in `MyHomePage`.

    ```dart
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Program Counter'),
    );
    ```

3. Add logic for the `GANJIL` and `GENAP` text rendering.

    ```dart
    children: <Widget>[
      Text(
        _counter % 2 == 0 ? 'GENAP' : 'GANJIL',
        style: TextStyle(
            color: _counter % 2 == 0 ? Colors.redAccent : Colors.blueAccent,
        ),
      ),
      Text(
        '$_counter',
        style: Theme.of(context).textTheme.headline4,
      ),
    ],
    ```

4. Add `_decrementCounter` function which will decrement the `_counter` variable.

    ```dart
    void _decrementCounter() {
      if (_counter > 0) {
        setState(() {
          _counter--;
        });
      }
    }
    ```

5. Update the `floatingActionButton` property of the `Scaffold` to have the button to decrement the counter.

    ```dart
    floatingActionButton: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Visibility(
            visible: _counter > 0,
            child: FloatingActionButton(
              onPressed: _decrementCounter,
              tooltip: 'Decrement',
              child: const Icon(Icons.remove),
            ),
          ),
          FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
        ],
      ),
    ),
    ```

6. Commit changes and push to the remote repository.
