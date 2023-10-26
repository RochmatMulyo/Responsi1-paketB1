class ApiUrl {
  static const String baseUrl = 'https://responsi1b.dalhaqq.xyz/api/';

  static const String ListTugas = baseUrl + 'assignments';
  static const String createTugas = baseUrl + 'assignments';


  static String showTugas(int id) {
    return baseUrl + 'assignments/' + id.toString();
  }

  static String deleteTugas(int id){
    return baseUrl + 'assignments/' + id.toString() + '/delete';
  }
}
