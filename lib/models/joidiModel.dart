

class  JodiModel
{
  final int number;
  final int amount;
  const JodiModel({required this.number,required this.amount});

  Map<String,dynamic> toJson()
  {
    return {
      'jodiNum':number.toString().padLeft(2,'0'),
      'price':amount,
    };
  }
}