import 'package:moviedb/features/auth/AuthenticationService.dart';
import 'package:moviedb/features/comment/CommentService.dart';
import 'package:moviedb/features/post/PostService.dart';
import 'package:moviedb/features/user/User.dart';
import 'package:moviedb/features/user/UserService.dart';
import 'package:provider/provider.dart';

List<SingleChildCloneableWidget> providers = [
  ...independentServices,
  ...dependentServices,
  ...uiConsumableProviders
];

List<SingleChildCloneableWidget> independentServices = [
  Provider.value(value: UserService()),
  Provider.value(value: CommentService()),
  Provider.value(value: PostService()),
];

List<SingleChildCloneableWidget> dependentServices = [
  ProxyProvider<UserService, AuthenticationService>(
    builder: (context, userService, authenticationService) =>
        AuthenticationService(userService: userService),
  )
];

List<SingleChildCloneableWidget> uiConsumableProviders = [
  StreamProvider<User>(
    builder: (context) =>
        Provider.of<AuthenticationService>(context, listen: false).user,
  )
];
