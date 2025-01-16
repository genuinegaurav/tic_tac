import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketClient {
  IO.Socket? socket;
  static SocketClient? _instance;

  SocketClient._internal() {
    try {
      socket = IO.io('http://192.168.105.1:3000', <String, dynamic>{
        'transports': ['websocket'],
        'autoConnect': true,
      });

      // Debug listeners
      socket!.on('connect', (_) => print('Socket connected successfully'));
      socket!.on('disconnect', (_) => print('Socket disconnected'));
      socket!.on('connect_error', (error) => print('Connection error: $error'));
      socket!.on('error', (error) => print('Socket error: $error'));
    } catch (e) {
      print('Error initializing socket connection: $e');
    }
  }

  static SocketClient get instance {
    _instance ??= SocketClient._internal();
    return _instance!;
  }
}
