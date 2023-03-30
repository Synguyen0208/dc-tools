class Paginate<T> {
  final List<T> data;
  final int currentPage;
  final int lastPage;

  Paginate({
    required this.data,
    required this.currentPage,
    required this.lastPage,
  });
}
