List<int> a = [1,2,3,4];
main() {
 print( a.firstWhere((int item) => item == 5 ,orElse: () => null));
}