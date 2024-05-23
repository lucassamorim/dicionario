import 'package:dicionario/app/core/http_client/dio/dio_client_impl.dart';
import 'package:dicionario/app/core/http_client/http_client.dart';
import 'package:dicionario/app/core/http_client/rest_client_exception.dart';
import 'package:dicionario/app/core/http_client/rest_client_request.dart';
import 'package:dicionario/app/core/http_client/rest_client_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

void main() {
  late Dio dio;
  late DioAdapter dioAdapter;
  late Client client;

  setUp(() {
    dio = Dio(BaseOptions());
    dioAdapter = DioAdapter(
      dio: dio,
      matcher: const FullHttpRequestMatcher(),
    );
    client = DioClientImpl(dio: dio);
  });

  test(
      'Deve retornar a palavar o map com a definição da palarave hello - Sucesso',
      () async {
    const path = 'https://pathteste.com.br/hello';
    dioAdapter.onGet(path, (server) => server.reply(200, word));
    final response = await client.get(RestClientRequest(path: path));
    expect(response, isA<RestClientResponse>());
  });

  test('Deve retornar uma exception quando o retorno for 4xx - Sucesso',
      () async {
    const path = 'https://pathteste.com.br/hello';
    dioAdapter.onGet(path, (server) => server.reply(404, word));
    expect(() async => await client.get(RestClientRequest(path: path)),
        throwsA(isA<RestClientException>()));
  });

  test('Deve retornar uma exception quando o retorno for 5xx - Sucesso',
      () async {
    const path = 'https://pathteste.com.br/hello';
    dioAdapter.onGet(path, (server) => server.reply(501, word));
    expect(() async => await client.get(RestClientRequest(path: path)),
        throwsA(isA<RestClientException>()));
  });
}

const word = [
  {
    "word": "hello",
    "phonetics": [
      {
        "audio":
            "https://api.dictionaryapi.dev/media/pronunciations/en/hello-au.mp3",
        "sourceUrl": "https://commons.wikimedia.org/w/index.php?curid=75797336",
        "license": {
          "name": "BY-SA 4.0",
          "url": "https://creativecommons.org/licenses/by-sa/4.0"
        }
      },
      {
        "text": "/həˈləʊ/",
        "audio":
            "https://api.dictionaryapi.dev/media/pronunciations/en/hello-uk.mp3",
        "sourceUrl": "https://commons.wikimedia.org/w/index.php?curid=9021983",
        "license": {
          "name": "BY 3.0 US",
          "url": "https://creativecommons.org/licenses/by/3.0/us"
        }
      },
      {"text": "/həˈloʊ/", "audio": ""}
    ],
    "meanings": [
      {
        "partOfSpeech": "noun",
        "definitions": [
          {
            "definition": "\"Hello!\" or an equivalent greeting.",
            "synonyms": [],
            "antonyms": []
          }
        ],
        "synonyms": ["greeting"],
        "antonyms": []
      },
      {
        "partOfSpeech": "verb",
        "definitions": [
          {
            "definition": "To greet with \"hello\".",
            "synonyms": [],
            "antonyms": []
          }
        ],
        "synonyms": [],
        "antonyms": []
      },
      {
        "partOfSpeech": "interjection",
        "definitions": [
          {
            "definition":
                "A greeting (salutation) said when meeting someone or acknowledging someone’s arrival or presence.",
            "synonyms": [],
            "antonyms": [],
            "example": "Hello, everyone."
          },
          {
            "definition": "A greeting used when answering the telephone.",
            "synonyms": [],
            "antonyms": [],
            "example": "Hello? How may I help you?"
          },
          {
            "definition":
                "A call for response if it is not clear if anyone is present or listening, or if a telephone conversation may have been disconnected.",
            "synonyms": [],
            "antonyms": [],
            "example": "Hello? Is anyone there?"
          },
          {
            "definition":
                "Used sarcastically to imply that the person addressed or referred to has done something the speaker or writer considers to be foolish.",
            "synonyms": [],
            "antonyms": [],
            "example":
                "You just tried to start your car with your cell phone. Hello?"
          },
          {
            "definition": "An expression of puzzlement or discovery.",
            "synonyms": [],
            "antonyms": [],
            "example": "Hello! What’s going on here?"
          }
        ],
        "synonyms": [],
        "antonyms": ["bye", "goodbye"]
      }
    ],
    "license": {
      "name": "CC BY-SA 3.0",
      "url": "https://creativecommons.org/licenses/by-sa/3.0"
    },
    "sourceUrls": ["https://en.wiktionary.org/wiki/hello"]
  }
];
