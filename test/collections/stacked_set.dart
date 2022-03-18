import 'package:date_night/collections/stacked_set.dart';
import 'package:test/test.dart';

void main() {
  test('a new stack will be empty', () {
    var stack = StackedSet();
    expect(stack.isEmpty, true);
  });
  test('new items will be at the top of the stack', () {
    var stack = StackedSet<String>();

    var item = "hello";
    stack.add(item);
    expect(stack.top(), item);

    var secondItem = "hi there";
    stack.add(secondItem);
    expect(stack.top(), secondItem);
  });
  test('duplicate items will be moved to the top of the stack', () {
    var stack = StackedSet<String>();

    var item = "test";
    stack.add(item);
    stack.add("hello");
    stack.add(item);
    expect(stack.top(), item);
  });
  test('top will give the top of the stack', () {
    var stack = StackedSet<String>();

    stack.add("hello");
    var item = "test";
    stack.add(item);
    expect(stack.elementAt(0), item);
    expect(stack.top(), item);
  });
  test('pop will remove the top of the stack', () {
    var stack = StackedSet<String>();

    const item = "hi";
    const second = "hello";
    const third = "there";

    stack.add(item);
    stack.add(second);
    stack.add(third);

    stack.pop();
    expect(stack.top(), second);
    stack.pop();
    expect(stack.top(), item);
  });
  test('a valid index will return the item at that index', () {
    var stack = StackedSet<String>();

    const item = "hi";
    const second = "hello";
    const third = "there";

    stack.add(item);
    stack.add(second);
    stack.add(third);

    expect(stack[0], third);
    expect(stack[1], second);
    expect(stack[2], item);
  });
  test('an invalid index will throw a range error', () {
    var stack = StackedSet<String>();

    expect(() => stack[0], throwsA(const TypeMatcher<RangeError>()));

    const item = "hi";
    stack.add(item);
    expect(() => stack[1], throwsA(const TypeMatcher<RangeError>()));
    expect(() => stack[10], throwsA(const TypeMatcher<RangeError>()));
  });
  test(
    'for each will iterate over the items of the stack in order',
    () {
      var stack = StackedSet<String>();
      const bottom = "bottom";
      const middle = "middle";
      const top = "top";

      stack.add(bottom);
      stack.add(middle);
      stack.add(top);

      var idx = 0;
      for (var element in stack) {
        final actual = stack.elementAt(idx);
        expect(element, actual);
        idx++;
      }
    },
  );
}
