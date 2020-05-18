import 'dart:io' show File;
import 'dart:convert';
import 'dart:async';

main() {
  Solution obj = new Solution();
  obj.analyzeFile();
  //obj.calculateLineWithHighestFrequency();
  //obj.printHighestWordFrequencyAcrossLines();
}

class WordCount {
  List<String> words = new List();
  int count = 0;

  String toString() {
    return words.toString();
  }
}

class Solution {
  analyzeFile() {
    final file = new File('file.txt');
    Stream<List<int>> inputStream = file.openRead();

    int lineCount = 1;
    Map lineMap = new Map();

    inputStream
        .transform(utf8.decoder) // Decode bytes to UTF-8.
        .transform(new LineSplitter()) // Convert stream to individual lines.
        .listen((String line) {
      // Process results.
      WordCount wc = calculateLineWithHighestFrequency(line);

      lineMap[lineCount++] = wc;
    }, onDone: () {
      printHighestWordFrequencyAcrossLines(lineMap);
    }, onError: (e) {
      print(e.toString());
    });
  }

  void printHighestWordFrequencyAcrossLines(Map lineMap) {
    print("The following words have the highest word frequency per line:");
    for (int lineNo in lineMap.keys) {
      WordCount wc = lineMap[lineNo];
      String words = wc.words.toString();
      int count = wc.count;
      print("$words appeared in line # $lineNo: $count times");
    }
  }

  WordCount calculateLineWithHighestFrequency(String line) {
    List<String> words = line.split(" ");
    Map wordMap = new Map();
    for (String word in words) {
      wordMap[word] = wordMap[word] == null ? 1 : ++wordMap[word];
    }
    //print("wordMap ==> $wordMap");
    return getHighestCount(wordMap);
  }

  WordCount getHighestCount(Map wordMap) {
    var sortedKeys = wordMap.keys.toList(growable: false)
      ..sort((k1, k2) => wordMap[k1].compareTo(wordMap[k2]));

    var revKeys = sortedKeys.reversed;
    String hWord = revKeys.first;
    int hCount = wordMap[hWord];
    WordCount wCount = new WordCount();
    for (String key in sortedKeys) {
      if (wordMap[key] == hCount) {
        wCount.words.add(key);
        wCount.count = wordMap[key];
      }
    }

    // print(wCount);
    return wCount;
  }
}
