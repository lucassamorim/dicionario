import 'package:dicionario/app/features/single_word/data/adapters/word_details_adapter.dart';
import 'package:dicionario/app/features/single_word/domain/entities/word_details_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Deve retornar os datalhes da palavra hello', () {
    final response = WordDetailsAdapter.fromMap(hello[0]);
    expect(response, isA<WordDetailsEntity>());
  });

  test('Deve retornar os detalhes da palara word', () {
    final response = WordDetailsAdapter.fromMap(word[0]);
    expect(response, isA<WordDetailsEntity>());
  });

  test('Deve retornar o teste dos detalhes da palavra word', () {
    final response = WordDetailsAdapter.fromMap(wordLocalTeste);
    print(response);
  });
}

const hello = [
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

const word = [
  {
    "word": "word",
    "phonetic": "/wɜːd/",
    "phonetics": [
      {"text": "/wɜːd/", "audio": ""},
      {
        "text": "/wɝd/",
        "audio":
            "https://api.dictionaryapi.dev/media/pronunciations/en/word-us.mp3",
        "sourceUrl": "https://commons.wikimedia.org/w/index.php?curid=1197728",
        "license": {
          "name": "BY-SA 3.0",
          "url": "https://creativecommons.org/licenses/by-sa/3.0"
        }
      }
    ],
    "meanings": [
      {
        "partOfSpeech": "noun",
        "definitions": [
          {
            "definition":
                "The smallest unit of language that has a particular meaning and can be expressed by itself; the smallest discrete, meaningful unit of language. (contrast morpheme.)",
            "synonyms": [],
            "antonyms": []
          },
          {
            "definition": "Something like such a unit of language:",
            "synonyms": [],
            "antonyms": []
          },
          {
            "definition":
                "The fact or act of speaking, as opposed to taking action. .",
            "synonyms": [],
            "antonyms": []
          },
          {
            "definition":
                "Something that someone said; a comment, utterance; speech.",
            "synonyms": [],
            "antonyms": []
          },
          {
            "definition":
                "A watchword or rallying cry, a verbal signal (even when consisting of multiple words).",
            "synonyms": [],
            "antonyms": [],
            "example": "mum's the word"
          },
          {"definition": "A proverb or motto.", "synonyms": [], "antonyms": []},
          {
            "definition": "News; tidings (used without an article).",
            "synonyms": [],
            "antonyms": [],
            "example": "Have you had any word from John yet?"
          },
          {
            "definition":
                "An order; a request or instruction; an expression of will.",
            "synonyms": [],
            "antonyms": [],
            "example": "Don't fire till I give the word"
          },
          {
            "definition": "A promise; an oath or guarantee.",
            "synonyms": ["promise"],
            "antonyms": [],
            "example": "I give you my word that I will be there on time."
          },
          {
            "definition": "A brief discussion or conversation.",
            "synonyms": [],
            "antonyms": [],
            "example": "Can I have a word with you?"
          },
          {
            "definition": "(in the plural) See words.",
            "synonyms": [],
            "antonyms": [],
            "example":
                "There had been words between him and the secretary about the outcome of the meeting."
          },
          {
            "definition":
                "(sometimes Word) Communication from God; the message of the Christian gospel; the Bible, Scripture.",
            "synonyms": ["Bible", "word of God"],
            "antonyms": [],
            "example":
                "Her parents had lived in Botswana, spreading the word among the tribespeople."
          },
          {
            "definition": "(sometimes Word) Logos, Christ.",
            "synonyms": ["God", "Logos"],
            "antonyms": []
          }
        ],
        "synonyms": [
          "Bible",
          "word of God",
          "God",
          "Logos",
          "promise",
          "vocable"
        ],
        "antonyms": []
      },
      {
        "partOfSpeech": "verb",
        "definitions": [
          {
            "definition":
                "To say or write (something) using particular words; to phrase (something).",
            "synonyms": ["express", "phrase", "put into words", "state"],
            "antonyms": [],
            "example": "I’m not sure how to word this letter to the council."
          },
          {
            "definition": "To flatter with words, to cajole.",
            "synonyms": [],
            "antonyms": []
          },
          {
            "definition": "To ply or overpower with words.",
            "synonyms": [],
            "antonyms": []
          },
          {
            "definition": "To conjure with a word.",
            "synonyms": [],
            "antonyms": []
          },
          {
            "definition": "To speak, to use words; to converse, to discourse.",
            "synonyms": [],
            "antonyms": []
          }
        ],
        "synonyms": ["express", "phrase", "put into words", "state"],
        "antonyms": []
      },
      {
        "partOfSpeech": "interjection",
        "definitions": [
          {
            "definition":
                "Truth, indeed, that is the truth! The shortened form of the statement \"My word is my bond.\"",
            "synonyms": [],
            "antonyms": [],
            "example":
                "\"Yo, that movie was epic!\" / \"Word?\" (\"You speak the truth?\") / \"Word.\" (\"I speak the truth.\")"
          },
          {
            "definition":
                "(stereotypically) An abbreviated form of word up; a statement of the acknowledgment of fact with a hint of nonchalant approval.",
            "synonyms": [],
            "antonyms": []
          }
        ],
        "synonyms": [],
        "antonyms": []
      }
    ],
    "license": {
      "name": "CC BY-SA 3.0",
      "url": "https://creativecommons.org/licenses/by-sa/3.0"
    },
    "sourceUrls": ["https://en.wiktionary.org/wiki/word"]
  },
  {
    "word": "word",
    "phonetic": "/wɜːd/",
    "phonetics": [
      {"text": "/wɜːd/", "audio": ""},
      {
        "text": "/wɝd/",
        "audio":
            "https://api.dictionaryapi.dev/media/pronunciations/en/word-us.mp3",
        "sourceUrl": "https://commons.wikimedia.org/w/index.php?curid=1197728",
        "license": {
          "name": "BY-SA 3.0",
          "url": "https://creativecommons.org/licenses/by-sa/3.0"
        }
      }
    ],
    "meanings": [
      {
        "partOfSpeech": "verb",
        "definitions": [
          {
            "definition": "(except in set phrases) To be, become, betide.",
            "synonyms": [],
            "antonyms": [],
            "example": "Well worth thee, me friend."
          }
        ],
        "synonyms": [],
        "antonyms": []
      }
    ],
    "license": {
      "name": "CC BY-SA 3.0",
      "url": "https://creativecommons.org/licenses/by-sa/3.0"
    },
    "sourceUrls": [
      "https://en.wiktionary.org/wiki/word",
      "https://en.wiktionary.org/wiki/worth"
    ]
  }
];

const wordLocalTeste = {
  'word': 'word',
  'phonetics': [
    {
      'audio': '',
      'text': '/wɜːd/',
    },
    {
      'audio':
          'https://api.dictionaryapi.dev/media/pronunciations/en/word-us.mp3',
      'text': '/wɝd/'
    }
  ],
  'meanings': [
    {
      'partOfSpeech': 'noun',
      'antonyms': [],
      'synonyms': ['Bible, word of God, God, Logos, promise, vocable']
    },
    {
      'partOfSpeech': 'verb',
      'antonyms': [],
      'synonyms': ['express, phrase, put into words, state']
    },
    {'partOfSpeech': 'interjection', 'antonyms': [], 'synonyms': []}
  ]
};
