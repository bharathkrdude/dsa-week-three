void main() {
  Trie trie = Trie();
  trie.insert('amination');
  trie.insert('amity');
  trie.insert('america');
  trie.insert('bharath');
  print(trie.search('amity'));
  print(trie.search('Amity'));
  trie.display(trie.root,"");
  print("<----------------------------------------------->");
   trie.displayWordsStartingWith("ami");
}


class TrieNode {
  bool end = false;
  Map<String, TrieNode> children = {};
}


class Trie {
  TrieNode root = TrieNode();
  insert(String word) {
    TrieNode temp = root;
    for (var i = 0; i < word.length; i++) {
      String c = word[i];
      if (!temp.children.containsKey(c)) {
        temp.children[c] = TrieNode();
      }
      temp = temp.children[c]!;
    }
    temp.end = true;
  }


  bool search(String word) {
    TrieNode temp = root;
    for (int i = 0; i < word.length; i++) {
      String c = word[i];
      if (!temp.children.containsKey(c)) {
        return false;
      }
      temp = temp.children[c]!;
    }
    return temp.end;
  }


  display(TrieNode node, String word) {
    if (node.end) {
      print(word);
    }
    node.children.forEach((key, value) {
      display(value, word + key);
    });
  }
  displayWordsStartingWith(String letter) {
    TrieNode temp = root;
    String word = letter.toLowerCase();
    for (int i = 0; i < word.length; i++) {
      String c = word[i];
      if (!temp.children.containsKey(c)) {
        return;
      }
      temp = temp.children[c]!;
    }
   
    display(temp, word);
  }
  }
