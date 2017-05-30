var _user$project$Native_Speakers = function () {
  var translations = {
    id: 'ID',
    location: 'Poloha',
    energy: 'Energie',
    el: 'Elektřina',
    wa: 'Voda'
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
