var _user$project$Native_Speakers = function () {
  var translations = {
    name: 'Název',
    location: 'Místo konání',
    date: 'Datum'
  };
  return {
    't': function(v) {
      var t = translations[v];
      if (t) {
        return t
      }
      return 'Missing translation: ' + v;
    }
  };
}();
